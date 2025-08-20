#!/usr/bin/env python3

c = 3221397397487855538588354709079710034218446856924322201685962988373085999106520297445522472336372753730772681525922861947526687540676821038333864986323966287455711878766822591421154377412655244628649253874902523821091747156358907843124893818623641515650890879090175231228840303675414272576398501493258255342613890070669765615090568770005
n = 4295553506113769011052357450124625246952765493813029090755387165255909933702052664412292122457694680989705203382331408448025878071309408111447336427437111873017546532346071843472775668445631858526567625943244860875295053951101636120121112190517652042968016250556803718641361649884078969821967555032542017665588212971423495677042823686981024786
e = 65537

# Factorización rápida - sabemos que usa múltiples primos pequeños
primes = []
temp_n = n

# Factores pequeños comunes en bootlegRSA
small_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199]

for p in small_primes:
    while temp_n % p == 0:
        primes.append(p)
        temp_n = temp_n // p
        print(f"Factor: {p}")

# Intentar con primos más grandes
for p in range(211, 100000):
    if temp_n % p == 0:
        while temp_n % p == 0:
            primes.append(p)
            temp_n = temp_n // p
            print(f"Factor: {p}")
    if temp_n == 1:
        break

if temp_n > 1:
    primes.append(temp_n)
    print(f"Factor grande restante: {temp_n}")

print(f"\nTotal factores: {len(primes)}")

# Calcular phi(n)
from collections import Counter
factor_counts = Counter(primes)
phi = n
for prime in factor_counts:
    phi = phi // prime * (prime - 1)

# Inverso modular rápido
def modinv(a, m):
    m0, x0, x1 = m, 0, 1
    while a > 1:
        q = a // m
        m, a = a % m, m
        x0, x1 = x1 - q * x0, x0
    return x1 + m0 if x1 < 0 else x1

d = modinv(e, phi)

# Descifrar
m = pow(c, d, n)

# Convertir a ASCII
flag = m.to_bytes((m.bit_length() + 7) // 8, 'big').decode('ascii', errors='ignore')
print(f"\n¡FLAG ENCONTRADA!: {flag}")

# Si no sale bien, probar hex
hex_m = hex(m)[2:]
if 'pico' not in flag:
    try:
        flag = bytes.fromhex(hex_m).decode('ascii')
        print(f"FLAG (hex decode): {flag}")
    except:
        pass