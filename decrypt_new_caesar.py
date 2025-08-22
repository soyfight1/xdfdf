#!/usr/bin/env python3
import string

LOWERCASE_OFFSET = ord("a")
ALPHABET = string.ascii_lowercase[:16]  # "abcdefghijklmnop"

def unshift(c, k):
    """Revierte el shift Caesar"""
    t1 = ord(c) - LOWERCASE_OFFSET
    t2 = ord(k) - LOWERCASE_OFFSET
    return ALPHABET[(t1 - t2) % len(ALPHABET)]

def b16_decode(enc):
    """Decodifica de base16 a ASCII"""
    plain = ""
    # Procesar de a pares de caracteres
    for i in range(0, len(enc), 2):
        if i+1 < len(enc):
            # Convertir cada letra a su índice en el alfabeto (0-15)
            b1 = ALPHABET.index(enc[i])
            b2 = ALPHABET.index(enc[i+1])
            # Combinar los dos nibbles (4 bits cada uno) en un byte
            byte_val = (b1 << 4) | b2
            # Convertir a carácter ASCII
            plain += chr(byte_val)
    return plain

# Texto cifrado
ciphertext = "lkmjkemjmkiekeijiiigljlhilihliikiliginliljimiklligljiflhiniiiniiihlhilimlhijil"

print("=" * 70)
print("DESCIFRANDO NEW CAESAR")
print("=" * 70)
print(f"\nTexto cifrado: {ciphertext}")
print(f"Longitud: {len(ciphertext)} caracteres")
print(f"Alfabeto: {ALPHABET} (16 letras)")

print("\n" + "=" * 70)
print("PROBANDO TODAS LAS CLAVES POSIBLES (a-p):")
print("=" * 70)

# Probar cada posible clave
for key_char in ALPHABET:
    # Revertir el shift para cada carácter
    unshifted = ""
    for i, c in enumerate(ciphertext):
        unshifted += unshift(c, key_char)
    
    # Intentar decodificar de base16
    try:
        decoded = b16_decode(unshifted)
        
        # Verificar si el resultado es imprimible y tiene sentido
        if all(32 <= ord(c) <= 126 for c in decoded):
            print(f"\nClave '{key_char}':")
            print(f"  Después de unshift: {unshifted[:40]}...")
            print(f"  Decodificado: {decoded}")
            
            # Verificar si parece ser la bandera
            if "flag" in decoded.lower() or "ctf" in decoded.lower() or any(word in decoded.lower() for word in ["the", "and", "you", "this", "that"]):
                print(f"  ⭐ POSIBLE BANDERA ENCONTRADA!")
                print(f"\n{'='*70}")
                print(f"🎯 RESULTADO FINAL:")
                print(f"   Clave: {key_char}")
                print(f"   Texto descifrado: {decoded}")
                print(f"   Bandera: picoCTF{{{decoded}}}")
                print("=" * 70)
                
    except Exception as e:
        # Si hay error al decodificar, esta no es la clave correcta
        pass

print("\n" + "=" * 70)
print("ANÁLISIS ADICIONAL")
print("=" * 70)

# Verificar la distribución de caracteres en el texto cifrado
char_count = {}
for c in ciphertext:
    char_count[c] = char_count.get(c, 0) + 1

print("\nDistribución de caracteres en el texto cifrado:")
for char in sorted(char_count.keys()):
    print(f"  {char}: {char_count[char]:3d} veces")

# Verificar que todos los caracteres están en el alfabeto
all_in_alphabet = all(c in ALPHABET for c in ciphertext)
print(f"\n¿Todos los caracteres están en el alfabeto de 16 letras? {all_in_alphabet}")