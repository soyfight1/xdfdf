#!/usr/bin/env python3
from math import gcd
from functools import reduce

c = 3221397397487855538588354709079710034218446856924322201685962988373085999106520297445522472336372753730772681525922861947526687540676821038333864986323966287455711878766822591421154377412655244628649253874902523821091747156358907843124893818623641515650890879090175231228840303675414272576398501493258255342613890070669765615090568770005
n = 4295553506113769011052357450124625246952765493813029090755387165255909933702052664412292122457694680989705203382331408448025878071309408111447336427437111873017546532346071843472775668445631858526567625943244860875295053951101636120121112190517652042968016250556803718641361649884078969821967555032542017665588212971423495677042823686981024786
e = 65537

# Factorizar n usando método de división por primos pequeños
def factorize_small_primes(n, limit=100000):
    factors = []
    # Probar con primos pequeños
    for p in range(2, limit):
        while n % p == 0:
            factors.append(p)
            n = n // p
            print(f"Factor encontrado: {p}")
        if n == 1:
            break
    if n > 1:
        factors.append(n)
    return factors

print("Factorizando n...")
factors = factorize_small_primes(n)

if len(factors) > 2:
    print(f"\n¡RSA con {len(factors)} primos!")
    print(f"Factores: {factors}")
    
    # Calcular phi(n) para múltiples primos
    phi = 1
    for p in factors:
        phi *= (p - 1)
    
    print(f"\nphi(n) calculado")
    
    # Calcular d = e^-1 mod phi(n)
    def modinv(a, m):
        def extended_gcd(a, b):
            if a == 0:
                return b, 0, 1
            gcd, x1, y1 = extended_gcd(b % a, a)
            x = y1 - (b // a) * x1
            y = x1
            return gcd, x, y
        
        gcd, x, _ = extended_gcd(a % m, m)
        if gcd != 1:
            raise Exception('No existe inverso modular')
        return (x % m + m) % m
    
    d = modinv(e, phi)
    print(f"d calculado")
    
    # Descifrar
    m = pow(c, d, n)
    print(f"\nMensaje descifrado (decimal): {m}")
    
    # Convertir a texto
    try:
        # Convertir número a bytes
        hex_str = hex(m)[2:]
        if len(hex_str) % 2:
            hex_str = '0' + hex_str
        message = bytes.fromhex(hex_str).decode('ascii')
        print(f"FLAG: {message}")
    except:
        print(f"Hex: {hex(m)}")
        # Intentar decodificar de otra forma
        message = m.to_bytes((m.bit_length() + 7) // 8, 'big').decode('ascii', errors='ignore')
        print(f"FLAG alternativa: {message}")
else:
    print("No se encontraron múltiples factores pequeños, intentando con factordb...")
    import subprocess
    # Intentar con factordb o métodos más avanzados
    print("Probando métodos alternativos...")