#!/usr/bin/env python3

def caesar_decrypt(text, shift):
    """Descifra un texto con Caesar cipher dado un desplazamiento"""
    result = ""
    for char in text:
        if char.isalpha():
            # Determinar si es mayúscula o minúscula
            if char.isupper():
                # Desplazar dentro del rango A-Z
                result += chr((ord(char) - ord('A') - shift) % 26 + ord('A'))
            else:
                # Desplazar dentro del rango a-z
                result += chr((ord(char) - ord('a') - shift) % 26 + ord('a'))
        else:
            # Mantener caracteres no alfabéticos sin cambios
            result += char
    return result

# Texto cifrado extraído del archivo
ciphertext = "gvswwmrkxlivyfmgsrhnrisegl"

print("Probando todos los desplazamientos Caesar (1-25):")
print("=" * 60)

for shift in range(1, 26):
    decrypted = caesar_decrypt(ciphertext, shift)
    print(f"Shift {shift:2d}: {decrypted}")
    
    # Verificar si el resultado contiene palabras comunes en inglés
    common_words = ['the', 'and', 'cross', 'rubicon', 'flag', 'crypto', 'cipher']
    for word in common_words:
        if word in decrypted.lower():
            print(f"    *** POSIBLE SOLUCIÓN - contiene '{word}' ***")

print("\n" + "=" * 60)
print("\nBuscando el más probable (ROT13 es común en CTFs):")
rot13_result = caesar_decrypt(ciphertext, 13)
print(f"ROT13 (shift 13): {rot13_result}")