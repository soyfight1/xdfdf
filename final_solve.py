#!/usr/bin/env python3

from Crypto.Util.number import long_to_bytes, inverse
from sympy import factorint

# Valores ORIGINALES del problema (del hint)
c = 220792980926665952349137945422980809172624804899864094250764791782429607681801478483617625687698622071517694855526973786583346039286711280160114528046761974588266123571872772061217767272059869596140567864416404924571566752282735212867405007443133346440116648682519116499518033820233673443307106541635517163619023226561727281924065361517060360805

n = 220848494312633873550521434540121092930061340151464516933090739180958672744573572743283820177719895953925048006257256536170101279602930663475213347031056671032581122523492568975625503483106059704596362545831377237700567156400822789247606369915232646209382014685512845075233921827028600695287414634190330763282597268045444077737019192890820994831

e = 65537

print("[*] b00tl3gRSA3 - Solución con valores originales")
print(f"[*] c = {c}")
print(f"[*] n = {n}")
print(f"[*] e = {e}")
print(f"[*] Bits de n: {n.bit_length()}")

# Factorizar n
print("\n[*] Factorizando n...")
factors_dict = factorint(n)
print(f"[+] Factorización: {factors_dict}")

# Extraer todos los factores
factors = []
for prime, count in factors_dict.items():
    for _ in range(count):
        factors.append(prime)

print(f"[+] Factores: {factors}")
print(f"[+] Número de factores: {len(factors)}")

# Verificar factorización
product = 1
for f in factors:
    product *= f

if product == n:
    print("[+] Factorización verificada!")
    
    # Calcular phi(n)
    phi = 1
    for prime, count in factors_dict.items():
        phi *= (prime ** (count - 1)) * (prime - 1)
    
    print(f"\n[*] Calculando phi(n)...")
    print(f"[*] phi(n) = {phi}")
    
    # Calcular d
    print("[*] Calculando clave privada d...")
    d = inverse(e, phi)
    print(f"[*] d = {d}")
    
    # Descifrar
    print("[*] Descifrando...")
    m = pow(c, d, n)
    print(f"[*] m = {m}")
    
    # Convertir a texto
    flag_bytes = long_to_bytes(m)
    
    # Decodificar
    try:
        flag = flag_bytes.decode('utf-8')
    except:
        try:
            flag = flag_bytes.decode('ascii')
        except:
            flag = flag_bytes.decode('latin-1')
    
    print(f"\n{'='*60}")
    print(f"[+] FLAG: {flag}")
    print(f"{'='*60}")
else:
    print("[!] Error en factorización")