#!/usr/bin/env python3

import requests
import re
import time
import json
from urllib.parse import urlencode, quote

print("="*60)
print("DESTRUYENDO DIFFIE-HELLMAN - SIN PIEDAD")
print("="*60)

base = "https://diffie-hellman.crypto.w3challs.com/"

# Intentar múltiples estrategias en paralelo
def attempt_1():
    """Fuerza bruta con diferentes combinaciones de headers"""
    s = requests.Session()
    
    # Obtener cookie inicial
    s.get(base + "challenge_diffie_hellman.php")
    cookie = s.cookies.get('PHPSESSID')
    print(f"\n[ATTEMPT 1] Cookie: {cookie}")
    
    # Diferentes combinaciones de headers
    header_sets = [
        {
            'Cookie': f'PHPSESSID={cookie}',
            'Referer': base + 'challenge_diffie_hellman.php',
            'X-Requested-With': 'XMLHttpRequest'
        },
        {
            'Cookie': f'PHPSESSID={cookie}',
            'Referer': base + 'dhkey.php',
            'Origin': base[:-1]
        },
        {
            'Cookie': f'PHPSESSID={cookie}',
            'Host': 'diffie-hellman.crypto.w3challs.com',
            'Sec-Fetch-Site': 'same-origin'
        }
    ]
    
    for i, headers in enumerate(header_sets):
        print(f"[*] Intento {i+1}...")
        s.headers.update(headers)
        
        # Enviar A=1
        alice_msg = '[ --------- w3challs-Sniffer 1.4.7 --------- ]\n\nMessage from Alice to Bob on 1970/01/01 01:00:00\n\n"Hey Bob, if I don\'t receive your B in about thirty seconds maximum, I\'ll consider this channel unsafe\n\nA = 1"'
        
        resp = s.post(base + "dhkey.php?type=alice_send_key", data={'alice_send_key': alice_msg})
        if "PHPSESSID" not in resp.text:
            print(f"[!] Headers {i+1} funcionaron!")
            return s
    
    return None

def attempt_2():
    """Intentar con cookies múltiples y referer spoofing"""
    s = requests.Session()
    
    # Primero obtener la página principal
    resp = s.get(base + "challenge_diffie_hellman.php")
    
    # Luego el iframe con todos los headers posibles
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Accept': '*/*',
        'Accept-Language': 'en-US,en;q=0.9',
        'Accept-Encoding': 'gzip, deflate',
        'Referer': base + 'challenge_diffie_hellman.php',
        'X-Forwarded-For': '127.0.0.1',
        'X-Real-IP': '127.0.0.1',
        'X-Originating-IP': '127.0.0.1',
        'X-Remote-IP': '127.0.0.1',
        'X-Remote-Addr': '127.0.0.1'
    }
    
    s.headers.update(headers)
    
    # Obtener el iframe
    resp = s.get(base + "dhkey.php")
    
    # Intentar enviar con GET en lugar de POST
    alice_msg = '[ --------- w3challs-Sniffer 1.4.7 --------- ]\n\nMessage from Alice to Bob on 1970/01/01 01:00:00\n\n"Hey Bob, if I don\'t receive your B in about thirty seconds maximum, I\'ll consider this channel unsafe\n\nA = 1"'
    
    params = {'type': 'alice_send_key', 'alice_send_key': alice_msg}
    resp = s.get(base + "dhkey.php", params=params)
    
    return s

def attempt_3():
    """Intentar inyección directa en la URL"""
    s = requests.Session()
    s.get(base + "challenge_diffie_hellman.php")
    
    # Intentar pasar todo por GET
    url = base + 'dhkey.php?type=alice_send_key&alice_send_key=' + quote('A = 1"')
    resp = s.get(url)
    
    return s

def attempt_4():
    """Buscar si hay algún endpoint alternativo o backdoor"""
    s = requests.Session()
    s.get(base + "challenge_diffie_hellman.php")
    
    # Intentar endpoints alternativos
    endpoints = [
        'dhkey_submit.php',
        'submit.php',
        'process.php',
        'ajax.php',
        'api.php',
        'dhkey.php?debug=1',
        'dhkey.php?test=1',
        'dhkey.php?bypass=1'
    ]
    
    for endpoint in endpoints:
        print(f"[*] Probando {endpoint}...")
        resp = s.get(base + endpoint)
        if resp.status_code == 200 and "404" not in resp.text:
            print(f"[!] Endpoint encontrado: {endpoint}")
            
    return s

# Ejecutar todos los intentos
print("\n[*] INICIANDO ATAQUE TOTAL...")

sessions = []
sessions.append(attempt_1())
sessions.append(attempt_2())
sessions.append(attempt_3())
sessions.append(attempt_4())

# Verificar si alguno funcionó
for i, s in enumerate(sessions):
    if s:
        print(f"\n[*] Verificando sesión {i+1}...")
        resp = s.get(base + "dhkey.php")
        
        # Buscar si hay algún intercambio en progreso
        if "Encrypted code" in resp.text:
            match = re.search(r'Encrypted code\s*:\s*(\d+)', resp.text)
            if match:
                enc = int(match.group(1))
                print(f"[!] CÓDIGO CIFRADO ENCONTRADO: {enc}")
                
                # Probar diferentes secretos
                for secret in [0, 1, 2, 3, 4, 5, 10, 100, 1000]:
                    dec = enc ^ secret
                    print(f"[*] Probando secreto={secret}: {dec}")
                    
                    resp = s.get(f"{base}solution_diffie_hellman.php?password={dec}")
                    if "wrong" not in resp.text.lower() and len(resp.text) > 100:
                        print(f"\n[!] ¡POSIBLE FLAG con secreto={secret}!")
                        print(resp.text[:500])

print("\n[*] Intentando approach más directo...")

# Última estrategia: Analizar el JavaScript del cliente
s = requests.Session()
resp = s.get(base + "challenge_diffie_hellman.php")

# Buscar scripts
scripts = re.findall(r'<script[^>]*>(.*?)</script>', resp.text, re.DOTALL)
for script in scripts:
    if script.strip():
        print(f"[*] Script encontrado: {script[:200]}")

# Buscar archivos JS externos
js_files = re.findall(r'src=["\']([^"\']*\.js[^"\']*)["\'"]', resp.text)
for js_file in js_files:
    if not js_file.startswith('http'):
        js_file = base + js_file
    print(f"[*] Descargando {js_file}...")
    resp = s.get(js_file)
    if "alice" in resp.text.lower() or "dhkey" in resp.text.lower():
        print(f"[!] Código relevante encontrado en {js_file}")

print("\n[*] Buscando valores hardcodeados...")

# Buscar en el HTML principal
resp = s.get(base + "challenge_diffie_hellman.php")
numbers = re.findall(r'\b\d{10,}\b', resp.text)
for num in numbers:
    if num not in [str(p), str(g)]:  # p y g ya los conocemos
        print(f"[*] Número sospechoso encontrado: {num}")
        
        # Intentar como password directamente
        resp = s.get(f"{base}solution_diffie_hellman.php?password={num}")
        if "wrong" not in resp.text.lower():
            print(f"[!] ¡POSIBLE FLAG con {num}!")

print("\n" + "="*60)
print("ATAQUE COMPLETADO")
print("="*60)