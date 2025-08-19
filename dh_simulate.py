#!/usr/bin/env python3

import requests
import re
import random

print("💀" * 30)
print("SIMULACIÓN COMPLETA DEL INTERCAMBIO")
print("💀" * 30)

base = "https://diffie-hellman.crypto.w3challs.com/"

# Parámetros DH
p = 1091136745528189467933281517836874347556227973368844785834730809158502707734111726197047853034779577326799376909360702796771580766448794604223666095534254989157674044885025529655475251174022547573400542404497196315179009518790845093
g = 788566880005302277341720913014765764523749662717255764973422789169351342670625046069737389605574848412134408890505831396888152508510392260349529979008920978675421422171288130340362523984410268300658262790954147173882579740249230159

# Simular valores reales de Alice y Bob
print("\n[*] Simulando intercambio DH real...")

# Alice elige a
a = random.randint(2, 100)
A = pow(g, a, p)
print(f"[Alice] a = {a}")
print(f"[Alice] A = g^a mod p = {A}")

# Bob elige b  
b = random.randint(2, 100)
B = pow(g, b, p)
print(f"[Bob] b = {b}")
print(f"[Bob] B = g^b mod p = {B}")

# Secreto compartido
secret_alice = pow(B, a, p)
secret_bob = pow(A, b, p)
print(f"\n[*] Secreto de Alice: B^a mod p = {secret_alice}")
print(f"[*] Secreto de Bob: A^b mod p = {secret_bob}")
print(f"[*] Secretos iguales: {secret_alice == secret_bob}")

# Ahora intentar con el servidor
print("\n[*] Intentando obtener un intercambio real del servidor...")

s = requests.Session()

# Obtener página principal
resp = s.get(base + "challenge_diffie_hellman.php")
cookie = s.cookies.get('PHPSESSID')
print(f"[*] Cookie: {cookie}")

# Intentar capturar un intercambio real sin modificar
resp = s.get(base + "dhkey.php")

# Buscar si hay algún intercambio ya en progreso
if "A =" in resp.text and "B =" in resp.text:
    print("[!] Intercambio en progreso encontrado!")
    
    # Extraer A y B
    a_match = re.search(r'A = (\d+)', resp.text)
    b_match = re.search(r'B = (\d+)', resp.text)
    
    if a_match and b_match:
        A_real = int(a_match.group(1))
        B_real = int(b_match.group(1))
        print(f"[*] A real = {A_real}")
        print(f"[*] B real = {B_real}")
        
        # Si hay código cifrado
        if "Encrypted code" in resp.text:
            enc_match = re.search(r'Encrypted code\s*:\s*(\d+)', resp.text)
            if enc_match:
                encrypted = int(enc_match.group(1))
                print(f"[*] Código cifrado = {encrypted}")
                
                # El problema es que no conocemos a ni b
                # Pero si A=1 o B=1, el secreto es 1
                if A_real == 1 or B_real == 1:
                    secret = 1
                    plaintext = encrypted ^ secret
                    print(f"[!] Secreto = 1, plaintext = {plaintext}")
                    
                    resp = s.get(f"{base}solution_diffie_hellman.php?password={plaintext}")
                    if "flag" in resp.text.lower():
                        print(f"[!] FLAG ENCONTRADA!")
                        print(resp.text)

# Intentar forzar un intercambio con valores conocidos
print("\n[*] Forzando intercambio con valores pequeños...")

# Probar con exponentes pequeños que podemos calcular
for exp in range(1, 20):
    test_val = pow(g, exp, p)
    
    # Si el valor es manejable
    if test_val < 10**15:  # Número razonable
        print(f"[*] Probando g^{exp} = {test_val}")
        
        # Calcular el secreto si ambos usan este valor
        secret = pow(test_val, exp, p)
        
        # Probar algunos códigos cifrados comunes
        for enc in [1234567890, 9876543210, 1111111111, 9999999999]:
            plaintext = enc ^ secret
            
            # Verificar
            resp = s.get(f"{base}solution_diffie_hellman.php?password={plaintext}")
            if "flag" in resp.text.lower() and "wrong" not in resp.text.lower():
                print(f"[!] FLAG con exp={exp}, enc={enc}, plaintext={plaintext}!")
                print(resp.text[:500])

# Estrategia final: Discrete log pequeño
print("\n[*] Intentando discrete log con valores pequeños...")

# Si el servidor usa exponentes pequeños, podemos hacer fuerza bruta
target_values = []

# Obtener página y buscar valores A o B
resp = s.get(base + "dhkey.php")
numbers = re.findall(r'\b(\d{10,})\b', resp.text)

for num in numbers:
    num_int = int(num)
    if num_int != p and num_int != g:
        target_values.append(num_int)
        print(f"[*] Valor encontrado: {num_int}")

# Para cada valor, intentar encontrar el logaritmo discreto
for target in target_values[:5]:  # Solo los primeros 5 para no tardar mucho
    print(f"\n[*] Buscando log discreto de {target}...")
    
    for x in range(1, 1000):
        if pow(g, x, p) == target:
            print(f"[!] Encontrado: g^{x} = {target}")
            
            # Si conocemos x, podemos calcular el secreto
            # Asumiendo que ambos usan el mismo x (caso MITM con A=B)
            secret = pow(target, x, p)
            
            # Buscar código cifrado en la página
            if "Encrypted code" in resp.text:
                enc_match = re.search(r'Encrypted code\s*:\s*(\d+)', resp.text)
                if enc_match:
                    enc = int(enc_match.group(1))
                    plaintext = enc ^ secret
                    
                    print(f"[*] Probando plaintext = {plaintext}")
                    resp = s.get(f"{base}solution_diffie_hellman.php?password={plaintext}")
                    
                    if "flag" in resp.text.lower():
                        print(f"[!] FLAG ENCONTRADA!")
                        print(resp.text)
            break

print("\n" + "💀"*30)
print("FIN DE SIMULACIÓN")
print("💀"*30)