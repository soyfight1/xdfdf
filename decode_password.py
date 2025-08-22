#!/usr/bin/env python3

# Valor obtenido del oráculo (password * 2)
doubled_hex = "139afb6b2d22"
doubled_int = int(doubled_hex, 16)

print("=" * 70)
print("INTERPRETACIÓN CORRECTA DE LA CONTRASEÑA")
print("=" * 70)

print(f"\nValor del oráculo (password * 2):")
print(f"  Hex: {doubled_hex}")
print(f"  Decimal: {doubled_int}")

# Dividir por 2
password_int = doubled_int // 2
password_hex = hex(password_int)[2:]

print(f"\nContraseña (dividida por 2):")
print(f"  Decimal: {password_int}")
print(f"  Hex: {password_hex}")

# IMPORTANTE: La contraseña original probablemente era ASCII
# Necesito convertir el número a bytes y luego a ASCII
password_bytes = password_int.to_bytes((password_int.bit_length() + 7) // 8, 'big')
print(f"  Bytes: {password_bytes.hex()}")

# Intentar decodificar como ASCII
try:
    password_ascii = password_bytes.decode('ascii')
    print(f"  ASCII: {password_ascii}")
    password_found = password_ascii
except:
    print("  No es ASCII válido")
    # Tal vez el hex mismo es la contraseña
    password_found = password_hex

print("\n" + "=" * 70)
print("PROBANDO DESCIFRADO")
print("=" * 70)

import subprocess

# Probar diferentes interpretaciones
passwords_to_try = [
    password_hex,           # Hex directo
    password_ascii if 'password_ascii' in locals() else None,  # ASCII si existe
    password_bytes.hex(),   # Bytes como hex
]

for i, pwd in enumerate(passwords_to_try, 1):
    if pwd is None:
        continue
    print(f"\n[{i}] Probando contraseña: {pwd}")
    
    # Probar con OpenSSL
    cmd = f'openssl enc -aes-256-cbc -d -in /workspace/secret.enc -pass pass:{pwd}'
    result = subprocess.run(cmd, shell=True, capture_output=True)
    
    if result.returncode == 0:
        output = result.stdout
        try:
            output_text = output.decode('utf-8', errors='ignore')
        except:
            output_text = str(output)
            
        print(f"  ✓ Descifrado exitoso!")
        print(f"  Resultado: {output_text}")
        
        if 'picoCTF' in output_text:
            print(f"\n🏁 BANDERA ENCONTRADA: {output_text}")
            with open('/workspace/flag.txt', 'w') as f:
                f.write(output_text)
            break
    else:
        print(f"  ✗ Falló")

# También probar interpretando el hex como string directo
print("\n" + "=" * 70)
print("INTERPRETACIÓN ALTERNATIVA")
print("=" * 70)

# Tal vez la contraseña es literalmente el string hex
print(f"\nProbando '{password_hex}' como contraseña literal...")
cmd = f'echo -n "{password_hex}" | openssl enc -aes-256-cbc -d -in /workspace/secret.enc -kfile /dev/stdin 2>&1'
result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
if 'picoCTF' in result.stdout:
    print(f"✓ BANDERA: {result.stdout}")

# Otra opción: tal vez necesito NO dividir por 2
print(f"\nProbando sin dividir (usando {doubled_hex})...")
cmd = f'openssl enc -aes-256-cbc -d -in /workspace/secret.enc -pass pass:{doubled_hex} 2>&1'
result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
if 'picoCTF' in result.stdout:
    print(f"✓ BANDERA: {result.stdout}")