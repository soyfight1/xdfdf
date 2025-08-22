#!/usr/bin/env python3
from sympy import factorint
import signal
import sys

n = 1422450808944701344261903748621562998784243662042303391362692043823716783771691667
c = 843044897663847841476319711639772861390329326681532977209935413827620909782846667
e = 65537

print("=" * 70)
print("FACTORIZACIÓN RSA CON SYMPY")
print("=" * 70)

print(f"\nN = {n}")
print(f"N tiene {n.bit_length()} bits")

# Timeout handler
def timeout_handler(signum, frame):
    print("\nTimeout alcanzado")
    sys.exit(1)

# Set timeout de 60 segundos
signal.signal(signal.SIGALRM, timeout_handler)
signal.alarm(60)

try:
    print("\nFactorizando con sympy (máximo 60 segundos)...")
    factors = factorint(n)
    signal.alarm(0)  # Cancelar alarma
    
    print(f"✅ Factores encontrados: {factors}")
    
    # Extraer p y q
    factor_list = list(factors.keys())
    if len(factor_list) == 2:
        p, q = factor_list[0], factor_list[1]
    else:
        p = factor_list[0]
        q = n // p
    
    print(f"\np = {p}")
    print(f"q = {q}")
    print(f"p tiene {p.bit_length()} bits")
    print(f"q tiene {q.bit_length()} bits")
    
    # Verificar
    print(f"\nVerificación: p * q = {p * q}")
    print(f"¿Coincide con N? {p * q == n}")
    
    # Calcular phi y d
    print("\n" + "=" * 70)
    print("CALCULANDO CLAVE PRIVADA")
    print("=" * 70)
    
    phi = (p - 1) * (q - 1)
    
    # Calcular d (inverso modular)
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
    
    # Descifrar
    print("\n" + "=" * 70)
    print("DESCIFRANDO MENSAJE")
    print("=" * 70)
    
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
        print(f"Error al decodificar como ASCII: {e}")
        # Intentar UTF-8
        try:
            message = message_bytes.decode('utf-8')
            print(f"Mensaje UTF-8: {message}")
        except:
            print(f"Bytes raw: {message_bytes}")
            
except Exception as e:
    print(f"Error: {e}")