#!/usr/bin/env python3

c = 3221397397487855538588354709079710034218446856924322201685962988373085999106520297445522472336372753730772681525922861947526687540676821038333864986323966287455711878766822591421154377412655244628649253874902523821091747156358907843124893818623641515650890879090175231228840303675414272576398501493258255342613890070669765615090568770005
n = 4295553506113769011052357450124625246952765493813029090755387165255909933702052664412292122457694680989705203382331408448025878071309408111447336427437111873017546532346071843472775668445631858526567625943244860875295053951101636120121112190517652042968016250556803718641361649884078969821967555032542017665588212971423495677042823686981024786
e = 65537

# El problema dice que usa MÁS primos, intentemos factorización agresiva
import math

def pollard_rho(n):
    if n % 2 == 0:
        return 2
    x = 2
    y = 2
    d = 1
    f = lambda x: (x * x + 1) % n
    while d == 1:
        x = f(x)
        y = f(f(y))
        d = math.gcd(abs(x - y), n)
    return d

# Factorizar completamente
factors = []
remaining = n

# Primero quitar factores pequeños
for p in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149]:
    while remaining % p == 0:
        factors.append(p)
        remaining = remaining // p

# Buscar factores más grandes
for p in range(151, 50000):
    if remaining % p == 0:
        while remaining % p == 0:
            factors.append(p)
            remaining = remaining // p
        if remaining == 1:
            break

print(f"Factores encontrados hasta ahora: {factors}")
print(f"Número restante: {remaining}")

# Si queda un número grande, intentar factorizarlo
if remaining > 1 and remaining < n:
    # Intentar factorizar el resto con Pollard Rho
    print("Intentando factorizar el resto...")
    temp = remaining
    while temp > 1:
        try:
            factor = pollard_rho(temp)
            if factor == temp:
                factors.append(temp)
                break
            factors.append(factor)
            temp = temp // factor
        except:
            factors.append(temp)
            break

print(f"\nFactores finales: {factors[:20]}...")
print(f"Total de factores: {len(factors)}")

# Calcular phi(n) con los factores encontrados
from collections import Counter
factor_counts = Counter(factors)

phi = 1
for prime, count in factor_counts.items():
    phi *= (prime ** (count - 1)) * (prime - 1)

print("phi(n) calculado")

# Calcular d
d = pow(e, -1, phi)
print("d calculado")

# Descifrar
m = pow(c, d, n)
print(f"\nMensaje descifrado: {m}")

# Convertir a texto
try:
    flag_bytes = m.to_bytes((m.bit_length() + 7) // 8, 'big')
    flag = flag_bytes.decode('ascii', errors='ignore')
    if 'pico' in flag or 'CTF' in flag:
        print(f"\n¡FLAG ENCONTRADA!: {flag}")
    else:
        # Intentar little endian
        flag_bytes = m.to_bytes((m.bit_length() + 7) // 8, 'little')
        flag = flag_bytes.decode('ascii', errors='ignore')
        if 'pico' in flag or 'CTF' in flag:
            print(f"\n¡FLAG ENCONTRADA (little endian)!: {flag}")
        else:
            print(f"Decodificación: {flag}")
except:
    print(f"Hex: {hex(m)}")