#!/usr/bin/env python3
from collections import Counter
import re

print("=" * 60)
print("RESOLVIENDO SUBSTITUTION1")
print("=" * 60)

# Leer el mensaje
with open('/workspace/message1.txt', 'r') as f:
    ciphertext = f.read()

print("\n[1] Mensaje cifrado (primeros 100 caracteres):")
print(f"  {ciphertext[:100]}...")

# Análisis de frecuencia
print("\n[2] Análisis de frecuencia de letras:")
# Solo contar letras, no puntuación
letters_only = re.findall(r'[A-Za-z]', ciphertext)
freq_analysis = Counter(letters_only)
total_letters = len(letters_only)

# Mostrar las 10 letras más frecuentes
print("  Letra | Frecuencia | Porcentaje")
print("  ------|------------|------------")
for letter, count in freq_analysis.most_common(10):
    percentage = (count / total_letters) * 100
    print(f"    {letter}   |    {count:3d}     |   {percentage:5.2f}%")

# Frecuencias típicas en inglés (aproximadas)
english_freq = {
    'E': 12.70, 'T': 9.06, 'A': 8.17, 'O': 7.51, 'I': 6.97,
    'N': 6.75, 'S': 6.33, 'H': 6.09, 'R': 5.99, 'D': 4.25,
    'L': 4.03, 'C': 2.78, 'U': 2.76, 'M': 2.41, 'W': 2.36,
    'F': 2.23, 'G': 2.02, 'Y': 1.97, 'P': 1.93, 'B': 1.29,
    'V': 0.98, 'K': 0.77, 'J': 0.15, 'X': 0.15, 'Q': 0.10, 'Z': 0.07
}

print("\n[3] Análisis de patrones conocidos:")

# Sabemos que:
# - "SYTe" probablemente es "CTFs"
# - "bzskSYT" probablemente es "picoCTF"
# - "yar" probablemente es "the"
# - "thjm" probablemente es "flag"

# Crear mapeo inicial basado en patrones conocidos
mapping = {}

# De "bzskSYT" = "picoCTF"
mapping['b'] = 'p'
mapping['z'] = 'i'
mapping['s'] = 'c'
mapping['k'] = 'o'
mapping['S'] = 'C'
mapping['Y'] = 'T'
mapping['T'] = 'F'

# De "thjm" = "flag"
mapping['t'] = 'f'
mapping['h'] = 'l'
mapping['j'] = 'a'
mapping['m'] = 'g'

# De "yar" = "the"
mapping['y'] = 't'
mapping['a'] = 'h'
mapping['r'] = 'e'

print("  Mapeo inicial encontrado:")
for cipher, plain in sorted(mapping.items()):
    print(f"    {cipher} → {plain}")

# Aplicar el mapeo parcial
print("\n[4] Aplicando mapeo parcial:")
partial_decrypt = ""
for char in ciphertext:
    if char.lower() in mapping:
        if char.isupper():
            partial_decrypt += mapping[char.lower()].upper()
        else:
            partial_decrypt += mapping[char.lower()]
    else:
        partial_decrypt += char

print(f"  {partial_decrypt[:200]}...")

# Buscar palabras comunes para completar el mapeo
print("\n[5] Analizando palabras parcialmente descifradas:")

# Buscar palabras de 3 letras
three_letter_words = re.findall(r'\b[A-Za-z]{3}\b', partial_decrypt)
word_freq = Counter(three_letter_words)
print("  Palabras de 3 letras más frecuentes:")
for word, count in word_freq.most_common(5):
    print(f"    '{word}' ({count} veces)")

# Continuar completando el mapeo
# "jdr" aparece mucho y podría ser "are"
mapping['d'] = 'r'

# "jcq" podría ser "and"
mapping['c'] = 'n'
mapping['q'] = 'd'

# "tkd" podría ser "for"
mapping['k'] = 'o'  # Ya lo teníamos
mapping['d'] = 'r'  # Ya lo teníamos

# "gzya" podría ser "with"
mapping['g'] = 'w'
mapping['z'] = 'i'  # Ya lo teníamos
mapping['y'] = 't'  # Ya lo teníamos
mapping['a'] = 'h'  # Ya lo teníamos

# Aplicar mapeo actualizado
print("\n[6] Aplicando mapeo mejorado:")
partial_decrypt = ""
for char in ciphertext:
    if char.lower() in mapping:
        if char.isupper():
            partial_decrypt += mapping[char.lower()].upper()
        else:
            partial_decrypt += mapping[char.lower()]
    else:
        partial_decrypt += char

print(f"  {partial_decrypt[:300]}...")

# Completar más letras analizando el contexto
# "ersndzyo" debe ser "security"
mapping['e'] = 's'
mapping['n'] = 'u'
mapping['d'] = 'r'  # Ya lo teníamos
mapping['z'] = 'i'  # Ya lo teníamos
mapping['o'] = 'y'

# "skxbnyrd" debe ser "computer"
mapping['s'] = 'c'  # Ya lo teníamos
mapping['k'] = 'o'  # Ya lo teníamos
mapping['x'] = 'm'
mapping['b'] = 'p'  # Ya lo teníamos
mapping['n'] = 'u'  # Ya lo teníamos
mapping['y'] = 't'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['d'] = 'r'  # Ya lo teníamos

# "bdrercyrq" debe ser "presented"
mapping['b'] = 'p'  # Ya lo teníamos
mapping['d'] = 'r'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['e'] = 's'  # Ya lo teníamos
mapping['c'] = 'n'  # Ya lo teníamos
mapping['y'] = 't'  # Ya lo teníamos
mapping['q'] = 'd'  # Ya lo teníamos

# "evzhhe" debe ser "skills"
mapping['e'] = 's'  # Ya lo teníamos
mapping['v'] = 'k'
mapping['z'] = 'i'  # Ya lo teníamos
mapping['h'] = 'l'  # Ya lo teníamos
mapping['e'] = 's'  # Ya lo teníamos

# "sajhhrcmr" debe ser "challenge"
mapping['s'] = 'c'  # Ya lo teníamos
mapping['a'] = 'h'  # Ya lo teníamos
mapping['j'] = 'a'  # Ya lo teníamos
mapping['h'] = 'l'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['c'] = 'n'  # Ya lo teníamos
mapping['m'] = 'g'  # Ya lo teníamos

# "bdklhrx" debe ser "problem"
mapping['b'] = 'p'  # Ya lo teníamos
mapping['d'] = 'r'  # Ya lo teníamos
mapping['k'] = 'o'  # Ya lo teníamos
mapping['l'] = 'b'
mapping['h'] = 'l'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['x'] = 'm'  # Ya lo teníamos

# "cnxlrd" debe ser "number"
mapping['c'] = 'n'  # Ya lo teníamos
mapping['n'] = 'u'  # Ya lo teníamos
mapping['x'] = 'm'  # Ya lo teníamos
mapping['l'] = 'b'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['d'] = 'r'  # Ya lo teníamos

# "ekhwrq" debe ser "solved"
mapping['e'] = 's'  # Ya lo teníamos
mapping['k'] = 'o'  # Ya lo teníamos
mapping['h'] = 'l'  # Ya lo teníamos
mapping['w'] = 'v'
mapping['r'] = 'e'  # Ya lo teníamos
mapping['q'] = 'd'  # Ya lo teníamos

# "enlxzyyrq" debe ser "submitted"
mapping['e'] = 's'  # Ya lo teníamos
mapping['n'] = 'u'  # Ya lo teníamos
mapping['l'] = 'b'  # Ya lo teníamos
mapping['x'] = 'm'  # Ya lo teníamos
mapping['z'] = 'i'  # Ya lo teníamos
mapping['y'] = 't'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['q'] = 'd'  # Ya lo teníamos

# "erdwzsr" debe ser "service"
mapping['e'] = 's'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['d'] = 'r'  # Ya lo teníamos
mapping['w'] = 'v'  # Ya lo teníamos
mapping['z'] = 'i'  # Ya lo teníamos
mapping['s'] = 'c'  # Ya lo teníamos

# "rcwzdkcxrcy" debe ser "environment"
mapping['r'] = 'e'  # Ya lo teníamos
mapping['c'] = 'n'  # Ya lo teníamos
mapping['w'] = 'v'  # Ya lo teníamos
mapping['z'] = 'i'  # Ya lo teníamos
mapping['d'] = 'r'  # Ya lo teníamos
mapping['k'] = 'o'  # Ya lo teníamos
mapping['x'] = 'm'  # Ya lo teníamos
mapping['r'] = 'e'  # Ya lo teníamos
mapping['c'] = 'n'  # Ya lo teníamos
mapping['y'] = 't'  # Ya lo teníamos

# Aplicar mapeo completo
print("\n[7] Descifrando mensaje completo:")
decrypted = ""
for char in ciphertext:
    if char.lower() in mapping:
        if char.isupper():
            decrypted += mapping[char.lower()].upper()
        else:
            decrypted += mapping[char.lower()]
    else:
        if char.isalpha():
            decrypted += '?'  # Letra no mapeada
        else:
            decrypted += char

print(decrypted)

# Extraer la flag
print("\n[8] Extrayendo la flag:")
flag_match = re.search(r'picoCTF\{[^}]+\}', decrypted)
if flag_match:
    print(f"\n✓ FLAG ENCONTRADA: {flag_match.group()}")
else:
    print("\n✗ Flag no encontrada completamente")
    # Buscar la parte de la flag
    flag_part = re.search(r'picoC[^}]+\}', decrypted)
    if flag_part:
        print(f"  Parte de la flag: {flag_part.group()}")

print("\n" + "=" * 60)