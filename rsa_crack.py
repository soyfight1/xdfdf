#!/usr/bin/env python3

import gmpy2
from Crypto.Util.number import long_to_bytes
import sympy

# Datos del problema
N = 783340156742833416191
e = 653

# Mensaje cifrado
ciphertext = [
    309117097659990665453,
    125675338953457551017,
    524099092120785248852,
    772538252438953530955,
    547462544172248492882,
    28215860448757441963,  # Corregido - sin el 0 inicial
    543018082275730030658,
    585936545563088067075,
    131807465077304821584
]

print(f"[*] N = {N}")
print(f"[*] e = {e}")
print(f"[*] Factorizando N...")

# Factorizar N - con números pequeños es rápido
factors = sympy.factorint(N)
print(f"[*] Factores encontrados: {factors}")

# Obtener p y q
factor_list = []
for prime, exp in factors.items():
    for _ in range(exp):
        factor_list.append(prime)

if len(factor_list) == 2:
    p, q = factor_list[0], factor_list[1]
else:
    print("[!] N no es producto de exactamente 2 primos")
    p = factor_list[0]
    q = N // p

print(f"[*] p = {p}")
print(f"[*] q = {q}")
print(f"[*] Verificando: p*q = {p*q} == N: {p*q == N}")

# Calcular phi(N)
phi = (p - 1) * (q - 1)
print(f"[*] phi(N) = {phi}")

# Calcular d (inverso modular de e mod phi)
d = gmpy2.invert(e, phi)
print(f"[*] d = {d}")

# Descifrar cada bloque
print("\n[*] Descifrando bloques...")
plaintext_blocks = []
for i, c in enumerate(ciphertext):
    m = pow(c, d, N)
    plaintext_blocks.append(m)
    print(f"    Bloque {i}: {c} -> {m}")

# Convertir a texto
print("\n[*] Convirtiendo a texto...")
flag = ""
for block in plaintext_blocks:
    try:
        # Intentar convertir directamente
        text = long_to_bytes(block).decode('ascii', errors='ignore')
        flag += text
        print(f"    {block} -> '{text}'")
    except:
        # Si falla, intentar como hex
        hex_str = hex(block)[2:]
        if len(hex_str) % 2:
            hex_str = '0' + hex_str
        try:
            text = bytes.fromhex(hex_str).decode('ascii', errors='ignore')
            flag += text
            print(f"    {block} -> '{text}'")
        except:
            print(f"    {block} -> [no decodificable]")

print(f"\n[+] FLAG ENCONTRADA: {flag}")
print(f"[+] FLAG (sin espacios): {flag.replace(' ', '')}")
print(f"[+] FLAG (limpia): {''.join(c for c in flag if c.isprintable())}")