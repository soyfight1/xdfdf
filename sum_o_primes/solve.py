#!/usr/bin/env python3
"""
Solución para Sum-O-Primes de picoCTF
Ataque RSA cuando conocemos N (producto) y x (suma) de los primos p y q

Matemáticas:
- Sabemos que x = p + q y n = p * q
- p y q son raíces de la ecuación: t² - xt + n = 0
- Por la fórmula cuadrática: t = (x ± √(x² - 4n)) / 2
- Esto nos da p = (x + √(x² - 4n)) / 2 y q = (x - √(x² - 4n)) / 2
"""

import gmpy2
from Crypto.Util.number import long_to_bytes

def recover_primes(x, n):
    """
    Recupera los primos p y q dados su suma x y producto n
    """
    # Calculamos el discriminante
    discriminant = x**2 - 4*n
    
    # Verificamos que sea un cuadrado perfecto
    sqrt_discriminant = gmpy2.isqrt(discriminant)
    if sqrt_discriminant**2 != discriminant:
        print("Error: El discriminante no es un cuadrado perfecto")
        return None, None
    
    # Calculamos p y q
    p = (x + sqrt_discriminant) // 2
    q = (x - sqrt_discriminant) // 2
    
    # Verificamos que son primos y su producto es n
    if p * q != n:
        print("Error: Los valores calculados no son correctos")
        return None, None
    
    return p, q

def decrypt_rsa(c, n, p, q, e=65537):
    """
    Descifra el mensaje RSA dados los primos p y q
    """
    # Calculamos phi(n) = (p-1)(q-1)
    phi = (p - 1) * (q - 1)
    
    # Calculamos d, el inverso modular de e
    d = gmpy2.invert(e, phi)
    
    # Desciframos el mensaje
    m = pow(c, d, n)
    
    return m

def main():
    # Valores del output.txt
    x = 0x1626a189dcb38ca6b8e9ee26623ab5c3c6cd7e4c7ff6726f4b03831ca48c617a056827c5763458d0aa7172650072b892649cc73f943f156b795ff5dd2fc9a53b140cf9c3ee2cbb8181d17bb0275f404b4090766f798ad156db7e71000e93db65f3e1bc7406532d0f509fbecf095ef215b4ad51f5e8ac765861e5f93808948bf72
    
    n = 0x720d66204ec312d7f1bc688495d4585ec58520170b86ed3488c3f9c76407b7e9e466b82a282ba90d484698160f2e27f413b07cf8805d560abdffa977547d5fec3190a1ce284dfc8e92193f2f70590bf9c6e6d0ab449e35ef43ed20232b7f8686696125cde1f950230fbc6858392a3715c1b8a4947748b7fadd5cc921716ad5e0129c91ea88fceee140fb1c594606186afacb69143ef8f7b3b1aa2cc3206395c60e71ec0555dd15838d8a8395e8ccf9a4e4c4199ae0ab3f8af7ebc6605edc5ddd480be2d6c41e38618eba5822a1e566080877268802750de71e890ac865ebf87fdc290d9151e407dff4c97390c9e7388fd538e2716515cea2240f55963c2e0c21
    
    c = 0x554b90eb12fbece709d7bf23ab91f9b52d71cd77fbf42f65d68623c2055d99956b9bcf2eaf14771fa5781fae86624e44b452a0f68768849faba1b9695ce353a17238a3e7040ee7aede68b35bf4b51daf0982653910b280ac98aad9a5b3c49d226e10b2e8660effc2cb2a553039bde527e42f1795bc078af6ed2928505be6df1ebe993f2ed8c10477dd5cc9f899d1e69b6512b71c732472dde521f5393c76b2f9fbed668560d4e50ca177dd14b923414549d688b20fab94dba7cad7b5a729941c772dc4a1db79b0e6a111d2d2e8998b4e2a272dc940a9dd4cf856faa5a2ee0cb6f36f0ce6edbb421697e517a4d589cc5a880eecf6fbf65e5f6a1a437b06e5ff9a
    
    print("[*] Sum-O-Primes Solver")
    print(f"[*] x (suma de primos) = {hex(x)[:50]}...")
    print(f"[*] n (producto de primos) = {hex(n)[:50]}...")
    print(f"[*] c (texto cifrado) = {hex(c)[:50]}...")
    print()
    
    # Paso 1: Recuperar los primos p y q
    print("[*] Recuperando primos p y q...")
    p, q = recover_primes(x, n)
    
    if p is None or q is None:
        print("[-] No se pudieron recuperar los primos")
        return
    
    print(f"[+] p = {hex(p)[:50]}...")
    print(f"[+] q = {hex(q)[:50]}...")
    
    # Verificación
    assert p * q == n, "Error: p*q != n"
    assert p + q == x, "Error: p+q != x"
    print("[+] Verificación exitosa: p*q = n y p+q = x")
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
        # Si falla la decodificación UTF-8, mostramos en hex
        flag_bytes = long_to_bytes(m)
        print(f"\n[+] FLAG (hex): {flag_bytes.hex()}")
        print(f"[+] FLAG (bytes): {flag_bytes}")

if __name__ == "__main__":
    main()