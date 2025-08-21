#!/usr/bin/env python3

from Crypto.Util.number import long_to_bytes, inverse
import sympy
from sympy.ntheory import factorint

# Datos del servidor
c = 174969454167958615699624741148260730941748443652400512212132925859817712131472007494913865798627033316302714316558182173808429066105126834108154846605312440011097312079889601614659517203309650928847977239829927109919157628637542448289782578908726748073754545368694892934543164248376647388327166638381788278369233466837331432738779285930221727722

n = 231774124313204340400480437569710128094062411742447210647066505638235990292682568346188899917458585579754539587153925967627641910263321940559168075519465203199426682209491956719156356315673125359751171637884225761403474352008664291758137777288638069452361862436640016124938695762126490376722007592730564326902427680274319166018847962352432025195

e = 65537

print("[*] b00tl3gRSA3 - Factorización completa")
print(f"[*] n tiene {n.bit_length()} bits")

# Primero intentar con primos muy pequeños
print("\n[*] Fase 1: Extrayendo primos pequeños...")
factors = []
remaining = n

# Primos hasta 10000
for p in sympy.primerange(2, 10000):
    while remaining % p == 0:
        factors.append(p)
        remaining //= p
        print(f"[+] Factor: {p}")

print(f"\n[*] Factores pequeños: {factors}")
print(f"[*] Resto después de primos pequeños: {remaining}")
print(f"[*] Bits del resto: {remaining.bit_length()}")

# El resto es muy grande, intentar métodos más avanzados
if remaining > 1:
    print("\n[*] Fase 2: Factorizando el resto grande...")
    print("[*] Intentando con ECM (Elliptic Curve Method)...")
    
    # Usar factorint de sympy con métodos avanzados
    try:
        print("[*] Esto puede tardar un momento...")
        # Usar límite más alto y múltiples métodos
        more_factors = factorint(remaining, limit=10**8, use_trial=True, use_rho=True, use_pm1=True, verbose=True)
        
        print(f"\n[+] Factorización del resto: {more_factors}")
        
        for prime, count in more_factors.items():
            for _ in range(count):
                factors.append(prime)
                
    except KeyboardInterrupt:
        print("\n[!] Interrumpido por usuario")
    except Exception as e:
        print(f"[!] Error en factorización: {e}")

# Si aún no tenemos suficientes factores, el problema podría ser diferente
if len(factors) < 3:
    print("\n[!] Parece que n no tiene muchos factores pequeños")
    print("[*] Intentando approach diferente...")
    
    # Tal vez el servidor genera n diferente cada vez
    print("[*] El servidor podría generar diferentes valores cada conexión")
    print("[*] Intentemos con los factores que tenemos...")

print(f"\n[+] FACTORES FINALES: {factors}")

# Verificar multiplicación
product = 1
for f in factors:
    product *= f

if product == n:
    print("[+] Factorización completa verificada!")
    
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
    
    # Convertir a flag
    flag_bytes = long_to_bytes(m)
    
    # Buscar el flag
    if b'picoCTF' in flag_bytes:
        start = flag_bytes.index(b'picoCTF')
        end = flag_bytes.index(b'}', start) + 1
        flag = flag_bytes[start:end].decode()
        print(f"\n{'='*60}")
        print(f"[+] FLAG: {flag}")
        print(f"{'='*60}")
    else:
        # Intentar decodificar todo
        for encoding in ['utf-8', 'ascii', 'latin-1']:
            try:
                flag = flag_bytes.decode(encoding)
                if 'picoCTF' in flag or 'pico' in flag:
                    print(f"\n{'='*60}")
                    print(f"[+] FLAG: {flag}")
                    print(f"{'='*60}")
                    break
            except:
                pass
        else:
            print(f"[*] Hex: {flag_bytes.hex()}")
            print(f"[*] Raw: {flag_bytes}")
else:
    print(f"[!] Factorización incompleta. Producto: {product}, n: {n}")
    print("[!] Necesitamos conectar de nuevo al servidor para obtener un n más fácil")
    
    # Script para reconectar
    print("\n[*] Script para reconectar:")
    print("""
import socket
s = socket.socket()
s.connect(('jupiter.challenges.picoctf.org', 51575))
data = s.recv(4096).decode()
print(data)
s.close()
""")