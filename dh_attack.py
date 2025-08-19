#!/usr/bin/env python3

import requests
import re
import time
from urllib.parse import urlencode

# URLs
base_url = "https://diffie-hellman.crypto.w3challs.com/"
dhkey_url = base_url + "dhkey.php"
solution_url = base_url + "solution_diffie_hellman.php"

# Parámetros DH
p = 1091136745528189467933281517836874347556227973368844785834730809158502707734111726197047853034779577326799376909360702796771580766448794604223666095534254989157674044885025529655475251174022547573400542404497196315179009518790845093
g = 788566880005302277341720913014765764523749662717255764973422789169351342670625046069737389605574848412134408890505831396888152508510392260349529979008920978675421422171288130340362523984410268300658262790954147173882579740249230159

print("="*60)
print("ATAQUE MAN-IN-THE-MIDDLE A DIFFIE-HELLMAN")
print("="*60)

# Crear sesión
session = requests.Session()

# Resetear el challenge
print("\n[1] Obteniendo estado inicial...")
response = session.get(dhkey_url)
html = response.text

print("[*] Contenido inicial:")
print("-" * 40)
print(html[:1000])
print("-" * 40)

# Estrategia: Interceptar y modificar para que el secreto sea 1
# Si A=1 y B=1, entonces el secreto compartido es 1^b mod p = 1

print("\n[2] Enviando A=1 desde Alice...")

# Preparar el mensaje con A=1
alice_message = '''[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1"'''

# Enviar A=1
data = {'alice_send_key': alice_message}
response = session.post(dhkey_url + "?type=alice_send_key", data=data)

# Esperar un poco para que Bob responda
time.sleep(2)

# Obtener la respuesta de Bob
print("\n[3] Obteniendo respuesta de Bob...")
response = session.get(dhkey_url)
html = response.text

# Buscar el formulario de Bob
if 'name=bob_send_key' in html:
    print("[*] Bob está respondiendo...")
    
    # Extraer el mensaje de Bob
    match = re.search(r'<textarea[^>]*name=bob_send_key[^>]*>(.*?)</textarea>', html, re.DOTALL)
    if match:
        bob_original = match.group(1)
        print(f"[*] Mensaje original de Bob:\n{bob_original[:200]}...")
        
        # Buscar el valor B original
        b_match = re.search(r'B = (\d+)', bob_original)
        if b_match:
            B_original = b_match.group(1)
            print(f"[*] B original = {B_original}")
            
            # Modificar B=1
            bob_modified = re.sub(r'B = \d+', 'B = 1', bob_original)
            print(f"[*] Modificando a B = 1")
            
            # Enviar el mensaje modificado
            data = {'bob_send_key': bob_modified}
            response = session.post(dhkey_url + "?type=bob_send_key", data=data)
            
            time.sleep(2)

# Obtener el resultado final
print("\n[4] Obteniendo resultado final...")
response = session.get(dhkey_url)
html = response.text

# Buscar el código cifrado
encrypted_match = re.search(r'Encrypted code : (\d+)', html)
if encrypted_match:
    encrypted_code = int(encrypted_match.group(1))
    print(f"[*] Código cifrado encontrado: {encrypted_code}")
    
    # El secreto compartido debería ser 1
    secret = 1
    print(f"[*] Secreto compartido forzado: {secret}")
    
    # Descifrar con XOR
    plaintext = encrypted_code ^ secret
    print(f"[*] Código descifrado: {plaintext}")
    
    # Probar la solución
    print(f"\n[5] Verificando solución...")
    verify_url = f"{solution_url}?password={plaintext}"
    response = session.get(verify_url)
    
    print(f"[*] URL: {verify_url}")
    print(f"[*] Respuesta:")
    print("-" * 40)
    print(response.text[:1000])
    
    # Buscar la flag
    if "flag" in response.text.lower() or "congratulations" in response.text.lower():
        print("\n" + "🔥" * 20)
        print("¡FLAG ENCONTRADA!")
        # Extraer la flag
        flag_match = re.search(r'(flag[^<>]*|W3C[^<>]*|congratulations[^<>]*)', response.text, re.IGNORECASE)
        if flag_match:
            print(f"FLAG: {flag_match.group(1)}")
else:
    print("[!] No se encontró código cifrado. Verificando el HTML completo...")
    print(html)

print("\n[*] Si no funcionó, intentemos reiniciar y probar de nuevo...")

# Intentar una vez más con una nueva sesión
print("\n[6] Segundo intento con sesión limpia...")
session2 = requests.Session()

# Paso 1: Enviar A=1
response = session2.get(dhkey_url)
data = {'alice_send_key': alice_message}
response = session2.post(dhkey_url + "?type=alice_send_key", data=data)
time.sleep(1)

# Paso 2: Interceptar respuesta de Bob
response = session2.get(dhkey_url)
if 'name=bob_send_key' in response.text:
    match = re.search(r'<textarea[^>]*name=bob_send_key[^>]*>(.*?)</textarea>', response.text, re.DOTALL)
    if match:
        bob_msg = match.group(1)
        bob_modified = re.sub(r'B = \d+', 'B = 1', bob_msg)
        data = {'bob_send_key': bob_modified}
        response = session2.post(dhkey_url + "?type=bob_send_key", data=data)
        time.sleep(1)

# Paso 3: Ver si Alice envía el código
response = session2.get(dhkey_url)
if 'name=alice_send_code' in response.text:
    print("[*] Alice está enviando el código...")
    match = re.search(r'<textarea[^>]*name=alice_send_code[^>]*>(.*?)</textarea>', response.text, re.DOTALL)
    if match:
        alice_code_msg = match.group(1)
        print(f"[*] Mensaje de Alice con código:\n{alice_code_msg[:300]}...")
        
        # Enviar tal cual para ver el código cifrado
        data = {'alice_send_code': alice_code_msg}
        response = session2.post(dhkey_url + "?type=alice_send_code", data=data)
        time.sleep(1)
        
        # Buscar el código cifrado en el mensaje
        code_match = re.search(r'Encrypted code : (\d+)', alice_code_msg)
        if code_match:
            encrypted = int(code_match.group(1))
            decrypted = encrypted ^ 1  # XOR con secreto=1
            print(f"\n[*] Código cifrado: {encrypted}")
            print(f"[*] Código descifrado: {decrypted}")
            
            # Verificar
            verify_url = f"{solution_url}?password={decrypted}"
            response = session2.get(verify_url)
            print(f"\n[*] Verificación final: {verify_url}")
            print(response.text[:500])