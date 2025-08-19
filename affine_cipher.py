#!/usr/bin/env python3

def char_to_num(c):
    """Convierte letra A-Z a número 0-25"""
    return ord(c.upper()) - ord('A')

def num_to_char(n):
    """Convierte número 0-25 a letra"""
    return chr((n % 26) + ord('A'))

def encrypt(text, a, b):
    """Cifra con f(x) = ax + b mod 26"""
    result = ""
    for char in text.upper():
        x = char_to_num(char)
        y = (a * x + b) % 26
        result += num_to_char(y)
    return result

def mod_inverse(a, m):
    """Encuentra el inverso modular de a mod m usando algoritmo extendido de Euclides"""
    def extended_gcd(a, b):
        if a == 0:
            return b, 0, 1
        gcd, x1, y1 = extended_gcd(b % a, a)
        x = y1 - (b // a) * x1
        y = x1
        return gcd, x, y
    
    gcd, x, _ = extended_gcd(a % m, m)
    if gcd != 1:
        return None  # No existe inverso
    return (x % m + m) % m

def find_decryption_function(a, b):
    """Encuentra g(y) = a'y + b' tal que g(f(x)) = x"""
    # Para función afín: f(x) = ax + b mod 26
    # La inversa es: g(y) = a^(-1)(y - b) mod 26
    # Que se puede escribir como: g(y) = a^(-1)y + (-a^(-1)b) mod 26
    
    a_inv = mod_inverse(a, 26)
    if a_inv is None:
        return None, None
    
    # g(y) = a_inv * y + b_prime
    # donde b_prime = -a_inv * b mod 26
    b_prime = (-a_inv * b) % 26
    
    return a_inv, b_prime

def decrypt(text, a, b):
    """Descifra con g(y) = ay + b mod 26"""
    result = ""
    for char in text.upper():
        y = char_to_num(char)
        x = (a * y + b) % 26
        result += num_to_char(x)
    return result

# PARTE 1: Cifrar GOOGLE con f(x) = 21x + 11 mod 26
print("="*60)
print("PARTE 1: CIFRADO")
print("="*60)

word_to_encrypt = "GOOGLE"
a_encrypt = 21
b_encrypt = 11

print(f"Palabra a cifrar: {word_to_encrypt}")
print(f"Función de cifrado: f(x) = {a_encrypt}x + {b_encrypt} mod 26")
print()

# Mostrar proceso paso a paso
encrypted = ""
for char in word_to_encrypt:
    x = char_to_num(char)
    y = (a_encrypt * x + b_encrypt) % 26
    encrypted_char = num_to_char(y)
    encrypted += encrypted_char
    print(f"  {char} -> {x:2d} -> f({x:2d}) = 21*{x:2d} + 11 = {21*x + 11:3d} ≡ {y:2d} mod 26 -> {encrypted_char}")

print(f"\nPalabra cifrada: {encrypted}")
print(f"Resultado en minúsculas: {encrypted.lower()}")

# PARTE 2: Encontrar función de descifrado
print("\n" + "="*60)
print("PARTE 2: FUNCIÓN DE DESCIFRADO")
print("="*60)

a_inv, b_inv = find_decryption_function(a_encrypt, b_encrypt)

print(f"Calculando inverso modular de {a_encrypt} mod 26...")
print(f"  {a_encrypt}^(-1) mod 26 = {a_inv}")
print(f"\nFunción de descifrado: g(y) = {a_inv}y + {b_inv} mod 26")

# Verificar que es correcta
print("\nVerificación (debe dar la identidad):")
test_values = [0, 1, 5, 10, 15, 20, 25]
all_correct = True
for x in test_values:
    y = (a_encrypt * x + b_encrypt) % 26
    x_recovered = (a_inv * y + b_inv) % 26
    correct = "✓" if x == x_recovered else "✗"
    print(f"  x={x:2d} -> f(x)={y:2d} -> g(f(x))={x_recovered:2d} {correct}")
    if x != x_recovered:
        all_correct = False

if all_correct:
    print("¡Función de descifrado correcta!")

# PARTE 3: Descifrar GELKT
print("\n" + "="*60)
print("PARTE 3: DESCIFRADO")
print("="*60)

word_to_decrypt = "GELKT"
print(f"Palabra a descifrar: {word_to_decrypt}")
print(f"Función de descifrado: g(y) = {a_inv}y + {b_inv} mod 26")
print()

# Mostrar proceso paso a paso
decrypted = ""
for char in word_to_decrypt:
    y = char_to_num(char)
    x = (a_inv * y + b_inv) % 26
    decrypted_char = num_to_char(x)
    decrypted += decrypted_char
    print(f"  {char} -> {y:2d} -> g({y:2d}) = {a_inv}*{y:2d} + {b_inv} = {a_inv*y + b_inv:3d} ≡ {x:2d} mod 26 -> {decrypted_char}")

print(f"\nPalabra descifrada: {decrypted}")
print(f"Resultado en minúsculas: {decrypted.lower()}")

# RESPUESTA FINAL
print("\n" + "="*60)
print("RESPUESTA FINAL")
print("="*60)

answer = f"{encrypted.lower()}_{a_inv}y+{b_inv}[26]_{decrypted.lower()}"
print(f"\nFormato requerido: (cifrado)_(función)_(descifrado)")
print(f"RESPUESTA: {answer}")
print("\n" + "🔥 " * 20)
print(f"FLAG: {answer}")
print("🔥 " * 20)