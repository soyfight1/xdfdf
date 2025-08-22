#!/usr/bin/env python3

print("=" * 60)
print("RESOLVIENDO VAULT-DOOR-6")
print("=" * 60)

# Array de bytes del código Java
myBytes = [
    0x3b, 0x65, 0x21, 0xa , 0x38, 0x0 , 0x36, 0x1d,
    0xa , 0x3d, 0x61, 0x27, 0x11, 0x66, 0x27, 0xa ,
    0x21, 0x1d, 0x61, 0x3b, 0xa , 0x2d, 0x65, 0x27,
    0xa , 0x6c, 0x60, 0x37, 0x30, 0x60, 0x31, 0x36,
]

print(f"\n[1] Array myBytes (hex):")
print("  ", end="")
for i, b in enumerate(myBytes):
    print(f"0x{b:02x}", end=" ")
    if (i + 1) % 8 == 0:
        print("\n  ", end="")
print()

# La condición es: (passBytes[i] ^ 0x55) - myBytes[i] == 0
# Por lo tanto: passBytes[i] ^ 0x55 == myBytes[i]
# Despejando: passBytes[i] == myBytes[i] ^ 0x55

print("\n[2] Aplicando XOR con 0x55 para recuperar la contraseña:")
print("\n  myBytes[i] ^ 0x55 = passBytes[i]")
print("  ---------------------------------")

password_bytes = []
for i, byte_val in enumerate(myBytes):
    result = byte_val ^ 0x55
    char = chr(result)
    password_bytes.append(result)
    print(f"  0x{byte_val:02x} ^ 0x55 = 0x{result:02x} = {result:3d} = '{char}'")

# Construir la contraseña
password = ''.join(chr(b) for b in password_bytes)

print("\n" + "=" * 60)
print("CONTRASEÑA RECUPERADA:")
print(f"\nPassword: {password}")
print(f"Longitud: {len(password)} caracteres")
print(f"\nFlag completa: picoCTF{{{password}}}")
print("=" * 60)

# Verificación
print("\n[VERIFICACIÓN]")
print("Simulando el checkPassword de Java...")

def check_password(password):
    if len(password) != 32:
        print(f"  ✗ Longitud incorrecta: {len(password)} != 32")
        return False
    
    passBytes = [ord(c) for c in password]
    myBytes_check = [
        0x3b, 0x65, 0x21, 0xa , 0x38, 0x0 , 0x36, 0x1d,
        0xa , 0x3d, 0x61, 0x27, 0x11, 0x66, 0x27, 0xa ,
        0x21, 0x1d, 0x61, 0x3b, 0xa , 0x2d, 0x65, 0x27,
        0xa , 0x6c, 0x60, 0x37, 0x30, 0x60, 0x31, 0x36,
    ]
    
    for i in range(32):
        if ((passBytes[i] ^ 0x55) - myBytes_check[i]) != 0:
            print(f"  ✗ Error en byte {i}")
            return False
    
    print("  ✓ Todos los bytes coinciden")
    return True

if check_password(password):
    print("✓ Verificación exitosa - la contraseña es correcta")
else:
    print("✗ Error en la verificación")

# Explicación del XOR
print("\n[EXPLICACIÓN DEL XOR]")
print("XOR es una operación bit a bit con estas propiedades:")
print("  - A ^ B = C")
print("  - C ^ B = A (reversible)")
print("  - A ^ A = 0 (auto-cancelación)")
print("\nEn este caso:")
print("  - El código hace: (password ^ 0x55) == myBytes")
print("  - Para revertir: password == myBytes ^ 0x55")
print("\nEl valor 0x55 en binario es 01010101, que invierte bits alternados")

# Mostrar el patrón
print("\n[ANÁLISIS DEL PATRÓN]")
print("0x55 = 0b01010101")
print("XOR con 0x55 invierte los bits en posiciones pares (0,2,4,6)")
print(f"\nLa contraseña decodificada dice: '{password}'")