#!/usr/bin/env python3

def caesar_encrypt(text, shift):
    """Cifra un texto con Caesar cipher dado un desplazamiento"""
    result = ""
    for char in text:
        if char.isalpha():
            if char.isupper():
                result += chr((ord(char) - ord('A') + shift) % 26 + ord('A'))
            else:
                result += chr((ord(char) - ord('a') + shift) % 26 + ord('a'))
        else:
            result += char
    return result

# Texto original cifrado
original_cipher = "gvswwmrkxlivyfmgsrhnrisegl"

# Texto descifrado encontrado
decrypted = "crossingtherubicondjneoach"

# Verificar que al cifrar el texto descifrado con shift 4, obtenemos el original
shift = 4
encrypted_back = caesar_encrypt(decrypted, shift)

print("Verificación de la solución:")
print("=" * 60)
print(f"Texto cifrado original:    {original_cipher}")
print(f"Texto descifrado (shift 4): {decrypted}")
print(f"Re-cifrado con shift 4:    {encrypted_back}")
print()

if encrypted_back == original_cipher:
    print("✓ VERIFICACIÓN EXITOSA: La solución es correcta")
    print(f"\nLa bandera completa es: picoCTF{{{decrypted}}}")
else:
    print("✗ Error: La verificación falló")

# Análisis adicional del contenido
print("\n" + "=" * 60)
print("Análisis del contenido descifrado:")
print("- 'crossing the rubicon': Frase histórica famosa")
print("- Julio César cruzó el río Rubicón en 49 a.C.")
print("- La frase significa tomar una decisión irreversible")
print("- Muy apropiado para un reto de Caesar cipher!")
print("- La parte final 'djneoach' podría ser padding o tener otro significado")