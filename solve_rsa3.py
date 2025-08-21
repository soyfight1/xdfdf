#!/usr/bin/env python3
from Crypto.Util.number import long_to_bytes
import gmpy2

# Parámetros del servidor
c = 8174472944243839884578259089214683411048501861886589612089100351281588140558801801020155359931707188305034770648297955164681810157375440920438149459151299848461575987266787963648881929400047576407253920185336240680687271185654494859629902291588932801476761812592291731567261124725554961808645239681506422742

n = 8250877316620302833549214065075297292915589095818736663703424934949269599037444801986419675304389861616873089742305101460462766698178543563958242097646456915453069953151141838831478725996201150801604384514196006507188562367203260138281080869474736585277877368675685002832849984619639995421622564934960388391

e = 1830534754164200424184896661522419742115029150757654929127787334698908707600354722078864489966367526556133706529946689278348545520721363861939863590029745884092731552356643157802862770048310766009034673023181788711571021662860275004509743035464561533757132091356859841997225755237101227930970759330310091937

print(f"e tiene {e.bit_length()} bits - ¡MUY GRANDE!")
print(f"n tiene {n.bit_length()} bits")

# Factorización encontrada
p = 19417
q = n // p

print(f"\np = {p}")
print(f"q = {q}")
print(f"Verificación: p*q == n? {p*q == n}")

# Calcular phi(n)
phi = (p - 1) * (q - 1)

# El problema dice que están usando d para cifrar
# Entonces e es en realidad d (la clave privada grande)
# Y necesitamos calcular el verdadero e (que debe ser pequeño)

d = e  # Lo que nos dieron como 'e' es realmente 'd'
real_e = gmpy2.invert(d, phi)

print(f"\nEl verdadero e (pequeño): {real_e}")

# Ahora desciframos con el verdadero e
# Si cifraron con d: c = m^d mod n
# Entonces: m = c^e mod n
m = pow(c, real_e, n)

flag = long_to_bytes(m)
print(f"\nFlag: {flag}")

# Intentar decodificar
try:
    print(f"Decodificado: {flag.decode('utf-8')}")
except:
    # Buscar picoCTF
    if b'picoCTF' in flag:
        idx = flag.find(b'picoCTF')
        print(f"Flag encontrada: {flag[idx:].decode('utf-8', errors='ignore')}")
    else:
        print(f"Hex: {flag.hex()}")