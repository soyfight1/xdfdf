#!/usr/bin/env python3

import gmpy2
from sympy import factorint, discrete_log
import math

print("="*60)
print("ATAQUE MATEMÁTICO A DIFFIE-HELLMAN")
print("="*60)

# Parámetros del challenge
p = 1091136745528189467933281517836874347556227973368844785834730809158502707734111726197047853034779577326799376909360702796771580766448794604223666095534254989157674044885025529655475251174022547573400542404497196315179009518790845093

g = 788566880005302277341720913014765764523749662717255764973422789169351342670625046069737389605574848412134408890505831396888152508510392260349529979008920978675421422171288130340362523984410268300658262790954147173882579740249230159

print(f"\n[1] Analizando parámetros...")
print(f"p = {p}")
print(f"g = {g}")
print(f"\nTamaño de p: {p.bit_length()} bits")
print(f"Tamaño de g: {g.bit_length()} bits")

# Verificar si p es primo
print("\n[2] Verificando si p es primo...")
is_prime = gmpy2.is_prime(p)
print(f"p es primo: {is_prime}")

if not is_prime:
    print("\n[3] p NO es primo! Factorizando...")
    factors = factorint(p)
    print(f"Factores de p: {factors}")
    
    # Si p no es primo, el DH es vulnerable
    print("\n[!] VULNERABILIDAD ENCONTRADA: p no es primo")
    print("[*] El protocolo DH es completamente inseguro con un módulo compuesto")

# Verificar el orden de g
print("\n[4] Analizando orden de g mod p...")

# Si p-1 tiene factores pequeños, podemos usar Pohlig-Hellman
print("[*] Factorizando p-1...")
p_minus_1 = p - 1
print(f"p-1 = {p_minus_1}")

# Intentar factorizar p-1 (puede tomar tiempo si es grande)
print("[*] Buscando factores pequeños de p-1...")
small_factors = []
n = p_minus_1

# Buscar factores pequeños
for prime in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]:
    while n % prime == 0:
        small_factors.append(prime)
        n = n // prime

if small_factors:
    print(f"[*] Factores pequeños encontrados: {small_factors}")
    print(f"[*] Resto sin factorizar: {n}")

# Verificar si g tiene orden pequeño
print("\n[5] Verificando orden de g...")
for order in [2, 3, 4, 5, 6, 7, 8, 9, 10, 100, 1000, 10000]:
    if pow(g, order, p) == 1:
        print(f"[!] g tiene orden {order}!")
        print("[!] VULNERABILIDAD CRÍTICA: generador con orden pequeño")
        break

# Estrategia alternativa: Buscar valores especiales
print("\n[6] Buscando valores especiales...")

# Verificar si g = -1 mod p
if g % p == p - 1:
    print("[!] g ≡ -1 (mod p)")
    print("[*] El secreto compartido solo puede ser 1 o p-1")

# Verificar si g = 1 mod p
if g % p == 1:
    print("[!] g ≡ 1 (mod p)")
    print("[*] El secreto compartido siempre será 1")

# Verificar si g = 0 mod p
if g % p == 0:
    print("[!] g ≡ 0 (mod p)")
    print("[*] El secreto compartido siempre será 0")

print("\n[7] Estrategia de ataque recomendada:")
print("-" * 40)

print("""
Para el ataque MITM en este challenge:

1. Interceptar el mensaje de Alice con A = g^a mod p
2. Modificar A = 1 (esto hace que Bob calcule secreto = 1^b = 1)
3. Interceptar el mensaje de Bob con B = g^b mod p  
4. Modificar B = 1 (esto hace que Alice calcule secreto = 1^a = 1)
5. Ahora ambos tienen secreto = 1
6. El código cifrado será: encrypted_code XOR 1
7. Para descifrar: plaintext_code = encrypted_code XOR 1

Si el servidor valida la sesión, debes:
- Usar un navegador real
- Modificar manualmente los valores en los textareas
- Enviar A=1 y B=1
- El código descifrado será el XOR del código cifrado con 1
""")

# Ejemplo de descifrado
print("\n[8] Ejemplo de descifrado:")
print("-" * 40)

# Supongamos un código cifrado de ejemplo
example_encrypted = 123456789
example_secret = 1
example_plaintext = example_encrypted ^ example_secret

print(f"Si el código cifrado es: {example_encrypted}")
print(f"Y el secreto compartido es: {example_secret}")
print(f"Entonces el código en texto plano es: {example_plaintext}")
print(f"\nURL de verificación: https://diffie-hellman.crypto.w3challs.com/solution_diffie_hellman.php?password={example_plaintext}")

print("\n" + "="*60)
print("FIN DEL ANÁLISIS")
print("="*60)