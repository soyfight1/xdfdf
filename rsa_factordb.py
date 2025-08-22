#!/usr/bin/env python3
import urllib.request
import json

n = 1422450808944701344261903748621562998784243662042303391362692043823716783771691667
c = 843044897663847841476319711639772861390329326681532977209935413827620909782846667
e = 65537

print("=" * 70)
print("CONSULTANDO FACTORDB.COM")
print("=" * 70)

print(f"\nN = {n}")
print(f"N tiene {n.bit_length()} bits")

# Consultar factordb.com
url = f"http://factordb.com/api?query={n}"
print(f"\nConsultando: {url}")

try:
    with urllib.request.urlopen(url) as response:
        data = json.loads(response.read().decode())
    
    print(f"\nRespuesta de factordb:")
    print(f"Status: {data.get('status')}")
    print(f"Factores: {data.get('factors')}")
    
    if data.get('factors'):
        factors = data['factors']
        if len(factors) >= 2:
            p = int(factors[0][0])
            q = int(factors[1][0]) if len(factors) > 1 else n // p
            
            print(f"\n✅ FACTORES ENCONTRADOS EN FACTORDB!")
            print(f"p = {p}")
            print(f"q = {q}")
            
            # Verificar
            if p * q == n:
                print(f"\nVerificación exitosa: p * q = n")
                
                # Descifrar
                print("\n" + "=" * 70)
                print("DESCIFRANDO RSA")
                print("=" * 70)
                
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
        print("\n❌ No se encontraron factores en factordb")
        print("El número no está en la base de datos")
        
except Exception as e:
    print(f"\nError al consultar factordb: {e}")
    print("Intentando factorización manual...")
    
    # Si factordb falla, intentar con un método más agresivo
    import math
    
    print("\nIntentando factorización por fuerza bruta optimizada...")
    print("Probando divisores primos pequeños primero...")
    
    # Lista de primos pequeños
    small_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    
    for p in small_primes:
        if n % p == 0:
            q = n // p
            print(f"\n✅ ¡Factor primo pequeño encontrado!")
            print(f"p = {p}")
            print(f"q = {q}")
            break
    else:
        # Probar con más divisores
        print("\nProbando más divisores...")
        for i in range(101, 10000000, 2):
            if i % 1000000 == 1:
                print(f"  Probando alrededor de {i}...")
            if n % i == 0:
                p = i
                q = n // i
                print(f"\n✅ ¡Factores encontrados!")
                print(f"p = {p}")
                print(f"q = {q}")
                break