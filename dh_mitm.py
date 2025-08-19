#!/usr/bin/env python3

import requests
import re
from bs4 import BeautifulSoup
import time

# URL base
base_url = "https://diffie-hellman.crypto.w3challs.com/"
dhkey_url = base_url + "dhkey.php"

# Parámetros DH dados
p = 1091136745528189467933281517836874347556227973368844785834730809158502707734111726197047853034779577326799376909360702796771580766448794604223666095534254989157674044885025529655475251174022547573400542404497196315179009518790845093
g = 788566880005302277341720913014765764523749662717255764973422789169351342670625046069737389605574848412134408890505831396888152508510392260349529979008920978675421422171288130340362523984410268300658262790954147173882579740249230159

print("[*] Iniciando ataque Man-in-the-Middle en Diffie-Hellman")
print(f"[*] p = {p}")
print(f"[*] g = {g}")

# Crear sesión para mantener cookies
session = requests.Session()

# Paso 1: Obtener el estado inicial
print("\n[*] Obteniendo estado inicial...")
response = session.get(dhkey_url)
print(f"[*] Status: {response.status_code}")

# Buscar si Alice ya envió A
if "A =" in response.text:
    match = re.search(r'A = (\d+)', response.text)
    if match:
        A = int(match.group(1))
        print(f"[*] Alice ya envió A = {A}")
else:
    print("[*] Alice aún no ha enviado A")
    # Enviar el primer mensaje de Alice para iniciar el intercambio
    data = {
        'alice_send_key': '''[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1"'''
    }
    response = session.post(dhkey_url + "?type=alice_send_key", data=data)
    print("[*] Iniciando intercambio...")
    time.sleep(1)
    
    # Obtener respuesta
    response = session.get(dhkey_url)

# Ahora deberíamos tener A y posiblemente B
print("\n[*] Analizando intercambio actual...")

# Extraer A y B si están presentes
A = None
B = None
secret = None
encrypted_code = None

if "A =" in response.text:
    match = re.search(r'A = (\d+)', response.text)
    if match:
        A = int(match.group(1))
        print(f"[*] A (de Alice) = {A}")

if "B =" in response.text:
    match = re.search(r'B = (\d+)', response.text)
    if match:
        B = int(match.group(1))
        print(f"[*] B (de Bob) = {B}")

# Buscar el código cifrado si existe
if "Encrypted code :" in response.text:
    match = re.search(r'Encrypted code : (\d+)', response.text)
    if match:
        encrypted_code = int(match.group(1))
        print(f"[*] Código cifrado encontrado: {encrypted_code}")

# ESTRATEGIA: Man-in-the-Middle
# Interceptamos y modificamos los valores para conocer el secreto

print("\n[*] Ejecutando ataque MITM...")

# Opción 1: Forzar valores conocidos
# Enviamos A=g y B=g, así el secreto será g^1 mod p = g

# Resetear la sesión
session = requests.Session()
response = session.get(dhkey_url)

# Enviar A = g desde Alice
print(f"[*] Enviando A = g = {g}")
data = {
    'alice_send_key': f'''[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = {g}"'''
}
response = session.post(dhkey_url + "?type=alice_send_key", data=data)
time.sleep(1)

# Obtener respuesta de Bob
response = session.get(dhkey_url)

# Buscar la respuesta de Bob
if "type=bob_send_key" in response.text:
    # Modificar B para que también sea g
    print(f"[*] Interceptando respuesta de Bob y enviando B = g")
    
    # Extraer el mensaje actual de Bob
    soup = BeautifulSoup(response.text, 'html.parser')
    textarea = soup.find('textarea', {'name': 'bob_send_key'})
    if textarea:
        bob_message = textarea.text
        # Modificar B en el mensaje
        modified_message = re.sub(r'B = \d+', f'B = {g}', bob_message)
        
        data = {
            'bob_send_key': modified_message
        }
        response = session.post(dhkey_url + "?type=bob_send_key", data=data)
        time.sleep(1)

# Ahora el secreto compartido debería ser g
secret = g
print(f"\n[*] Secreto compartido forzado: {secret}")

# Obtener el código cifrado
response = session.get(dhkey_url)
if "Encrypted code :" in response.text:
    match = re.search(r'Encrypted code : (\d+)', response.text)
    if match:
        encrypted_code = int(match.group(1))
        print(f"[*] Código cifrado: {encrypted_code}")
        
        # Descifrar con XOR
        plaintext_code = encrypted_code ^ secret
        print(f"[*] Código descifrado: {plaintext_code}")
        
        # Verificar la solución
        solution_url = f"{base_url}solution_diffie_hellman.php?password={plaintext_code}"
        print(f"\n[*] Verificando solución en: {solution_url}")
        
        response = session.get(solution_url)
        print(f"[*] Respuesta: {response.text[:500]}")

print("\n[*] Si no funcionó, intentemos otra estrategia...")

# Estrategia 2: Forzar secreto = 1
print("\n[*] Estrategia 2: Forzar secreto = 1")
session = requests.Session()
response = session.get(dhkey_url)

# Enviar A = 1
data = {
    'alice_send_key': '''[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1"'''
}
response = session.post(dhkey_url + "?type=alice_send_key", data=data)
time.sleep(1)

response = session.get(dhkey_url)

# Modificar B = 1
if "type=bob_send_key" in response.text:
    soup = BeautifulSoup(response.text, 'html.parser')
    textarea = soup.find('textarea', {'name': 'bob_send_key'})
    if textarea:
        bob_message = textarea.text
        modified_message = re.sub(r'B = \d+', 'B = 1', bob_message)
        
        data = {
            'bob_send_key': modified_message
        }
        response = session.post(dhkey_url + "?type=bob_send_key", data=data)
        time.sleep(1)

# Obtener código cifrado con secreto = 1
response = session.get(dhkey_url)
if "Encrypted code :" in response.text:
    match = re.search(r'Encrypted code : (\d+)', response.text)
    if match:
        encrypted_code = int(match.group(1))
        print(f"[*] Código cifrado: {encrypted_code}")
        
        # Con secreto = 1, el código descifrado es simplemente XOR con 1
        plaintext_code = encrypted_code ^ 1
        print(f"[*] Código descifrado (secreto=1): {plaintext_code}")
        
        solution_url = f"{base_url}solution_diffie_hellman.php?password={plaintext_code}"
        print(f"\n[*] Verificando: {solution_url}")
        
        response = session.get(solution_url)
        print(f"[*] Respuesta: {response.text[:500]}")