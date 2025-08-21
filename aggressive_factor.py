#!/usr/bin/env python3

from Crypto.Util.number import long_to_bytes, inverse
import sympy

# Datos del servidor
c = 174969454167958615699624741148260730941748443652400512212132925859817712131472007494913865798627033316302714316558182173808429066105126834108154846605312440011097312079889601614659517203309650928847977239829927109919157628637542448289782578908726748073754545368694892934543164248376647388327166638381788278369233466837331432738779285930221727722

n = 231774124313204340400480437569710128094062411742447210647066505638235990292682568346188899917458585579754539587153925967627641910263321940559168075519465203199426682209491956719156356315673125359751171637884225761403474352008664291758137777288638069452361862436640016124938695762126490376722007592730564326902427680274319166018847962352432025195

e = 65537

print("[*] b00tl3gRSA3 - Ataque con múltiples primos pequeños")
print(f"[*] n = {n}")
print(f"[*] Longitud de n: {n.bit_length()} bits\n")

# Generar lista extendida de primos
print("[*] Generando primos hasta 100,000...")
primes_list = list(sympy.primerange(2, 100000))
print(f"[*] Total de primos a probar: {len(primes_list)}")

# Factorizar agresivamente
factors = []
remaining = n

print("[*] Factorizando...")
for i, p in enumerate(primes_list):
    if i % 1000 == 0:
        print(f"    Probando primo #{i}: {p}")
    
    while remaining % p == 0:
        factors.append(p)
        remaining //= p
        print(f"[+] Factor encontrado: {p}")
    
    if remaining == 1:
        break

print(f"\n[*] Factores encontrados: {factors}")
print(f"[*] Número restante: {remaining}")

if remaining > 1:
    # Si queda un número grande, podría ser primo o producto de primos grandes
    print(f"[!] Queda un factor grande: {remaining}")
    
    # Verificar si es primo
    print("[*] Verificando primalidad del resto...")
    if sympy.isprime(remaining):
        print("[+] El resto es primo!")
        factors.append(remaining)
    else:
        print("[!] El resto NO es primo, intentando factorización más profunda...")
        
        # Intentar factorización con sympy
        print("[*] Usando sympy.factorint con timeout...")
        try:
            more_factors = sympy.factorint(remaining, limit=1000000, use_trial=True, use_rho=True, use_pm1=True)
            print(f"[+] Factores adicionales: {more_factors}")
            for prime, count in more_factors.items():
                for _ in range(count):
                    factors.append(prime)
        except:
            print("[!] No se pudo factorizar el resto")
            factors.append(remaining)

print(f"\n[+] FACTORIZACIÓN COMPLETA:")
print(f"    Factores: {factors}")
print(f"    Total de factores: {len(factors)}")

# Verificar factorización
product = 1
for f in factors:
    product *= f

if product == n:
    print("[+] Factorización verificada correctamente!")
    
    # Calcular phi(n)
    print("\n[*] Calculando phi(n)...")
    phi = 1
    unique_factors = list(set(factors))
    
    for p in unique_factors:
        count = factors.count(p)
        phi *= (p ** (count - 1)) * (p - 1)
    
    print(f"[*] phi(n) calculado")
    
    # Calcular clave privada
    print("[*] Calculando clave privada d...")
    d = inverse(e, phi)
    
    # Descifrar
    print("[*] Descifrando mensaje...")
    m = pow(c, d, n)
    
    # Convertir a texto
    print("[*] Convirtiendo a texto...")
    flag_bytes = long_to_bytes(m)
    
    # Intentar diferentes decodificaciones
    try:
        flag = flag_bytes.decode('utf-8')
        print(f"\n{'='*50}")
        print(f"[+] FLAG ENCONTRADO: {flag}")
        print(f"{'='*50}")
    except:
        try:
            flag = flag_bytes.decode('ascii')
            print(f"\n{'='*50}")
            print(f"[+] FLAG ENCONTRADO: {flag}")
            print(f"{'='*50}")
        except:
            try:
                flag = flag_bytes.decode('latin-1')
                print(f"\n{'='*50}")
                print(f"[+] FLAG ENCONTRADO: {flag}")
                print(f"{'='*50}")
            except:
                print(f"[*] Bytes raw: {flag_bytes}")
                print(f"[*] Hex: {flag_bytes.hex()}")
                
                # Buscar patrón picoCTF
                if b'picoCTF' in flag_bytes:
                    start = flag_bytes.index(b'picoCTF')
                    end = flag_bytes.index(b'}', start) + 1
                    flag = flag_bytes[start:end].decode()
                    print(f"\n{'='*50}")
                    print(f"[+] FLAG ENCONTRADO: {flag}")
                    print(f"{'='*50}")
else:
    print("[!] Error en la factorización!")