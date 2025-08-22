#!/usr/bin/env python3

print("=" * 60)
print("RESOLVIENDO VAULT-DOOR-4")
print("=" * 60)

# Array de bytes del código Java en diferentes bases
myBytes = []

# Línea 1: Decimales
decimals = [106, 85, 53, 116, 95, 52, 95, 98]
print("\n[1] Valores decimales:")
for val in decimals:
    myBytes.append(val)
    print(f"  {val:3d} -> '{chr(val)}' (ASCII)")

# Línea 2: Hexadecimales
hexadecimals = [0x55, 0x6e, 0x43, 0x68, 0x5f, 0x30, 0x66, 0x5f]
print("\n[2] Valores hexadecimales:")
for i, val in enumerate(hexadecimals):
    myBytes.append(val)
    print(f"  0x{val:02x} -> {val:3d} -> '{chr(val)}' (ASCII)")

# Línea 3: Octales (en Python se usa 0o en lugar de solo 0)
octals = [0o142, 0o131, 0o164, 0o63, 0o163, 0o137, 0o143, 0o61]
print("\n[3] Valores octales:")
for i, val in enumerate(octals):
    myBytes.append(val)
    print(f"  0o{oct(val)[2:]:3s} -> {val:3d} -> '{chr(val)}' (ASCII)")

# Línea 4: Caracteres directos
chars = ['9', '4', 'f', '7', '4', '5', '8', 'e']
print("\n[4] Caracteres directos:")
for char in chars:
    val = ord(char)
    myBytes.append(val)
    print(f"  '{char}' -> {val:3d} (ASCII)")

# Construir la contraseña
password = ''.join(chr(b) for b in myBytes)

print("\n" + "=" * 60)
print("CONTRASEÑA DECODIFICADA:")
print(f"\nPassword: {password}")
print(f"Longitud: {len(password)} caracteres")
print(f"\nFlag completa: picoCTF{{{password}}}")
print("=" * 60)

# Verificación
print("\n[VERIFICACIÓN]")
print("Comprobando que todos los bytes coinciden...")

# Simular el checkPassword de Java
def check_password(password):
    passBytes = [ord(c) for c in password]
    
    # El array myBytes original
    expected = [
        106, 85, 53, 116, 95, 52, 95, 98,
        0x55, 0x6e, 0x43, 0x68, 0x5f, 0x30, 0x66, 0x5f,
        0o142, 0o131, 0o164, 0o63, 0o163, 0o137, 0o143, 0o61,
        ord('9'), ord('4'), ord('f'), ord('7'), ord('4'), ord('5'), ord('8'), ord('e')
    ]
    
    if len(passBytes) != 32:
        return False
    
    for i in range(32):
        if passBytes[i] != expected[i]:
            return False
    
    return True

if check_password(password):
    print("✓ Verificación exitosa - la contraseña es correcta")
else:
    print("✗ Error en la verificación")

# Mostrar tabla ASCII de referencia
print("\n[TABLA ASCII DE REFERENCIA]")
print("Mostrando los caracteres relevantes:")
print("\nDecimal | Hex  | Octal | Char")
print("--------|------|-------|------")
for b in myBytes:
    print(f"  {b:3d}   | 0x{b:02x} | 0o{oct(b)[2:]:3s} | '{chr(b)}'")

# Análisis del mensaje
print("\n[ANÁLISIS DEL MENSAJE]")
print(f"La contraseña decodificada es: '{password}'")
print("Parece ser leetspeak/texto codificado que dice algo sobre 'bytes'!")