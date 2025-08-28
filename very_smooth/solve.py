#!/usr/bin/env python3
"""
Solución para Very Smooth de picoCTF
Ataque Pollard p-1 para factorizar RSA con primos smooth

El algoritmo Pollard p-1 funciona cuando p-1 tiene solo factores pequeños.
Calculamos a^M mod n donde M es el producto de muchos primos pequeños elevados a potencias.
Si p-1 divide a M, entonces gcd(a^M - 1, n) revelará p.
"""

import gmpy2
from Crypto.Util.number import long_to_bytes
import math

def pollard_p_minus_1(n, B=10**6, a=2):
    """
    Implementación del algoritmo Pollard p-1
    B: límite de smooth (probaremos todos los primos hasta B)
    a: base para el cálculo (usualmente 2)
    """
    print(f"[*] Ejecutando Pollard p-1 con B={B}")
    
    # Calculamos a^M mod n donde M = lcm(1,2,3,...,B)
    # Pero lo hacemos de forma eficiente
    x = a
    
    # Para cada primo pequeño, lo elevamos a la máxima potencia que no exceda B
    for prime in range(2, B):
        if gmpy2.is_prime(prime):
            # Calculamos la máxima potencia de este primo que no exceda B
            power = 1
            temp = prime
            while temp <= B:
                power = temp
                temp *= prime
            
            # x = x^power mod n
            x = pow(x, power, n)
            
            # Verificamos periódicamente si encontramos un factor
            if prime % 1000 == 1:
                g = gmpy2.gcd(x - 1, n)
                if g > 1 and g < n:
                    print(f"[+] Factor encontrado con primo {prime}")
                    return g
    
    # Verificación final
    g = gmpy2.gcd(x - 1, n)
    if g > 1 and g < n:
        return g
    
    return None

def pollard_p_minus_1_optimized(n):
    """
    Versión optimizada de Pollard p-1 específica para este problema
    Sabemos que los factores son de ~16-17 bits
    """
    print("[*] Ejecutando Pollard p-1 optimizado para factores smooth")
    
    a = 2
    x = a
    
    # Como los factores son de 16-17 bits, B = 2^17 debería ser suficiente
    B = 2**17
    
    # Método más eficiente: usar factorial
    print(f"[*] Calculando con B={B}")
    
    # Calculamos a^(B!) mod n de forma iterativa
    for i in range(2, B):
        x = pow(x, i, n)
        
        # Verificamos cada 1000 iteraciones
        if i % 10000 == 0:
            print(f"[*] Progreso: i={i}")
            g = gmpy2.gcd(x - 1, n)
            if g > 1 and g < n:
                print(f"[+] Factor encontrado en iteración {i}")
                return g
    
    # Verificación final
    g = gmpy2.gcd(x - 1, n)
    if g > 1 and g < n:
        return g
    
    return None

def decrypt_rsa(c, n, p, q, e=0x10001):
    """
    Descifra el mensaje RSA dados los primos p y q
    """
    phi = (p - 1) * (q - 1)
    d = gmpy2.invert(e, phi)
    m = pow(c, d, n)
    return m

def main():
    # Valores del output.txt
    n = int("b03ea698ce2b51fb00e11e6fbaf1e5373dc5b0c70eb2b14a36d21e8667be8774eee51f6050a10237f6b24f21204fc8013681e7ed72ed051188f3274aae8f1de0d39389b514c196fa82c98a270bfabefd044da8c687b0e114ebbde82536c0709ac5ad81bfe0077e9d9b798ad5abecee52767e68f8060c45936521fd93893102eb1676f2ff41324a7a6b3dff2e830538e06d25934e9f14bf6b40ab5674fe648e314bf06f84282f5ef52bc1401de3a42eb66e64bcdadd2674348e5bdb7016feda44d719af387a948ad81cbaed10213dd930fc7bc7677d8c4cdab0645d0ff15e6ad6ca37135942c3be08f23e7be0992c8b3370dcdc31045e086d823107fb2e443dc9", 16)
    
    c = int("a913a96e215b5aa79c702d27fa375c73d06787639c4131fb32877cafefaa8faf70e15f6a17ef2a9a6f5310b157cb287b740e77cb5385081d1853a9104bc16357b259fa2d146bd87398d4ef6f1c078289812952c67792cf9cd745049aeb9d4ab4dff2825a9c0b3381f19b2a67164f9d4de33c25f98bc2f224feb5507b531e1a1c7be5ed2d8ddd01f3fae37245e8cf99c75a21848993d445e1d6d69d555a3e6cc8055704fdde88df9084bda3ea65a9384fa64bf8df4d88946449526320c15d4d2d871638070489adf3f8c95caffeab40b0d137a9319be20cdf6ebbaf037f62093d9bd33edd4ffd7e1929b9ab06252956fd85250a0515ef2b4e035017be5702cdd3", 16)
    
    print("[*] Very Smooth Solver - Pollard p-1 Attack")
    print(f"[*] n = {hex(n)[:50]}...")
    print(f"[*] c = {hex(c)[:50]}...")
    print()
    
    # Paso 1: Factorizar n usando Pollard p-1
    print("[*] Factorizando n con Pollard p-1...")
    
    # Primero intentamos con límite pequeño
    p = pollard_p_minus_1(n, B=100000)
    
    if p is None:
        print("[*] Aumentando límite B...")
        p = pollard_p_minus_1_optimized(n)
    
    if p is None:
        print("[-] No se pudo factorizar n")
        return
    
    q = n // p
    
    # Verificación
    if p * q != n:
        print("[-] Error en la factorización")
        return
    
    print(f"[+] p = {hex(p)[:50]}...")
    print(f"[+] q = {hex(q)[:50]}...")
    print(f"[+] Verificación: p*q == n: {p*q == n}")
    print()
    
    # Paso 2: Descifrar el mensaje
    print("[*] Descifrando el mensaje...")
    m = decrypt_rsa(c, n, p, q)
    
    # Paso 3: Convertir a texto
    print("[*] Convirtiendo a texto...")
    try:
        flag = long_to_bytes(m).decode('utf-8')
        print(f"\n[+] FLAG ENCONTRADA: {flag}")
    except:
        flag_bytes = long_to_bytes(m)
        print(f"\n[+] FLAG (hex): {flag_bytes.hex()}")
        print(f"[+] FLAG (bytes): {flag_bytes}")

if __name__ == "__main__":
    main()