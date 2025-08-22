#!/usr/bin/env python3

n = 1422450808944701344261903748621562998784243662042303391362692043823716783771691667
c = 843044897663847841476319711639772861390329326681532977209935413827620909782846667
e = 65537

print("=" * 70)
print("FACTORIZACIÓN RSA - MÉTODOS AVANZADOS")
print("=" * 70)

print(f"\nN = {n}")
print(f"N tiene {n.bit_length()} bits")

# Intentar instalar y usar sympy si está disponible
try:
    from sympy import factorint
    print("\nUsando sympy.factorint()...")
    factors = factorint(n)
    print(f"Factores encontrados: {factors}")
    
    # Extraer p y q
    factor_list = list(factors.keys())
    if len(factor_list) == 2:
        p, q = factor_list[0], factor_list[1]
    elif len(factor_list) == 1:
        p = factor_list[0]
        q = n // p
    
    print(f"\np = {p}")
    print(f"q = {q}")
    print(f"p tiene {p.bit_length()} bits")
    print(f"q tiene {q.bit_length()} bits")
    
except ImportError:
    print("\nsympy no está instalado, intentando instalarlo...")
    import subprocess
    import sys
    
    # Intentar instalar sympy
    try:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "sympy", "-q"])
        print("sympy instalado exitosamente")
        
        from sympy import factorint
        print("\nUsando sympy.factorint()...")
        factors = factorint(n)
        print(f"Factores encontrados: {factors}")
        
        # Extraer p y q
        factor_list = list(factors.keys())
        if len(factor_list) == 2:
            p, q = factor_list[0], factor_list[1]
        elif len(factor_list) == 1:
            p = factor_list[0]
            q = n // p
        
        print(f"\np = {p}")
        print(f"q = {q}")
        print(f"p tiene {p.bit_length()} bits")
        print(f"q tiene {q.bit_length()} bits")
        
    except:
        print("No se pudo instalar sympy")
        
        # Método alternativo: Fermat's factorization
        print("\nIntentando factorización de Fermat...")
        import math
        
        def fermat_factor(n):
            a = math.isqrt(n)
            if a * a < n:
                a += 1
            
            steps = 0
            while steps < 1000000:
                b2 = a * a - n
                b = math.isqrt(b2)
                if b * b == b2:
                    return a - b, a + b
                a += 1
                steps += 1
                if steps % 100000 == 0:
                    print(f"  Probado {steps} iteraciones...")
            return None, None
        
        p, q = fermat_factor(n)
        if p and q:
            print(f"\n✅ Factores encontrados con Fermat!")
            print(f"p = {p}")
            print(f"q = {q}")
            print(f"p tiene {p.bit_length()} bits")
            print(f"q tiene {q.bit_length()} bits")

# Si tenemos p y q, descifrar
if 'p' in locals() and 'q' in locals() and p and q:
    print("\n" + "=" * 70)
    print("DESCIFRANDO RSA")
    print("=" * 70)
    
    # Calcular phi
    phi = (p - 1) * (q - 1)
    
    # Calcular d (inverso modular)
    def extended_gcd(a, b):
        if a == 0:
            return b, 0, 1
        gcd, x1, y1 = extended_gcd(b % a, a)
        x = y1 - (b // a) * x1
        y = x1
        return gcd, x, y
    
    def mod_inverse(e, phi):
        gcd, x, _ = extended_gcd(e, phi)
        if gcd != 1:
            raise Exception('El inverso modular no existe')
        return (x % phi + phi) % phi
    
    d = mod_inverse(e, phi)
    print(f"d (clave privada) calculada")
    
    # Descifrar
    m = pow(c, d, n)
    print(f"\nMensaje como número: {m}")
    
    # Convertir a texto
    try:
        message_hex = hex(m)[2:]
        if len(message_hex) % 2:
            message_hex = '0' + message_hex
        message_bytes = bytes.fromhex(message_hex)
        message = message_bytes.decode('ascii')
        
        print(f"Mensaje hex: {message_hex}")
        print(f"Mensaje texto: {message}")
        
        if 'picoCTF{' in message:
            print(f"\n{'='*70}")
            print(f"🏁 BANDERA ENCONTRADA: {message}")
            print("=" * 70)
    except Exception as e:
        print(f"Error al decodificar: {e}")
        print(f"Mensaje como hex: {hex(m)}")