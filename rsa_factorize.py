#!/usr/bin/env python3

# Valores RSA
n = 1422450808944701344261903748621562998784243662042303391362692043823716783771691667
c = 843044897663847841476319711639772861390329326681532977209935413827620909782846667
e = 65537

print("=" * 70)
print("FACTORIZACIÓN RSA OPTIMIZADA")
print("=" * 70)

print(f"\nN tiene {n.bit_length()} bits total")
print("\nSi la pista dice 'poco más de 100 bits', tal vez:")
print("- Uno de los factores (p o q) es muy pequeño")
print("- O ambos factores son de ~135 bits cada uno")

# Probar con factorización más agresiva
print("\n" + "=" * 70)
print("BUSCANDO FACTOR PEQUEÑO")
print("=" * 70)

# Intentar con un rango más grande pero más eficiente
import math

def pollard_rho(n):
    """Algoritmo Pollard's rho para factorización"""
    if n % 2 == 0:
        return 2
    
    x = 2
    y = 2
    d = 1
    
    # f(x) = x^2 + 1 mod n
    f = lambda x: (x * x + 1) % n
    
    while d == 1:
        x = f(x)
        y = f(f(y))
        d = math.gcd(abs(x - y), n)
    
    return d if d != n else None

# Primero intentar factorización directa hasta un límite mayor
print("\nProbando factorización directa con límite mayor...")
limit = 50000000  # 50 millones

found = False
for i in range(2, min(limit, int(math.sqrt(n)) + 1)):
    if i % 5000000 == 0:
        print(f"  Probado hasta {i}...")
    if n % i == 0:
        p = i
        q = n // i
        print(f"\n✅ ¡FACTORES ENCONTRADOS!")
        print(f"p = {p}")
        print(f"q = {q}")
        print(f"p tiene {p.bit_length()} bits")
        print(f"q tiene {q.bit_length()} bits")
        found = True
        break

if not found:
    print("\nIntentando con Pollard's rho...")
    factor = pollard_rho(n)
    if factor and factor > 1:
        p = factor
        q = n // factor
        print(f"\n✅ ¡FACTORES ENCONTRADOS con Pollard's rho!")
        print(f"p = {p}")
        print(f"q = {q}")
        print(f"p tiene {p.bit_length()} bits")
        print(f"q tiene {q.bit_length()} bits")
        found = True

if found:
    # Verificar
    print(f"\nVerificación: p * q = {p * q}")
    print(f"¿Coincide con N? {p * q == n}")
    
    # Calcular phi y d
    phi = (p - 1) * (q - 1)
    
    # Calcular inverso modular
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
    
    print(f"\n{'='*70}")
    print("DESCIFRANDO")
    print("=" * 70)
    
    # Descifrar
    m = pow(c, d, n)
    print(f"Mensaje como número: {m}")
    
    # Convertir a texto
    try:
        message_hex = hex(m)[2:]
        if len(message_hex) % 2:
            message_hex = '0' + message_hex
        message_bytes = bytes.fromhex(message_hex)
        message = message_bytes.decode('ascii')
        
        print(f"Mensaje hex: {message_hex}")
        print(f"Mensaje texto: {message}")
        
        if 'picoCTF{' in message:
            print(f"\n🏁 BANDERA: {message}")
    except:
        print(f"Mensaje como hex: {hex(m)}")
else:
    print("\n❌ No se encontraron los factores con los métodos probados")