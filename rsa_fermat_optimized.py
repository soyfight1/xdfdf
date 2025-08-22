#!/usr/bin/env python3
import math

n = 1422450808944701344261903748621562998784243662042303391362692043823716783771691667
c = 843044897663847841476319711639772861390329326681532977209935413827620909782846667
e = 65537

print("=" * 70)
print("FACTORIZACIÓN DE FERMAT OPTIMIZADA")
print("=" * 70)
print("\nSi p y q están cercanos, Fermat es muy eficiente")

def fermat_factorization(n):
    """Factorización de Fermat - eficiente cuando p y q están cercanos"""
    # Empezar con a = ceil(sqrt(n))
    a = math.isqrt(n)
    if a * a < n:
        a += 1
    
    print(f"\nEmpezando desde a = {a}")
    print("Buscando factores...")
    
    count = 0
    while count < 100000:
        b2 = a * a - n
        b = math.isqrt(b2)
        
        if b * b == b2:
            # Encontramos los factores
            p = a - b
            q = a + b
            return p, q
        
        a += 1
        count += 1
        
        if count % 10000 == 0:
            print(f"  Iteración {count}...")
    
    return None, None

# Intentar factorización de Fermat
p, q = fermat_factorization(n)

if p and q:
    print(f"\n✅ ¡FACTORES ENCONTRADOS!")
    print(f"p = {p}")
    print(f"q = {q}")
    print(f"p tiene {p.bit_length()} bits")
    print(f"q tiene {q.bit_length()} bits")
    
    # Verificar
    print(f"\nVerificación: p * q = {p * q}")
    print(f"¿Coincide con N? {p * q == n}")
    
    # Calcular diferencia entre p y q
    diff = abs(p - q)
    print(f"\nDiferencia entre p y q: {diff}")
    print(f"Esto explica por qué Fermat funcionó tan bien")
    
    # Descifrar
    print("\n" + "=" * 70)
    print("DESCIFRANDO RSA")
    print("=" * 70)
    
    # Calcular phi
    phi = (p - 1) * (q - 1)
    
    # Calcular d
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
    
    # Descifrar
    m = pow(c, d, n)
    print(f"Mensaje como número: {m}")
    
    # Convertir a texto
    message_hex = hex(m)[2:]
    if len(message_hex) % 2:
        message_hex = '0' + message_hex
    
    print(f"Mensaje hex: {message_hex}")
    
    try:
        message_bytes = bytes.fromhex(message_hex)
        message = message_bytes.decode('ascii')
        print(f"Mensaje texto: {message}")
        
        if 'picoCTF{' in message:
            print(f"\n{'='*70}")
            print(f"🏁 BANDERA ENCONTRADA: {message}")
            print("=" * 70)
    except Exception as e:
        print(f"Error: {e}")
else:
    print("\n❌ No se encontraron factores con Fermat en 100000 iteraciones")
    print("Los factores p y q probablemente no están tan cercanos")