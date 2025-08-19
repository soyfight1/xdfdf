#!/usr/bin/env python3

import requests
import re
import time
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

print("🔥💀🔥" * 20)
print("ÚLTIMO INTENTO - FURIA TOTAL")
print("🔥💀🔥" * 20)

base = "https://diffie-hellman.crypto.w3challs.com/"

# Configurar reintentos y timeouts agresivos
session = requests.Session()
retry = Retry(total=5, backoff_factor=0.3)
adapter = HTTPAdapter(max_retries=retry)
session.mount('http://', adapter)
session.mount('https://', adapter)

# Headers completos de navegador real
session.headers = {
    'Host': 'diffie-hellman.crypto.w3challs.com',
    'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:95.0) Gecko/20100101 Firefox/95.0',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate, br',
    'DNT': '1',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1',
    'Sec-Fetch-Dest': 'document',
    'Sec-Fetch-Mode': 'navigate',
    'Sec-Fetch-Site': 'none',
    'Sec-Fetch-User': '?1',
    'Cache-Control': 'no-cache',
    'Pragma': 'no-cache'
}

print("\n[PASO 1] Obteniendo sesión real...")

# Obtener la página principal
resp = session.get(base + "challenge_diffie_hellman.php", timeout=10)
print(f"Status: {resp.status_code}")
print(f"Cookies: {session.cookies.get_dict()}")

if 'PHPSESSID' not in session.cookies:
    print("[!] No se obtuvo cookie. Intentando de otra forma...")
    
    # Intentar obtener cookie del header Set-Cookie
    if 'Set-Cookie' in resp.headers:
        cookie = resp.headers['Set-Cookie']
        print(f"Cookie del header: {cookie}")
        
        # Extraer PHPSESSID
        match = re.search(r'PHPSESSID=([^;]+)', cookie)
        if match:
            phpsessid = match.group(1)
            session.cookies.set('PHPSESSID', phpsessid)
            print(f"PHPSESSID manual: {phpsessid}")

phpsessid = session.cookies.get('PHPSESSID')
if not phpsessid:
    print("[!] ERROR: No se pudo obtener sesión")
    exit(1)

print(f"\n[PASO 2] Sesión obtenida: {phpsessid}")

# Actualizar headers con referer
session.headers['Referer'] = base + 'challenge_diffie_hellman.php'

# Acceder al iframe
print("\n[PASO 3] Accediendo al iframe...")
resp = session.get(base + "dhkey.php", timeout=10)

if 'alice_send_key' not in resp.text:
    print("[!] No se encontró el formulario")
    print(f"Respuesta: {resp.text[:200]}")
else:
    print("[✓] Formulario encontrado")

# Preparar el mensaje de Alice con A=1
alice_message = """[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1\""""

print("\n[PASO 4] Enviando A=1...")

# Actualizar headers para el POST
session.headers.update({
    'Content-Type': 'application/x-www-form-urlencoded',
    'Origin': base[:-1],
    'Referer': base + 'dhkey.php'
})

# Enviar el POST
data = {'alice_send_key': alice_message}
resp = session.post(base + "dhkey.php?type=alice_send_key", data=data, timeout=10, allow_redirects=False)

print(f"Status POST: {resp.status_code}")
print(f"Respuesta: {resp.text[:100] if resp.text else 'Vacía'}")

if resp.text == "PHPSESSID needed":
    print("\n[!] Sesión rechazada. Intentando bypass...")
    
    # Intentar con cookie en el POST data
    data['PHPSESSID'] = phpsessid
    resp = session.post(base + "dhkey.php?type=alice_send_key", data=data, timeout=10)
    print(f"Respuesta con cookie en data: {resp.text[:100]}")

# Esperar respuesta
print("\n[PASO 5] Esperando respuesta de Bob...")
time.sleep(3)

# Obtener estado actual
resp = session.get(base + "dhkey.php", timeout=10)

# Buscar respuesta de Bob
if 'bob_send_key' in resp.text:
    print("[✓] Bob respondió!")
    
    # Extraer mensaje de Bob
    match = re.search(r'<textarea[^>]*name=["\']?bob_send_key[^>]*>(.*?)</textarea>', resp.text, re.DOTALL)
    if match:
        bob_msg = match.group(1)
        
        # Buscar B
        b_match = re.search(r'B = (\d+)', bob_msg)
        if b_match:
            b_value = b_match.group(1)
            print(f"B original: {b_value}")
            
            # Modificar a B=1
            bob_modified = re.sub(r'B = \d+', 'B = 1', bob_msg)
            
            print("Enviando B=1...")
            data = {'bob_send_key': bob_modified}
            resp = session.post(base + "dhkey.php?type=bob_send_key", data=data, timeout=10)
            
            time.sleep(3)
            
            # Obtener código cifrado
            resp = session.get(base + "dhkey.php", timeout=10)
            
            if 'alice_send_code' in resp.text:
                print("\n[✓] Alice enviando código!")
                
                match = re.search(r'<textarea[^>]*name=["\']?alice_send_code[^>]*>(.*?)</textarea>', resp.text, re.DOTALL)
                if match:
                    alice_code = match.group(1)
                    
                    # Buscar código cifrado
                    code_match = re.search(r'Encrypted code\s*:\s*(\d+)', alice_code)
                    if code_match:
                        encrypted = int(code_match.group(1))
                        decrypted = encrypted ^ 1  # XOR con secreto=1
                        
                        print(f"\n[!] CÓDIGO CIFRADO: {encrypted}")
                        print(f"[!] CÓDIGO DESCIFRADO: {decrypted}")
                        
                        # Verificar solución
                        sol_url = f"{base}solution_diffie_hellman.php?password={decrypted}"
                        resp = session.get(sol_url, timeout=10)
                        
                        if "wrong" not in resp.text.lower():
                            print("\n" + "🔥"*30)
                            print("¡¡¡FLAG ENCONTRADA!!!")
                            print("🔥"*30)
                            
                            # Extraer flag
                            clean = re.sub(r'<[^>]+>', ' ', resp.text)
                            clean = re.sub(r'\s+', ' ', clean).strip()
                            
                            print(f"\nRespuesta: {clean[:500]}")
                            
                            # Buscar patrones de flag
                            for pattern in [r'flag[^:]*:\s*([^\s,\.]+)', r'W3C\{[^}]+\}', r'The flag is[^:]*:\s*([^\s,\.]+)']:
                                m = re.search(pattern, resp.text, re.IGNORECASE)
                                if m:
                                    print(f"\nFLAG: {m.group(0)}")
                                    break
                        else:
                            print(f"[!] Password {decrypted} incorrecto")
else:
    print("[!] Bob no respondió")
    print(f"HTML actual: {resp.text[:500]}")

print("\n" + "="*60)
print("FIN DEL INTENTO")
print("="*60)