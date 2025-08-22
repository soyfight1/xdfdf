#!/usr/bin/env python3

# Valor obtenido del oráculo (password * 2)
decrypted_value = 21556363996450
print(f"Valor descifrado (password * 2): {decrypted_value}")

# Verificar si es par
if decrypted_value % 2 == 0:
    password = decrypted_value // 2
    print(f"Es par, dividiendo por 2: {password}")
else:
    print("Es impar, esto no debería pasar con password * 2")
    
# Convertir a hex
password_hex = hex(password)[2:]
print(f"Password en hex: {password_hex}")

# Probar diferentes interpretaciones
print("\nPosibles interpretaciones:")

# 1. Como está
print(f"1. Directo: {password_hex}")

# 2. Con padding a 32 bytes (256 bits para AES-256)
padded = password_hex.ljust(64, '0')
print(f"2. Padding a 256 bits: {padded}")

# 3. Como ASCII
try:
    password_bytes = bytes.fromhex(password_hex)
    password_ascii = password_bytes.decode('ascii', errors='ignore')
    print(f"3. Como ASCII: {password_ascii}")
except:
    pass

# 4. El valor original sin dividir
original_hex = hex(decrypted_value)[2:]
print(f"4. Sin dividir: {original_hex}")

# Guardar todas las opciones
with open('/workspace/password_options.txt', 'w') as f:
    f.write(f"Opción 1 (dividido por 2): {password_hex}\n")
    f.write(f"Opción 2 (padding): {padded}\n")
    f.write(f"Opción 3 (sin dividir): {original_hex}\n")
    f.write(f"Opción 4 (ASCII): {password_ascii if 'password_ascii' in locals() else 'N/A'}\n")

print("\nOpciones guardadas en password_options.txt")
print("\nProbando descifrado con cada opción...")

import subprocess
import os

options = [
    password_hex,
    original_hex,
    padded[:32],  # Solo los primeros 32 caracteres
]

for i, opt in enumerate(options, 1):
    print(f"\n--- Opción {i}: {opt[:20]}... ---")
    cmd = f"openssl enc -aes-256-cbc -d -in /workspace/secret.enc -pass pass:{opt} 2>/dev/null"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode == 0:
        print(f"✓ ÉXITO con opción {i}!")
        print(f"Resultado: {result.stdout}")
        if 'picoCTF' in result.stdout:
            print(f"\n🏁 BANDERA ENCONTRADA: {result.stdout}")
            break
    else:
        print(f"✗ Falló")

# También probar con formato hexadecimal directo
print("\n--- Probando como clave hex directa ---")
for opt in [password_hex, original_hex]:
    # Padding a 64 caracteres (32 bytes = 256 bits)
    key = opt.ljust(64, '0')
    iv = '0' * 32  # IV de 16 bytes
    cmd = f"openssl enc -aes-256-cbc -d -in /workspace/secret.enc -K {key} -iv {iv} 2>/dev/null"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode == 0 and result.stdout:
        print(f"✓ ÉXITO con clave: {key[:20]}...")
        print(f"Resultado: {result.stdout}")
        if 'picoCTF' in result.stdout:
            print(f"\n🏁 BANDERA: {result.stdout}")
            break