#!/usr/bin/env python3

print("=" * 60)
print("RESOLVIENDO SUBSTITUTION0")
print("=" * 60)

# Leer el archivo
with open('/workspace/message.txt', 'r') as f:
    lines = f.readlines()

# La primera línea es la clave de sustitución
substitution_key = lines[0].strip()
print(f"\n[1] Clave de sustitución encontrada:")
print(f"  {substitution_key}")
print(f"  Longitud: {len(substitution_key)}")

# Verificar que sea el alfabeto completo
if len(substitution_key) == 26:
    print("  ✓ Clave válida (26 caracteres)")
else:
    print("  ✗ Clave inválida")

# Crear el mapeo de sustitución
# El alfabeto normal es ABCDEFGHIJKLMNOPQRSTUVWXYZ
# La clave es         ZGSOCXPQUYHMILERVTBWNAFJDK
normal_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
cipher_alphabet = substitution_key

# Crear diccionarios de mapeo
# Para descifrar: cipher -> normal
decrypt_map = {}
for i in range(26):
    decrypt_map[cipher_alphabet[i]] = normal_alphabet[i]
    decrypt_map[cipher_alphabet[i].lower()] = normal_alphabet[i].lower()

print("\n[2] Tabla de sustitución (cifrado → descifrado):")
print("  Cifrado:  " + cipher_alphabet)
print("  Original: " + normal_alphabet)

# Descifrar el mensaje
print("\n[3] Descifrando el mensaje...")
print("\n" + "-" * 60)

decrypted_lines = []
for line in lines[1:]:  # Saltar la primera línea (la clave)
    decrypted = ""
    for char in line:
        if char.upper() in decrypt_map:
            decrypted += decrypt_map[char]
        else:
            decrypted += char  # Mantener puntuación y espacios
    decrypted_lines.append(decrypted)
    print(decrypted, end='')

print("-" * 60)

# Buscar la flag
print("\n[4] Extrayendo la flag...")
for line in decrypted_lines:
    if 'picoCTF' in line:
        import re
        flag_match = re.search(r'picoCTF\{[^}]+\}', line)
        if flag_match:
            flag = flag_match.group()
            print(f"\n✓ FLAG ENCONTRADA: {flag}")
            break

# Análisis del texto
print("\n[5] Análisis del texto descifrado:")
full_text = ''.join(decrypted_lines)
if "beetle" in full_text.lower() or "insect" in full_text.lower():
    print("  El texto parece ser sobre un escarabajo/insecto")
if "jupiter" in full_text.lower():
    print("  Menciona a Júpiter")
if "flag is" in full_text.lower():
    print("  Contiene 'The flag is' al final")

# Verificar la sustitución inversa
print("\n[6] Verificación:")
test_cipher = "Wqc xmzp ub"
test_plain = ""
for char in test_cipher:
    if char.upper() in decrypt_map:
        test_plain += decrypt_map[char]
    else:
        test_plain += char
print(f"  '{test_cipher}' → '{test_plain}'")
if test_plain.lower() == "the flag is":
    print("  ✓ Verificación exitosa")

print("\n" + "=" * 60)