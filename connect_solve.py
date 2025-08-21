#!/usr/bin/env python3

import socket
from Crypto.Util.number import long_to_bytes, inverse
import sympy

def get_challenge():
    """Conecta al servidor y obtiene c, n, e"""
    s = socket.socket()
    s.connect(('jupiter.challenges.picoctf.org', 51575))
    data = s.recv(4096).decode()
    s.close()
    
    lines = data.strip().split('\n')
    c = int(lines[0].split(': ')[1])
    n = int(lines[1].split(': ')[1])
    e = int(lines[2].split(': ')[1])
    
    return c, n, e

def factor_small_primes(n, limit=100000):
    """Factoriza usando primos pequeños"""
    factors = []
    remaining = n
    
    for p in sympy.primerange(2, limit):
        while remaining % p == 0:
            factors.append(p)
            remaining //= p
            
    return factors, remaining

def solve_rsa(c, n, e, factors):
    """Resuelve RSA con los factores dados"""
    # Calcular phi(n)
    phi = 1
    unique_factors = list(set(factors))
    for p in unique_factors:
        count = factors.count(p)
        phi *= (p ** (count - 1)) * (p - 1)
    
    # Calcular d
    d = inverse(e, phi)
    
    # Descifrar
    m = pow(c, d, n)
    
    return long_to_bytes(m)

# Intentar múltiples veces con diferentes challenges
max_attempts = 10

for attempt in range(1, max_attempts + 1):
    print(f"\n{'='*60}")
    print(f"[*] Intento #{attempt}")
    print('='*60)
    
    try:
        # Obtener nuevo challenge
        print("[*] Conectando al servidor...")
        c, n, e = get_challenge()
        
        print(f"[*] c = {c}")
        print(f"[*] n = {n}")
        print(f"[*] e = {e}")
        print(f"[*] Bits de n: {n.bit_length()}")
        
        # Intentar factorización rápida
        print("\n[*] Factorizando con primos pequeños...")
        factors, remaining = factor_small_primes(n, limit=50000)
        
        print(f"[*] Factores encontrados: {len(factors)}")
        print(f"[*] Primeros factores: {factors[:10] if len(factors) > 10 else factors}")
        print(f"[*] Resto: {remaining if remaining > 1 else 'Completo!'}")
        
        if remaining == 1:
            # Factorización completa!
            print("\n[+] FACTORIZACIÓN COMPLETA!")
            print(f"[+] Total de factores: {len(factors)}")
            print(f"[+] Factores únicos: {list(set(factors))}")
            
            # Resolver
            flag_bytes = solve_rsa(c, n, e, factors)
            
            # Buscar flag
            if b'picoCTF' in flag_bytes:
                start = flag_bytes.index(b'picoCTF')
                end = flag_bytes.index(b'}', start) + 1
                flag = flag_bytes[start:end].decode()
                print(f"\n{'='*60}")
                print(f"[+] FLAG ENCONTRADO: {flag}")
                print(f"{'='*60}")
                break
            else:
                # Intentar decodificar
                for encoding in ['utf-8', 'ascii', 'latin-1']:
                    try:
                        flag = flag_bytes.decode(encoding)
                        if 'picoCTF' in flag or 'CTF{' in flag:
                            print(f"\n{'='*60}")
                            print(f"[+] FLAG: {flag}")
                            print(f"{'='*60}")
                            break
                    except:
                        pass
                else:
                    print(f"[?] Descifrado pero no se ve el flag claramente")
                    print(f"[?] Hex: {flag_bytes.hex()[:100]}...")
                    
        elif remaining.bit_length() < 100:
            # El resto es pequeño, intentar factorizar
            print(f"\n[*] El resto es pequeño ({remaining.bit_length()} bits), factorizando...")
            
            try:
                more_factors = sympy.factorint(remaining, limit=10**10)
                print(f"[+] Factores adicionales: {more_factors}")
                
                for prime, count in more_factors.items():
                    for _ in range(count):
                        factors.append(prime)
                
                # Verificar si está completo
                product = 1
                for f in factors:
                    product *= f
                    
                if product == n:
                    print("[+] Factorización completa!")
                    flag_bytes = solve_rsa(c, n, e, factors)
                    
                    if b'picoCTF' in flag_bytes:
                        start = flag_bytes.index(b'picoCTF')
                        end = flag_bytes.index(b'}', start) + 1
                        flag = flag_bytes[start:end].decode()
                        print(f"\n{'='*60}")
                        print(f"[+] FLAG: {flag}")
                        print(f"{'='*60}")
                        break
            except:
                print("[!] No se pudo factorizar el resto")
        else:
            print(f"[!] El resto es muy grande ({remaining.bit_length()} bits)")
            print("[!] Este challenge es difícil, intentando otro...")
            
    except Exception as e:
        print(f"[!] Error: {e}")
        
print("\n[*] Fin del programa")