#!/usr/bin/env python3
from Crypto.Util.number import long_to_bytes, bytes_to_long
import gmpy2

# Parámetros del servidor
c = 8174472944243839884578259089214683411048501861886589612089100351281588140558801801020155359931707188305034770648297955164681810157375440920438149459151299848461575987266787963648881929400047576407253920185336240680687271185654494859629902291588932801476761812592291731567261124725554961808645239681506422742

n = 8250877316620302833549214065075297292915589095818736663703424934949269599037444801986419675304389861616873089742305101460462766698178543563958242097646456915453069953151141838831478725996201150801604384514196006507188562367203260138281080869474736585277877368675685002832849984619639995421622564934960388391

e = 1830534754164200424184896661522419742115029150757654929127787334698908707600354722078864489966367526556133706529946689278348545520721363861939863590029745884092731552356643157802862770048310766009034673023181788711571021662860275004509743035464561533757132091356859841997225755237101227930970759330310091937

print(f"Tamaño de e: {e.bit_length()} bits")
print(f"Tamaño de n: {n.bit_length()} bits")

# Si están usando d para cifrar, entonces e es muy grande
# Esto sugiere un ataque de Wiener o factorización

# Intentemos factorizar n si es pequeño o tiene factores débiles
print("\nIntentando factorización rápida...")

# Primero verificar si n es primo
if gmpy2.is_prime(n):
    print("n es primo, no se puede factorizar")
else:
    # Intentar factorización simple
    for p in range(2, 100000):
        if n % p == 0:
            q = n // p
            print(f"¡Factores encontrados! p={p}, q={q}")
            
            # Calcular phi(n) y d
            phi = (p - 1) * (q - 1)
            d = gmpy2.invert(e, phi)
            
            # Descifrar
            m = pow(c, d, n)
            flag = long_to_bytes(m)
            print(f"Flag: {flag}")
            break
    else:
        # Si no encontramos factores pequeños, intentar el descifrado directo
        print("No se encontraron factores pequeños")
        
        # Opción 1: Descifrado directo con e
        m1 = pow(c, e, n)
        print(f"\nOpción 1 - c^e mod n:")
        try:
            flag1 = long_to_bytes(m1).decode('utf-8')
            print(f"Decodificado: {flag1}")
        except:
            print(f"Hex: {long_to_bytes(m1).hex()}")
            
        # Opción 2: Tal vez e y d están intercambiados
        # Si e es muy grande, podría ser realmente d
        print("\nBuscando patrones en el mensaje...")