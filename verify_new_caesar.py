#!/usr/bin/env python3
import string

LOWERCASE_OFFSET = ord("a")
ALPHABET = string.ascii_lowercase[:16]

def b16_encode(plain):
    """Codifica texto a base16 (igual que el script original)"""
    enc = ""
    for c in plain:
        binary = "{0:08b}".format(ord(c))
        enc += ALPHABET[int(binary[:4], 2)]
        enc += ALPHABET[int(binary[4:], 2)]
    return enc

def shift(c, k):
    """Aplica shift Caesar (igual que el script original)"""
    t1 = ord(c) - LOWERCASE_OFFSET
    t2 = ord(k) - LOWERCASE_OFFSET
    return ALPHABET[(t1 + t2) % len(ALPHABET)]

# Solución encontrada
plaintext = "et_tu?_431db62c5618cd75f1d0b83832b67b46"
key = "f"
original_ciphertext = "lkmjkemjmkiekeijiiigljlhilihliikiliginliljimiklligljiflhiniiiniiihlhilimlhijil"

print("=" * 70)
print("VERIFICACIÓN DE LA SOLUCIÓN")
print("=" * 70)

print(f"\nTexto plano encontrado: {plaintext}")
print(f"Clave encontrada: {key}")

# Paso 1: Codificar a base16
b16 = b16_encode(plaintext)
print(f"\nPaso 1 - Base16 encoding: {b16[:40]}...")

# Paso 2: Aplicar shift con la clave
enc = ""
for i, c in enumerate(b16):
    enc += shift(c, key[i % len(key)])

print(f"Paso 2 - Después del shift: {enc[:40]}...")

# Verificar si coincide
print(f"\n{'='*70}")
print("COMPARACIÓN:")
print(f"Cifrado original:  {original_ciphertext}")
print(f"Cifrado recreado:  {enc}")
print(f"\n¿Coinciden? {enc == original_ciphertext}")

if enc == original_ciphertext:
    print("\n✅ VERIFICACIÓN EXITOSA")
    print(f"🏁 BANDERA CONFIRMADA: picoCTF{{{plaintext}}}")
else:
    print("\n❌ No coinciden, revisando...")
    
print(f"\n{'='*70}")
print("ANÁLISIS DEL CONTENIDO:")
print(f"- 'et_tu?' es la famosa frase latina '¿Tú también?'")
print(f"- Atribuida a Julio César cuando fue traicionado por Bruto")
print(f"- Perfecta referencia para un reto de Caesar cipher")
print(f"- El resto (431db62c5618cd75f1d0b83832b67b46) parece ser un hash")