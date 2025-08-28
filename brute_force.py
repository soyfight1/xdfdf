#!/usr/bin/env python3

import subprocess
import string

# Sabemos que la longitud debe ser 27 (26 + newline)
# Y debe empezar con "picoCTF{"

def test_password(password):
    """Prueba una contraseña con el binario"""
    try:
        result = subprocess.run(
            ['./perplexed'],
            input=password.encode() + b'\n',
            capture_output=True,
            timeout=1
        )
        output = result.stdout.decode()
        return "Correct" in output
    except:
        return False

# Intentar con diferentes combinaciones basadas en los patrones observados
# Los bytes cifrados contienen: u#{a
# Esto podría ser parte de la flag

# Construir flag carácter por carácter
known = "picoCTF{"
charset = string.ascii_letters + string.digits + "_}"

print("Intentando fuerza bruta parcial...")

# Probar algunas flags comunes de CTF
test_flags = [
    "picoCTF{u#{a}",
    "picoCTF{perplexed}",
    "picoCTF{xor_cipher}",
    "picoCTF{bit_manipulation}",
    "picoCTF{reverse_engineering}",
]

for flag in test_flags:
    # Ajustar a 26 caracteres
    if len(flag) < 26:
        flag = flag + "_" * (26 - len(flag))
    elif len(flag) > 26:
        flag = flag[:26]
    
    if test_password(flag):
        print(f"¡ENCONTRADA!: {flag}")
        break
    else:
        print(f"Probando: {flag[:20]}... - Incorrecta")

# Si no encontramos con las pruebas básicas, intentar decodificar los bytes
print("\nAnalizando los bytes cifrados más detalladamente...")

import struct

# Los valores hardcodeados
vals = [0x617b2375f81ea7e1, 0xd269df5b5afc9db9, 0xf467edf4ed1bfed2]

# Intentar diferentes interpretaciones
print("\n=== Interpretación como caracteres directos ===")
for v in vals:
    bytes_val = struct.pack('<Q', v)
    ascii_chars = ""
    for b in bytes_val:
        if 32 <= b <= 126:
            ascii_chars += chr(b)
        else:
            ascii_chars += f"\\x{b:02x}"
    print(f"{hex(v)}: {ascii_chars}")

# Los caracteres visibles son: u # { a
# Esto sugiere que la flag podría contener estos caracteres

print("\n=== Buscando el patrón correcto ===")

# Basándome en el debug info
# u:877492 podría significar que 'u' está en la posición 877492 % 27 = alguna posición
# c:458 podría significar que hay un carácter en posición 458 % 27
# i:296160 similar

positions = {
    877492 % 27: 'u',
    458 % 27: 'c',
    296160 % 27: 'i'
}

print(f"Posiciones calculadas del debug info: {positions}")

# Construir una flag basada en esto
flag_attempt = ['_'] * 26
flag_attempt[0:8] = list("picoCTF{")
flag_attempt[-1] = '}'

# Insertar los caracteres conocidos
for pos, char in positions.items():
    if 8 <= pos < 25:  # Dentro del contenido de la flag
        flag_attempt[pos] = char

print(f"Flag parcial: {''.join(flag_attempt)}")

# Ahora intentar completar los espacios vacíos
# Los caracteres u#{a sugieren algo relacionado con caracteres especiales

# Probar con variaciones
test_patterns = [
    "u#_special_{a}",
    "use_#_and_{a}",
    "u#{and}a",
    "unicode_#a",
]

for pattern in test_patterns:
    test_flag = "picoCTF{" + pattern + "}"
    # Ajustar longitud
    if len(test_flag) < 26:
        test_flag = test_flag[:-1] + "_" * (26 - len(test_flag)) + "}"
    elif len(test_flag) > 26:
        test_flag = test_flag[:25] + "}"
    
    print(f"Probando: {test_flag}")
    if test_password(test_flag):
        print(f"¡¡¡ENCONTRADA!!!: {test_flag}")
        break