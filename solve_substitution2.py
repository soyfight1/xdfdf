#!/usr/bin/env python3
from collections import Counter
import re

print("=" * 60)
print("RESOLVIENDO SUBSTITUTION2 (sin puntuación)")
print("=" * 60)

# Leer el mensaje
with open('/workspace/message2.txt', 'r') as f:
    ciphertext = f.read().strip()

print(f"\n[1] Longitud del mensaje: {len(ciphertext)} caracteres")
print(f"Primeros 100: {ciphertext[:100]}...")
print(f"Últimos 100: ...{ciphertext[-100:]}")

# Análisis de frecuencia
print("\n[2] Análisis de frecuencia:")
freq_analysis = Counter(ciphertext.lower())
total_letters = sum(freq_analysis.values())

print("  Top 15 letras más frecuentes:")
print("  Letra | Frecuencia | Porcentaje | En inglés típico")
print("  ------|------------|------------|------------------")

# Frecuencias típicas en inglés
english_freq_order = 'ETAOINSHRDLCUMWFGYPBVKJXQZ'
english_freq_pct = {
    'E': 12.70, 'T': 9.06, 'A': 8.17, 'O': 7.51, 'I': 6.97,
    'N': 6.75, 'S': 6.33, 'H': 6.09, 'R': 5.99, 'D': 4.25,
    'L': 4.03, 'C': 2.78, 'U': 2.76, 'M': 2.41, 'W': 2.36
}

for i, (letter, count) in enumerate(freq_analysis.most_common(15)):
    if letter.isalpha():
        percentage = (count / total_letters) * 100
        expected = english_freq_order[i] if i < len(english_freq_order) else '?'
        expected_pct = english_freq_pct.get(expected, 0)
        print(f"    {letter}   |    {count:3d}     |   {percentage:5.2f}%   | {expected} ({expected_pct:.2f}%)")

# Patrones conocidos
print("\n[3] Patrones identificados:")
print(f"  - Final del mensaje: 'vqkmKFL' → 'picoCTF'")
print(f"  - Flag: vqkmKFL{{...}} → picoCTF{{...}}")

# Crear mapeo inicial
mapping = {}

# Del patrón vqkmKFL = picoCTF
mapping['v'] = 'p'
mapping['q'] = 'i'
mapping['k'] = 'c'
mapping['m'] = 'o'
mapping['K'] = 'C'
mapping['F'] = 'T'
mapping['L'] = 'F'

print("\n[4] Mapeo inicial:")
for k, v in sorted(mapping.items()):
    print(f"  {k} → {v}")

# Aplicar mapeo parcial
partial = ""
for char in ciphertext:
    if char.upper() in mapping:
        partial += mapping[char.upper()].upper() if char.isupper() else mapping[char.upper()].lower()
    else:
        partial += char

print(f"\n[5] Texto parcialmente descifrado (primeros 200 chars):")
print(f"  {partial[:200]}...")

# Buscar palabras comunes de 3 letras
print("\n[6] Analizando palabras de 3 letras:")
three_letter_words = re.findall(r'\b[a-zA-Z]{3}\b', partial)
word_freq = Counter(three_letter_words)
print("  Más frecuentes:")
for word, count in word_freq.most_common(10):
    print(f"    '{word}' ({count} veces)")

# fnj aparece mucho y podría ser "the"
if 'fnj' in ciphertext:
    mapping['f'] = 't'
    mapping['n'] = 'h'
    mapping['j'] = 'e'
    print("\n  Asumiendo 'fnj' = 'the'")

# xgy también aparece mucho, podría ser "and"
if 'xgy' in ciphertext:
    mapping['x'] = 'a'
    mapping['g'] = 'n'
    mapping['y'] = 'd'
    print("  Asumiendo 'xgy' = 'and'")

# haf podría ser "but"
if 'haf' in ciphertext:
    mapping['h'] = 'b'
    mapping['a'] = 'u'
    mapping['f'] = 't'  # Ya lo teníamos
    print("  Asumiendo 'haf' = 'but'")

# Aplicar mapeo mejorado
print("\n[7] Aplicando mapeo extendido:")
partial = ""
for char in ciphertext:
    if char.lower() in mapping:
        if char.isupper():
            partial += mapping[char.lower()].upper()
        else:
            partial += mapping[char.lower()]
    else:
        partial += char

print(f"  {partial[:300]}...")

# Analizar más contexto
# "kmuvafjd" aparece varias veces y parece ser "computer"
if 'kmuvafjd' in ciphertext:
    # k=c (ya lo tenemos), m=o (ya lo tenemos)
    mapping['u'] = 'm'
    mapping['v'] = 'p'  # Ya lo tenemos
    mapping['a'] = 'u'  # Ya lo tenemos
    mapping['f'] = 't'  # Ya lo tenemos
    mapping['j'] = 'e'  # Ya lo tenemos
    mapping['d'] = 'r'
    print("\n  'kmuvafjd' = 'computer'")

# "sjkadqft" debe ser "security"
if 'sjkadqft' in ciphertext:
    mapping['s'] = 's'
    mapping['j'] = 'e'  # Ya lo tenemos
    mapping['k'] = 'c'  # Ya lo tenemos
    mapping['a'] = 'u'  # Ya lo tenemos
    mapping['d'] = 'r'  # Ya lo tenemos
    mapping['q'] = 'i'  # Ya lo tenemos
    mapping['f'] = 't'  # Ya lo tenemos
    mapping['t'] = 'y'
    print("  'sjkadqft' = 'security'")

# "sknmmw" debe ser "school"
if 'sknmmw' in ciphertext:
    mapping['s'] = 's'  # Ya lo tenemos
    mapping['k'] = 'c'  # Ya lo tenemos
    mapping['n'] = 'h'  # Ya lo tenemos
    mapping['m'] = 'o'  # Ya lo tenemos
    mapping['w'] = 'l'
    print("  'sknmmw' = 'school'")

# "nqen" debe ser "high"
if 'nqen' in ciphertext:
    mapping['n'] = 'h'  # Ya lo tenemos
    mapping['q'] = 'i'  # Ya lo tenemos
    mapping['e'] = 'g'
    mapping['n'] = 'h'  # Ya lo tenemos
    print("  'nqen' = 'high'")

# "soqwws" debe ser "skills"
if 'soqwws' in ciphertext:
    mapping['s'] = 's'  # Ya lo tenemos
    mapping['o'] = 'k'
    mapping['q'] = 'i'  # Ya lo tenemos
    mapping['w'] = 'l'  # Ya lo tenemos
    mapping['s'] = 's'  # Ya lo tenemos
    print("  'soqwws' = 'skills'")

# "hjwqjpj" debe ser "believe"
if 'hjwqjpj' in ciphertext:
    mapping['h'] = 'b'  # Ya lo tenemos
    mapping['j'] = 'e'  # Ya lo tenemos
    mapping['w'] = 'l'  # Ya lo tenemos
    mapping['q'] = 'i'  # Ya lo tenemos
    mapping['j'] = 'e'  # Ya lo tenemos
    mapping['p'] = 'v'
    mapping['j'] = 'e'  # Ya lo tenemos
    print("  'hjwqjpj' = 'believe'")

# "sfayjgfs" debe ser "students"
if 'sfayjgfs' in ciphertext:
    mapping['s'] = 's'  # Ya lo tenemos
    mapping['f'] = 't'  # Ya lo tenemos
    mapping['a'] = 'u'  # Ya lo tenemos
    mapping['y'] = 'd'  # Ya lo tenemos
    mapping['j'] = 'e'  # Ya lo tenemos
    mapping['g'] = 'n'  # Ya lo tenemos
    mapping['f'] = 't'  # Ya lo tenemos
    mapping['s'] = 's'  # Ya lo tenemos
    print("  'sfayjgfs' = 'students'")

# Aplicar mapeo final
print("\n[8] Descifrando mensaje completo:")
decrypted = ""
unmapped = set()
for char in ciphertext:
    if char.lower() in mapping:
        if char.isupper():
            decrypted += mapping[char.lower()].upper()
        else:
            decrypted += mapping[char.lower()]
    else:
        if char.isalpha():
            decrypted += '?'
            unmapped.add(char.lower())
        else:
            decrypted += char

print(decrypted[:500] + "...")
print("..." + decrypted[-200:])

# Extraer la flag
print("\n[9] Extrayendo la flag:")
flag_match = re.search(r'picoCTF\{[^}]+\}', decrypted)
if flag_match:
    flag = flag_match.group()
    print(f"\n✓ FLAG ENCONTRADA: {flag}")
    
    # Verificar si hay caracteres no mapeados en la flag
    if '?' in flag:
        print("\n  ⚠ La flag contiene caracteres no mapeados")
        # Mostrar la flag cifrada para análisis
        flag_cipher = re.search(r'vqkmKFL\{[^}]+\}', ciphertext)
        if flag_cipher:
            print(f"  Flag cifrada: {flag_cipher.group()}")
else:
    print("\n✗ Flag no encontrada")

if unmapped:
    print(f"\n[10] Letras no mapeadas: {sorted(unmapped)}")

print("\n" + "=" * 60)