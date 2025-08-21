#!/usr/bin/env python3
import socket
import re
from Crypto.Util.number import long_to_bytes

def get_rsa_params():
    """Conectar al servidor y obtener los parámetros RSA"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('jupiter.challenges.picoctf.org', 18243))
    
    data = s.recv(4096).decode()
    s.close()
    
    # Extraer c, n, e
    c = int(re.search(r'c: (\d+)', data).group(1))
    n = int(re.search(r'n: (\d+)', data).group(1))
    e = int(re.search(r'e: (\d+)', data).group(1))
    
    return c, n, e

# Obtener parámetros del servidor
print("Conectando al servidor...")
c, n, e = get_rsa_params()

print(f"c = {c}")
print(f"n = {n}")
print(f"e = {e}")
print(f"\nTamaño de e: {e.bit_length()} bits")

# El problema dice que usan d para cifrar
# Si e es muy grande (>1000 bits), entonces están dando e=d
# y el verdadero e debe ser pequeño (probablemente 65537)

# Intentar con e común = 65537
common_e = 65537

print(f"\nIntentando con e = {common_e}")
m = pow(c, common_e, n)
flag = long_to_bytes(m)

if b'picoCTF' in flag:
    print(f"¡FLAG ENCONTRADA!: {flag.decode('utf-8', errors='ignore')}")
else:
    # Si no funciona, intentar con otros valores comunes de e
    for test_e in [3, 5, 17, 257, 65537]:
        print(f"\nProbando con e = {test_e}")
        m = pow(c, test_e, n)
        flag = long_to_bytes(m)
        
        if b'picoCTF' in flag:
            print(f"¡FLAG ENCONTRADA con e={test_e}!: {flag.decode('utf-8', errors='ignore')}")
            break
        elif b'pico' in flag or b'CTF' in flag:
            print(f"Posible flag parcial: {flag}")
    else:
        # Si aún no funciona, intentar factorizar n
        print("\nIntentando factorización...")
        
        # Verificar factores pequeños
        for p in range(2, 100000):
            if n % p == 0:
                q = n // p
                print(f"¡Factores encontrados! p={p}, q={q}")
                
                # Calcular phi y el verdadero e
                phi = (p - 1) * (q - 1)
                
                # Intentar con e común
                from math import gcd
                if gcd(65537, phi) == 1:
                    m = pow(c, 65537, n)
                    flag = long_to_bytes(m)
                    if b'picoCTF' in flag:
                        print(f"FLAG: {flag.decode('utf-8', errors='ignore')}")
                break