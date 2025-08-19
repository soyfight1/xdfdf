#!/usr/bin/env python3

import requests
import re
import time
from urllib.parse import quote

print("="*60)
print("DIFFIE-HELLMAN MANUAL INTERCEPT")
print("="*60)

# Configuración
base = "https://diffie-hellman.crypto.w3challs.com/"

# Crear sesión con todos los headers necesarios
s = requests.Session()

# Headers completos como un navegador real
headers = {
    'Host': 'diffie-hellman.crypto.w3challs.com',
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate, br',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Origin': 'https://diffie-hellman.crypto.w3challs.com',
    'DNT': '1',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1',
    'Sec-Fetch-Dest': 'iframe',
    'Sec-Fetch-Mode': 'navigate',
    'Sec-Fetch-Site': 'same-origin',
    'Sec-Fetch-User': '?1',
    'Cache-Control': 'max-age=0'
}

# Paso 1: Obtener página principal y sesión
print("\n[1] Obteniendo sesión...")
resp = s.get(base + "challenge_diffie_hellman.php")
print(f"[*] PHPSESSID: {s.cookies.get('PHPSESSID')}")

# Paso 2: Acceder al iframe
print("\n[2] Accediendo al iframe...")
headers['Referer'] = base + 'challenge_diffie_hellman.php'
s.headers.update(headers)

resp = s.get(base + "dhkey.php")

# Verificar estado inicial
if 'alice_send_key' in resp.text:
    print("[*] Formulario de Alice encontrado")
    
    # El mensaje debe incluir las comillas finales que están fuera del textarea
    alice_message = '''[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1"'''
    
    print("\n[3] Enviando A=1...")
    
    # Enviar con el target correcto (iframe)
    data = {
        'alice_send_key': alice_message
    }
    
    # POST al action del formulario
    resp = s.post(base + "dhkey.php?type=alice_send_key", data=data)
    
    # Si dice "PHPSESSID needed", intentar de otra forma
    if "PHPSESSID needed" in resp.text:
        print("[!] Sesión rechazada. Intentando método alternativo...")
        
        # Intentar enviando la sesión en el POST también
        data['PHPSESSID'] = s.cookies.get('PHPSESSID')
        resp = s.post(base + "dhkey.php?type=alice_send_key", data=data)
    
    print(f"[*] Respuesta: {resp.text[:100] if resp.text else 'Vacía'}")
    
    # Esperar respuesta
    time.sleep(3)
    
    # Obtener estado actual
    print("\n[4] Verificando estado...")
    resp = s.get(base + "dhkey.php")
    
    # Buscar si Bob respondió
    if 'bob_send_key' in resp.text:
        print("[*] Bob ha respondido")
        
        # Extraer mensaje de Bob
        match = re.search(r'<textarea[^>]*name=[\'"]?bob_send_key[^>]*>(.*?)</textarea>', resp.text, re.DOTALL)
        if match:
            bob_msg = match.group(1)
            
            # Buscar valor B
            b_match = re.search(r'B = (\d+)', bob_msg)
            if b_match:
                b_orig = b_match.group(1)
                print(f"[*] B original: {b_orig}")
                
                # Modificar a B=1
                bob_modified = re.sub(r'B = \d+', 'B = 1', bob_msg)
                
                print("[*] Enviando B=1...")
                data = {'bob_send_key': bob_modified}
                resp = s.post(base + "dhkey.php?type=bob_send_key", data=data)
                
                time.sleep(3)
                
                # Ver si Alice envía el código
                resp = s.get(base + "dhkey.php")
                
                if 'alice_send_code' in resp.text:
                    print("\n[5] Alice enviando código...")
                    
                    match = re.search(r'<textarea[^>]*name=[\'"]?alice_send_code[^>]*>(.*?)</textarea>', resp.text, re.DOTALL)
                    if match:
                        alice_code = match.group(1)
                        
                        # Buscar código cifrado
                        code_match = re.search(r'Encrypted code\s*:\s*(\d+)', alice_code)
                        if code_match:
                            enc = int(code_match.group(1))
                            dec = enc ^ 1  # XOR con secreto=1
                            
                            print(f"[*] Código cifrado: {enc}")
                            print(f"[*] Código descifrado: {dec}")
                            
                            # Verificar
                            print(f"\n[6] Verificando solución...")
                            sol_url = f"{base}solution_diffie_hellman.php?password={dec}"
                            resp = s.get(sol_url)
                            
                            if "wrong" not in resp.text.lower():
                                print("\n" + "🔥"*20)
                                print("¡SOLUCIÓN CORRECTA!")
                                
                                # Buscar flag
                                clean = re.sub(r'<[^>]+>', ' ', resp.text)
                                print(f"Respuesta: {clean[:300]}")
                                
                                for pat in [r'flag[^:]*:\s*([^\s]+)', r'W3C{[^}]+}']:
                                    m = re.search(pat, resp.text, re.I)
                                    if m:
                                        print(f"\nFLAG: {m.group(0)}")
                                print("🔥"*20)
                            else:
                                print("[!] Código incorrecto")

print("\n[*] Si no funcionó, el servidor puede requerir interacción manual.")
print("[*] Intenta acceder manualmente a:")
print(f"    {base}challenge_diffie_hellman.php")
print("[*] Y modifica los valores A y B a 1 en el sniffer.")