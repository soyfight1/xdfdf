#!/usr/bin/env python3
import math

# Valores del archivo
c = 843044897663847841476319711639772861390329326681532977209935413827620909782846667
n = 1422450808944701344261903748621562998784243662042303391362692043823716783771691667
e = 65537

print("=" * 70)
print("ANÁLISIS DEL PROBLEMA RSA")
print("=" * 70)

# Verificar el tamaño de N en bits
n_bits = n.bit_length()
print(f"\nN tiene {n_bits} bits")
print(f"N = {n}")

# Verificar si N es pequeño (poco más de 100 bits según la pista)
print(f"\nLa pista dice 'poco más de 100 bits' y N tiene {n_bits} bits")

# Para un N tan pequeño, podemos intentar factorizarlo
print("\n" + "=" * 70)
print("INTENTANDO FACTORIZACIÓN")
print("=" * 70)

# Método 1: Factorización por división de prueba
def factorize_small(n):
    """Factoriza N probando divisores pequeños"""
    # Probar números impares hasta sqrt(n)
    sqrt_n = int(math.sqrt(n)) + 1
    
    print(f"Probando divisores hasta sqrt(N) ≈ {sqrt_n}")
    print("Esto puede tomar un momento...")
    
    # Empezar con 2
    if n % 2 == 0:
        return 2, n // 2
    
    # Probar números impares
    for i in range(3, min(sqrt_n, 10000000), 2):
        if i % 1000000 == 1:
            print(f"  Probando alrededor de {i}...")
        if n % i == 0:
            return i, n // i
    
    return None, None

# Intentar factorización básica primero con límite pequeño
print("\nProbando factorización rápida...")
for i in range(3, 100000, 2):
    if n % i == 0:
        p = i
        q = n // i
        print(f"\n✅ ¡FACTORIZACIÓN EXITOSA!")
        print(f"p = {p}")
        print(f"q = {q}")
        print(f"Verificación: p * q = {p * q}")
        print(f"¿Coincide con N? {p * q == n}")
        break
else:
    # Si no encontramos con búsqueda rápida, intentar más exhaustivo
    print("No encontrado en búsqueda rápida, intentando más exhaustivo...")
    p, q = factorize_small(n)
    if p:
        print(f"\n✅ ¡FACTORIZACIÓN EXITOSA!")
        print(f"p = {p}")
        print(f"q = {q}")

# Si encontramos p y q, calcular la clave privada y descifrar
if 'p' in locals() and 'q' in locals() and p and q:
    print("\n" + "=" * 70)
    print("CALCULANDO CLAVE PRIVADA Y DESCIFRANDO")
    print("=" * 70)
    
    # Calcular phi(n) = (p-1)(q-1)
    phi = (p - 1) * (q - 1)
    print(f"\nφ(n) = (p-1)(q-1) = {phi}")
    
    # Calcular d (inverso modular de e mod phi)
    # Usando el algoritmo extendido de Euclides
    def extended_gcd(a, b):
        if a == 0:
            return b, 0, 1
        gcd, x1, y1 = extended_gcd(b % a, a)
        x = y1 - (b // a) * x1
        y = x1
        return gcd, x, y
    
    def mod_inverse(e, phi):
        gcd, x, _ = extended_gcd(e, phi)
        if gcd != 1:
            raise Exception('El inverso modular no existe')
        return (x % phi + phi) % phi
    
    d = mod_inverse(e, phi)
    print(f"d (clave privada) = {d}")
    
    # Descifrar: m = c^d mod n
    print(f"\nDescifrando c^d mod n...")
    m = pow(c, d, n)
    print(f"m (mensaje como número) = {m}")
    
    # Convertir el número a texto
    # El mensaje está codificado como un número, convertir a bytes y luego a texto
    try:
        # Convertir número a bytes
        message_hex = hex(m)[2:]
        if len(message_hex) % 2:
            message_hex = '0' + message_hex
        message_bytes = bytes.fromhex(message_hex)
        message = message_bytes.decode('ascii')
        
        print(f"\n{'='*70}")
        print("🎯 MENSAJE DESCIFRADO:")
        print(f"Hex: {message_hex}")
        print(f"Texto: {message}")
        
        if 'picoCTF{' in message:
            print(f"\n🏁 BANDERA ENCONTRADA: {message}")
        print("=" * 70)
    except Exception as e:
        print(f"Error al convertir a texto: {e}")
        print(f"Mensaje como hex: {hex(m)}")
else:
    print("\n❌ No se pudo factorizar N con el método básico")
    print("Intentando con herramientas más avanzadas...")