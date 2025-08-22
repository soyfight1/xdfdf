#!/usr/bin/env python3

# La cadena objetivo después de las transformaciones
target = "jU5t_a_sna_3lpm18g947_u_4_m9r54f"

# Necesitamos encontrar la contraseña original que produce este target
# después de las transformaciones

print("=" * 60)
print("RESOLVIENDO VAULT-DOOR-3")
print("=" * 60)

print(f"\nTarget string: {target}")
print(f"Longitud: {len(target)}")

# Crear un array para la contraseña original
password = ['?'] * 32

# Ahora necesito revertir cada transformación
# Analizando cada bucle:

print("\n[1] Analizando transformaciones:")

# Bucle 1: for (i=0; i<8; i++) { buffer[i] = password.charAt(i); }
# buffer[0-7] = password[0-7]
print("\nBucle 1: buffer[0-7] = password[0-7]")
for i in range(8):
    password[i] = target[i]
    print(f"  password[{i}] = target[{i}] = '{target[i]}'")

# Bucle 2: for (; i<16; i++) { buffer[i] = password.charAt(23-i); }
# i va de 8 a 15
# buffer[8] = password[15], buffer[9] = password[14], ..., buffer[15] = password[8]
print("\nBucle 2: buffer[8-15] = password[23-i] donde i=8..15")
for i in range(8, 16):
    password[23-i] = target[i]
    print(f"  password[{23-i}] = target[{i}] = '{target[i]}'")

# Bucle 3: for (; i<32; i+=2) { buffer[i] = password.charAt(46-i); }
# i va de 16, 18, 20, 22, 24, 26, 28, 30
print("\nBucle 3: buffer[i pares 16-30] = password[46-i]")
for i in range(16, 32, 2):
    password[46-i] = target[i]
    print(f"  password[{46-i}] = target[{i}] = '{target[i]}'")

# Bucle 4: for (i=31; i>=17; i-=2) { buffer[i] = password.charAt(i); }
# i va de 31, 29, 27, 25, 23, 21, 19, 17
print("\nBucle 4: buffer[i impares 17-31] = password[i]")
for i in range(31, 16, -2):
    password[i] = target[i]
    print(f"  password[{i}] = target[{i}] = '{target[i]}'")

# Construir la contraseña
password_str = ''.join(password)

print("\n" + "=" * 60)
print("CONTRASEÑA RECUPERADA:")
print(f"\nPassword: {password_str}")
print(f"\nFlag completa: picoCTF{{{password_str}}}")
print("=" * 60)

# Verificación: simular el código Java
print("\n[VERIFICACIÓN]")
print("Simulando el código Java para verificar...")

def check_password(password):
    if len(password) != 32:
        return False
    
    buffer = [None] * 32
    
    # Bucle 1
    for i in range(8):
        buffer[i] = password[i]
    
    # Bucle 2
    for i in range(8, 16):
        buffer[i] = password[23-i]
    
    # Bucle 3
    for i in range(16, 32, 2):
        buffer[i] = password[46-i]
    
    # Bucle 4
    for i in range(31, 16, -2):
        buffer[i] = password[i]
    
    result = ''.join(buffer)
    return result == target

if check_password(password_str):
    print("✓ Verificación exitosa - la contraseña es correcta")
else:
    print("✗ Error en la verificación")

# Mostrar tabla de mapeo
print("\n[TABLA DE MAPEO]")
print("buffer_index -> password_index")
for i in range(32):
    if i < 8:
        print(f"  buffer[{i:2d}] <- password[{i:2d}]")
    elif i < 16:
        print(f"  buffer[{i:2d}] <- password[{23-i:2d}]")
    elif i % 2 == 0:
        print(f"  buffer[{i:2d}] <- password[{46-i:2d}]")
    else:
        print(f"  buffer[{i:2d}] <- password[{i:2d}]")