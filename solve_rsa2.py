#!/usr/bin/env python3

from Crypto.Util.number import long_to_bytes, inverse
import requests

# Datos del servidor
c = 174969454167958615699624741148260730941748443652400512212132925859817712131472007494913865798627033316302714316558182173808429066105126834108154846605312440011097312079889601614659517203309650928847977239829927109919157628637542448289782578908726748073754545368694892934543164248376647388327166638381788278369233466837331432738779285930221727722

n = 231774124313204340400480437569710128094062411742447210647066505638235990292682568346188899917458585579754539587153925967627641910263321940559168075519465203199426682209491956719156356315673125359751171637884225761403474352008664291758137777288638069452361862436640016124938695762126490376722007592730564326902427680274319166018847962352432025195

e = 65537

print("[*] Consultando factordb.com para factorización completa...")
url = f"http://factordb.com/api?query={n}"

try:
    response = requests.get(url, timeout=30)
    data = response.json()
    print(f"[*] Estado en factordb: {data['status']}")
    
    if data['status'] in ['FF', 'CF']:
        print("[+] Factores encontrados!")
        factors_raw = data['factors']
        
        # Procesar factores
        primes = []
        for factor_pair in factors_raw:
            prime = int(factor_pair[0])
            count = int(factor_pair[1])
            for _ in range(count):
                primes.append(prime)
        
        print(f"[*] Primos encontrados: {primes}")
        
        # Si hay un factor muy grande, intentar factorizarlo más
        large_factors = [p for p in primes if p > 10**20]
        if large_factors:
            print(f"[!] Factor grande detectado: {large_factors[0]}")
            print("[*] Intentando factorizar más...")
            
            # Consultar el factor grande
            url2 = f"http://factordb.com/api?query={large_factors[0]}"
            response2 = requests.get(url2, timeout=30)
            data2 = response2.json()
            
            if data2['status'] in ['FF', 'CF']:
                print("[+] Factor grande factorizado!")
                # Reemplazar el factor grande con sus factores
                primes.remove(large_factors[0])
                for factor_pair in data2['factors']:
                    prime = int(factor_pair[0])
                    count = int(factor_pair[1])
                    for _ in range(count):
                        primes.append(prime)
        
        print(f"\n[+] Factorización completa: {primes}")
        
        # Calcular phi(n)
        phi = 1
        unique_primes = list(set(primes))
        for p in unique_primes:
            count = primes.count(p)
            phi *= (p ** (count - 1)) * (p - 1)
        
        print(f"[*] phi(n) calculado")
        
        # Calcular d
        d = inverse(e, phi)
        print(f"[*] d calculado")
        
        # Descifrar
        m = pow(c, d, n)
        print(f"[*] Mensaje descifrado: {m}")
        
        # Convertir a texto
        try:
            flag = long_to_bytes(m)
            print(f"\n[+] FLAG: {flag.decode()}")
        except:
            # Si falla, intentar interpretación hexadecimal
            flag_hex = hex(m)[2:]
            print(f"[*] Hex: {flag_hex}")
            
            # Intentar decodificar como ASCII
            try:
                flag = bytes.fromhex(flag_hex).decode('ascii')
                print(f"\n[+] FLAG: {flag}")
            except:
                print(f"[*] Bytes raw: {long_to_bytes(m)}")
                
except Exception as e:
    print(f"[!] Error: {e}")
    
# Si factordb falla, intentar factorización manual con primos conocidos de RSA débil
print("\n[*] Intentando factorización manual con primos comunes...")

# Primos comunes en CTFs
common_primes = [
    29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97,
    101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199,
    211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293,
    307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397,
    401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499,
    503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599,
    601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691,
    701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
    809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887,
    907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997
]

found_primes = []
temp_n = n

for p in [2, 3, 5, 7, 11, 13, 17, 19, 23] + common_primes:
    while temp_n % p == 0:
        found_primes.append(p)
        temp_n //= p
        print(f"[+] Factor encontrado: {p}")

if len(found_primes) > 2:
    print(f"\n[+] Primos encontrados manualmente: {found_primes}")
    print(f"[*] Resto: {temp_n}")
    
    if temp_n > 1:
        found_primes.append(temp_n)
    
    # Calcular phi
    phi = 1
    unique = list(set(found_primes))
    for p in unique:
        count = found_primes.count(p)
        phi *= (p ** (count - 1)) * (p - 1)
    
    d = inverse(e, phi)
    m = pow(c, d, n)
    
    try:
        flag = long_to_bytes(m).decode()
        print(f"\n[+] FLAG: {flag}")
    except:
        print(f"[*] Mensaje en hex: {hex(m)}")