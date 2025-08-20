#!/usr/bin/env python3

from sympy import factorint
from Crypto.Util.number import long_to_bytes, inverse
import gmpy2

# Datos del servidor
c = 174969454167958615699624741148260730941748443652400512212132925859817712131472007494913865798627033316302714316558182173808429066105126834108154846605312440011097312079889601614659517203309650928847977239829927109919157628637542448289782578908726748073754545368694892934543164248376647388327166638381788278369233466837331432738779285930221727722

n = 231774124313204340400480437569710128094062411742447210647066505638235990292682568346188899917458585579754539587153925967627641910263321940559168075519465203199426682209491956719156356315673125359751171637884225761403474352008664291758137777288638069452361862436640016124938695762126490376722007592730564326902427680274319166018847962352432025195

e = 65537

print("[*] Factorizando n con múltiples primos...")
print(f"[*] n tiene {len(str(n))} dígitos")

# Intentar factorización directa con sympy
print("[*] Intentando factorización con sympy...")
try:
    factors = factorint(n, limit=1000000)
    print(f"[+] Factorización encontrada: {factors}")
except:
    print("[!] Factorización con sympy falló, intentando otros métodos...")
    
    # Si falla, probar con Pollard's rho
    print("[*] Intentando Pollard's rho...")
    
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
            d = gmpy2.gcd(abs(x - y), n)
        
        return d if d != n else None
    
    factors = {}
    remaining = n
    
    # Buscar factores pequeños primero
    for p in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]:
        while remaining % p == 0:
            factors[p] = factors.get(p, 0) + 1
            remaining //= p
    
    # Si todavía es grande, intentar Pollard's rho
    if remaining > 1:
        print(f"[*] Remaining: {remaining}")
        factor = pollard_rho(remaining)
        if factor:
            factors[factor] = factors.get(factor, 0) + 1
            remaining //= factor

# Si tenemos los factores, calcular phi(n) y descifrar
if factors:
    print(f"\n[+] Factores encontrados: {factors}")
    
    # Calcular phi(n) con múltiples primos
    phi = 1
    for prime, count in factors.items():
        phi *= (prime ** (count - 1)) * (prime - 1)
    
    print(f"[*] phi(n) = {phi}")
    
    # Calcular d = e^-1 mod phi(n)
    d = inverse(e, phi)
    print(f"[*] d = {d}")
    
    # Descifrar
    m = pow(c, d, n)
    print(f"[*] m = {m}")
    
    # Convertir a bytes
    flag = long_to_bytes(m)
    print(f"\n[+] FLAG: {flag.decode()}")
else:
    print("[!] No se pudieron encontrar los factores")
    print("[*] Intentando ataque de factorización online...")
    
    # Si todo falla, intentar con servicios online
    import requests
    
    print("[*] Consultando factordb.com...")
    url = f"http://factordb.com/api?query={n}"
    try:
        response = requests.get(url, timeout=10)
        data = response.json()
        if data['status'] == 'FF':
            print("[+] Factores encontrados en factordb!")
            factors_data = data['factors']
            factors = {}
            for factor_pair in factors_data:
                prime = int(factor_pair[0])
                count = int(factor_pair[1])
                factors[prime] = count
            
            # Calcular phi y descifrar
            phi = 1
            for prime, count in factors.items():
                phi *= (prime ** (count - 1)) * (prime - 1)
            
            d = inverse(e, phi)
            m = pow(c, d, n)
            flag = long_to_bytes(m)
            print(f"\n[+] FLAG: {flag.decode()}")
    except Exception as e:
        print(f"[!] Error consultando factordb: {e}")