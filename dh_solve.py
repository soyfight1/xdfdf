#!/usr/bin/env python3

import requests
import re
import time
from html import unescape

print("="*60)
print("SOLUCIONANDO DIFFIE-HELLMAN CTF")
print("="*60)

base = "https://diffie-hellman.crypto.w3challs.com/"

# Crear sesión con headers apropiados
s = requests.Session()
s.headers.update({
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate',
    'DNT': '1',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1'
})

# Paso 1: Obtener página principal
print("\n[1] Inicializando sesión...")
main_page = s.get(base + "challenge_diffie_hellman.php")
print(f"[*] Cookies: {s.cookies.get_dict()}")

# Paso 2: Acceder al iframe con referer correcto
print("\n[2] Accediendo al intercambio DH...")
s.headers['Referer'] = base + "challenge_diffie_hellman.php"
dhkey_resp = s.get(base + "dhkey.php")

if 'alice_send_key' not in dhkey_resp.text:
    print("[!] Error al acceder al iframe")
    print(dhkey_resp.text[:200])
else:
    print("[*] Formulario de Alice encontrado")

# Paso 3: Enviar A=1
print("\n[3] Enviando A=1...")

# El mensaje debe estar exactamente como lo espera el servidor
alice_msg = '''[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1"'''

data = {'alice_send_key': alice_msg}
s.headers['Referer'] = base + "dhkey.php"
s.headers['Content-Type'] = 'application/x-www-form-urlencoded'

resp = s.post(base + "dhkey.php?type=alice_send_key", data=data)

# Verificar si se envió correctamente
if resp.text.strip() == "PHPSESSID needed":
    print("[!] Error de sesión. Intentando con iframe target...")
    
    # Intentar enviando como si fuera desde el iframe
    s.headers['Origin'] = base[:-1]
    resp = s.post(base + "dhkey.php?type=alice_send_key", data=data, allow_redirects=False)

print("[*] Respuesta al enviar A=1:", resp.text[:100] if resp.text else "OK")

# Esperar un poco
time.sleep(2)

# Paso 4: Obtener respuesta de Bob
print("\n[4] Obteniendo respuesta de Bob...")
dhkey_resp = s.get(base + "dhkey.php")

if 'bob_send_key' in dhkey_resp.text:
    print("[*] Bob respondió")
    
    # Extraer mensaje de Bob
    match = re.search(r'<textarea[^>]*name=["\']?bob_send_key[^>]*>(.*?)</textarea>', dhkey_resp.text, re.DOTALL)
    if match:
        bob_msg = match.group(1)
        
        # Buscar B original
        b_match = re.search(r'B = (\d+)', bob_msg)
        if b_match:
            print(f"[*] B original: {b_match.group(1)}")
            
            # Modificar a B=1
            bob_modified = re.sub(r'B = \d+', 'B = 1', bob_msg)
            print("[*] Modificando a B=1")
            
            # Enviar B=1
            data = {'bob_send_key': bob_modified}
            resp = s.post(base + "dhkey.php?type=bob_send_key", data=data)
            print("[*] B=1 enviado")
            
            time.sleep(2)

# Paso 5: Obtener código cifrado
print("\n[5] Obteniendo código cifrado...")
dhkey_resp = s.get(base + "dhkey.php")

if 'alice_send_code' in dhkey_resp.text:
    print("[*] Alice enviando código")
    
    # Extraer mensaje con código
    match = re.search(r'<textarea[^>]*name=["\']?alice_send_code[^>]*>(.*?)</textarea>', dhkey_resp.text, re.DOTALL)
    if match:
        alice_code = match.group(1)
        
        # Buscar código cifrado
        code_match = re.search(r'Encrypted code\s*:\s*(\d+)', alice_code)
        if code_match:
            encrypted = int(code_match.group(1))
            print(f"[*] Código cifrado: {encrypted}")
            
            # Descifrar (secreto = 1)
            plaintext = encrypted ^ 1
            print(f"[*] Código descifrado: {plaintext}")
            
            # Verificar solución
            print(f"\n[6] Verificando solución...")
            solution_resp = s.get(f"{base}solution_diffie_hellman.php?password={plaintext}")
            
            # Analizar respuesta
            if "wrong" not in solution_resp.text.lower():
                print("\n" + "🔥"*20)
                print("¡SOLUCIÓN ENCONTRADA!")
                
                # Extraer texto limpio
                clean = re.sub(r'<[^>]+>', ' ', solution_resp.text)
                clean = re.sub(r'\s+', ' ', clean).strip()
                print(f"\nRespuesta: {clean[:300]}")
                
                # Buscar flag
                for pattern in [r'flag[^:]*:\s*([^\s,\.]+)', r'W3C{[^}]+}', r'The flag is[^:]*:\s*([^\s,\.]+)']:
                    m = re.search(pattern, solution_resp.text, re.IGNORECASE)
                    if m:
                        print(f"\nFLAG: {m.group(0)}")
                        break
                print("🔥"*20)
            else:
                print("[!] Código incorrecto")
                
        # Enviar el mensaje para continuar
        data = {'alice_send_code': alice_code}
        s.post(base + "dhkey.php?type=alice_send_code", data=data)
else:
    print("[!] No se encontró código")
    print("HTML actual:", dhkey_resp.text[:500])

print("\n[*] Intentando approach directo...")

# Reintentar con una nueva sesión completamente limpia
s2 = requests.Session()
s2.headers.update({
    'User-Agent': 'Mozilla/5.0',
    'Referer': base + 'challenge_diffie_hellman.php'
})

# Obtener sesión
s2.get(base + "challenge_diffie_hellman.php")
print(f"\n[*] Nueva sesión: {s2.cookies.get_dict()}")

# Ir directo al iframe
resp = s2.get(base + "dhkey.php")

# Si hay un intercambio en progreso, intentar interceptarlo
if 'Encrypted code' in resp.text:
    match = re.search(r'Encrypted code\s*:\s*(\d+)', resp.text)
    if match:
        enc = int(match.group(1))
        print(f"[!] Encontrado código ya cifrado: {enc}")
        
        # Probar varios secretos comunes
        for secret in [1, 0, 2, g % 1000, p-1]:
            dec = enc ^ secret
            print(f"[*] Probando con secreto {secret}: {dec}")
            
            resp = s2.get(f"{base}solution_diffie_hellman.php?password={dec}")
            if "wrong" not in resp.text.lower() and "flag" in resp.text.lower():
                print(f"[!] ¡ENCONTRADO con secreto {secret}!")
                print(resp.text[:500])
                break