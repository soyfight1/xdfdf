#!/usr/bin/env python3

import requests
import re
import time

print("="*60)
print("ATAQUE DIFFIE-HELLMAN - ESTRATEGIA FINAL")
print("="*60)

# Parámetros DH
p = 1091136745528189467933281517836874347556227973368844785834730809158502707734111726197047853034779577326799376909360702796771580766448794604223666095534254989157674044885025529655475251174022547573400542404497196315179009518790845093
g = 788566880005302277341720913014765764523749662717255764973422789169351342670625046069737389605574848412134408890505831396888152508510392260349529979008920978675421422171288130340362523984410268300658262790954147173882579740249230159

base_url = "https://diffie-hellman.crypto.w3challs.com/"

# Crear sesión persistente
s = requests.Session()

print("\n[1] Iniciando intercambio DH...")

# Obtener el estado inicial
resp = s.get(base_url + "dhkey.php")
print(f"[*] Estado inicial obtenido")

# PASO 1: Alice envía A=1
print("\n[2] Enviando A=1 desde Alice...")
alice_msg = """[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1"""

# Importante: el campo termina con comillas
alice_msg += '"'

data = {'alice_send_key': alice_msg}
resp = s.post(base_url + "dhkey.php?type=alice_send_key", data=data)
print("[*] A=1 enviado")

# Esperar respuesta de Bob
time.sleep(1)
resp = s.get(base_url + "dhkey.php")
html = resp.text

# PASO 2: Interceptar y modificar B
if 'bob_send_key' in html:
    print("\n[3] Interceptando respuesta de Bob...")
    
    # Extraer el mensaje completo de Bob del textarea
    match = re.search(r'<textarea[^>]*name=["\']?bob_send_key[^>]*>(.*?)</textarea>', html, re.DOTALL)
    if match:
        bob_msg = match.group(1)
        
        # Buscar el valor B original
        b_match = re.search(r'B = (\d+)', bob_msg)
        if b_match:
            print(f"[*] B original de Bob: {b_match.group(1)}")
            
            # Reemplazar con B=1
            bob_msg_modified = re.sub(r'B = \d+', 'B = 1', bob_msg)
            print("[*] Modificando a B=1")
            
            # Enviar B=1
            data = {'bob_send_key': bob_msg_modified}
            resp = s.post(base_url + "dhkey.php?type=bob_send_key", data=data)
            print("[*] B=1 enviado")
            
            time.sleep(1)

# PASO 3: Alice envía el código cifrado
resp = s.get(base_url + "dhkey.php")
html = resp.text

if 'alice_send_code' in html:
    print("\n[4] Alice enviando código cifrado...")
    
    # Extraer el mensaje de Alice con el código
    match = re.search(r'<textarea[^>]*name=["\']?alice_send_code[^>]*>(.*?)</textarea>', html, re.DOTALL)
    if match:
        alice_code_msg = match.group(1)
        
        # Buscar el código cifrado
        code_match = re.search(r'Encrypted code : (\d+)', alice_code_msg)
        if code_match:
            encrypted = int(code_match.group(1))
            print(f"[*] Código cifrado encontrado: {encrypted}")
            
            # Con A=1 y B=1, el secreto es 1^b mod p = 1
            secret = 1
            plaintext = encrypted ^ secret
            
            print(f"[*] Secreto compartido: {secret}")
            print(f"[*] Código descifrado (XOR): {plaintext}")
            
            # Verificar la solución
            print("\n[5] Verificando solución...")
            solution_url = f"{base_url}solution_diffie_hellman.php?password={plaintext}"
            resp = s.get(solution_url)
            
            print(f"[*] URL: {solution_url}")
            print("\n[*] Respuesta del servidor:")
            print("="*40)
            
            # Limpiar HTML para mejor visualización
            text = re.sub(r'<[^>]+>', '', resp.text)
            text = re.sub(r'\s+', ' ', text).strip()
            print(text[:500])
            
            # Buscar patrones de flag
            flag_patterns = [
                r'flag is[^:]*:\s*([^\s]+)',
                r'W3C{[^}]+}',
                r'flag:\s*([^\s]+)',
                r'password is[^:]*:\s*([^\s]+)',
                r'congratulations[^:]*:\s*([^\s]+)'
            ]
            
            for pattern in flag_patterns:
                match = re.search(pattern, resp.text, re.IGNORECASE)
                if match:
                    print("\n" + "🔥"*20)
                    print(f"FLAG ENCONTRADA: {match.group(0)}")
                    print("🔥"*20)
                    break
        else:
            print("[!] No se encontró código cifrado")
            print(f"Mensaje: {alice_code_msg[:300]}")
            
        # Enviar el mensaje para continuar el flujo
        data = {'alice_send_code': alice_code_msg}
        resp = s.post(base_url + "dhkey.php?type=alice_send_code", data=data)
else:
    print("[!] Alice no está enviando código. Verificando estado...")
    print(html[:500])

print("\n[*] Intentando otra estrategia...")

# ESTRATEGIA ALTERNATIVA: Usar valores que den un secreto conocido
print("\n[6] Estrategia alternativa: g^0 = 1")

s2 = requests.Session()
resp = s2.get(base_url + "dhkey.php")

# Enviar A = p-1 (que da -1 mod p, y (-1)^b = ±1)
print(f"[*] Enviando A = p-1 = {p-1}")
alice_msg2 = f"""[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = {p-1}\""""

data = {'alice_send_key': alice_msg2}
resp = s2.post(base_url + "dhkey.php?type=alice_send_key", data=data)
time.sleep(1)

resp = s2.get(base_url + "dhkey.php")
if 'bob_send_key' in resp.text:
    match = re.search(r'<textarea[^>]*name=["\']?bob_send_key[^>]*>(.*?)</textarea>', resp.text, re.DOTALL)
    if match:
        bob_msg = match.group(1)
        # Modificar B = 2 para que el secreto sea (p-1)^2 = 1 mod p
        bob_modified = re.sub(r'B = \d+', 'B = 2', bob_msg)
        data = {'bob_send_key': bob_modified}
        resp = s2.post(base_url + "dhkey.php?type=bob_send_key", data=data)
        time.sleep(1)

resp = s2.get(base_url + "dhkey.php")
if 'alice_send_code' in resp.text:
    match = re.search(r'<textarea[^>]*name=["\']?alice_send_code[^>]*>(.*?)</textarea>', resp.text, re.DOTALL)
    if match:
        alice_msg = match.group(1)
        code_match = re.search(r'Encrypted code : (\d+)', alice_msg)
        if code_match:
            encrypted = int(code_match.group(1))
            # (p-1)^2 mod p = 1
            plaintext = encrypted ^ 1
            print(f"\n[*] Con A=p-1, B=2: código = {plaintext}")
            
            resp = s2.get(f"{base_url}solution_diffie_hellman.php?password={plaintext}")
            if "flag" in resp.text.lower() or "congratulations" in resp.text.lower():
                print(f"[*] ¡ÉXITO! Flag encontrada con código: {plaintext}")