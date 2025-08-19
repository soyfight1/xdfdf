#!/usr/bin/env python3
import requests
import hashlib
import base64
import hmac
import time

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] Investigating two-step authentication mechanism...")

# The login page mentions "two-step authentication" and "make sure you have all needed information"
# This suggests we need something more than just username/password

# Common two-step auth patterns:
# 1. Username/password then token
# 2. Username/password then security question
# 3. Username/password then captcha
# 4. Hidden field that needs to be filled
# 5. Specific header or cookie required

# First, let's check what happens after a login attempt
print("\n[*] Analyzing login flow...")

# Try login and follow redirects manually
s = requests.Session()
login_data = {'login': 'admin', 'pass': 'admin'}

# Get login page first to get any tokens/cookies
r1 = s.get(f"{base}index.php?page=login")
initial_cookies = dict(s.cookies)
print(f"Initial cookies: {initial_cookies}")

# Check for hidden fields or tokens in login page
import re
from bs4 import BeautifulSoup

soup = BeautifulSoup(r1.text, 'html.parser')
form = soup.find('form')
if form:
    hidden_inputs = form.find_all('input', type='hidden')
    if hidden_inputs:
        print(f"Hidden inputs found: {hidden_inputs}")

# Submit login
r2 = s.post(f"{base}index.php?page=login", data=login_data, allow_redirects=False)
print(f"Login response status: {r2.status_code}")
print(f"Login response headers: {dict(r2.headers)}")
new_cookies = dict(s.cookies)
print(f"Cookies after login: {new_cookies}")

if r2.status_code in [301, 302, 303, 307]:
    print(f"Redirect to: {r2.headers.get('Location')}")
    
# Check if there's a second step page
second_step_pages = [
    "verify", "authenticate", "confirm", "token", "2fa", "step2", "challenge"
]

for page in second_step_pages:
    r = s.get(f"{base}index.php?page={page}")
    if len(r.text) > 1000 and 'Welcome to' not in r.text:
        print(f"[!] Potential second step page: {page}")
        soup = BeautifulSoup(r.text, 'html.parser')
        forms = soup.find_all('form')
        for form in forms:
            print(f"  Form found: {form}")

# Test if we need to send additional parameters
print("\n[*] Testing additional authentication parameters...")

# Try with additional common parameters
extended_login_attempts = [
    {'login': 'admin', 'pass': 'admin', 'token': ''},
    {'login': 'admin', 'pass': 'admin', 'code': ''},
    {'login': 'admin', 'pass': 'admin', 'otp': ''},
    {'login': 'admin', 'pass': 'admin', 'captcha': ''},
    {'login': 'admin', 'pass': 'admin', 'remember': '1'},
    {'login': 'admin', 'pass': 'admin', 'submit': 'Login'},
    {'login': 'admin', 'pass': 'admin', 'action': 'login'},
    {'login': 'admin', 'pass': 'admin', 'step': '2'},
]

for data in extended_login_attempts:
    r = s.post(f"{base}index.php?page=login", data=data)
    if 'welcome' in r.text.lower() or 'member' in r.text.lower():
        print(f"[!] Success with params: {data}")

# Test if the contact form recipient values are related to authentication
print("\n[*] Testing if contact recipients are authentication keys...")

# The recipients are numbered 1, 2, 3 for the three leaders
# Maybe we need to authenticate with the right recipient number?

leaders_auth = [
    {'login': 'LuG[3]R', 'pass': 'password', 'recipient': '1'},
    {'login': 'Fr[4]Ger', 'pass': 'password', 'recipient': '2'},
    {'login': 'K[1]LLeR', 'pass': 'password', 'recipient': '3'},
]

for data in leaders_auth:
    # Try as GET parameter
    r = s.post(f"{base}index.php?page=login&recipient={data['recipient']}", 
               data={'login': data['login'], 'pass': data['pass']})
    if 'welcome' in r.text.lower():
        print(f"[!!!] Success with recipient in URL: {data}")
    
    # Try as POST parameter
    r = s.post(f"{base}index.php?page=login", data=data)
    if 'welcome' in r.text.lower():
        print(f"[!!!] Success with recipient in POST: {data}")

# Test if we need to contact them first before login
print("\n[*] Testing contact-then-login flow...")

# Send contact message first
contact_data = {
    'recipient': '1',
    'msg': 'requesting access'
}
r1 = s.post(f"{base}index.php?page=contact", data=contact_data)

# Then try login
login_data = {'login': 'LuG[3]R', 'pass': 'password'}
r2 = s.post(f"{base}index.php?page=login", data=login_data)

# Check member access
r3 = s.get(f"{base}index.php?page=member")
if 'welcome' not in r3.text or len(r3.text) > 2000:
    print(f"[!] Different member page after contact: {len(r3.text)} bytes")

# Test hash-based authentication
print("\n[*] Testing hash-based authentication...")

# Common patterns: MD5(user:pass), SHA1(user+pass), etc.
users = ['admin', 'LuG[3]R', 'Fr[4]Ger', 'K[1]LLeR']
passwords = ['password', 'admin', '123456']

for user in users:
    for pwd in passwords:
        # Try various hash combinations
        hashes = {
            'md5_concat': hashlib.md5(f"{user}{pwd}".encode()).hexdigest(),
            'md5_colon': hashlib.md5(f"{user}:{pwd}".encode()).hexdigest(),
            'sha1_concat': hashlib.sha1(f"{user}{pwd}".encode()).hexdigest(),
            'base64': base64.b64encode(f"{user}:{pwd}".encode()).decode(),
        }
        
        for hash_type, hash_val in hashes.items():
            # Try hash as password
            data = {'login': user, 'pass': hash_val}
            r = s.post(f"{base}index.php?page=login", data=data)
            if 'welcome' in r.text.lower():
                print(f"[!!!] Success with {hash_type}: {user} / {hash_val}")
            
            # Try hash as additional parameter
            data = {'login': user, 'pass': pwd, 'hash': hash_val}
            r = s.post(f"{base}index.php?page=login", data=data)
            if 'welcome' in r.text.lower():
                print(f"[!!!] Success with hash param: {data}")

# Test timing-based authentication
print("\n[*] Testing timing-based authentication...")

# Maybe we need to submit at a specific time or within a time window
timestamp = str(int(time.time()))
data = {'login': 'admin', 'pass': 'admin', 'time': timestamp}
r = s.post(f"{base}index.php?page=login", data=data)
if 'welcome' in r.text.lower():
    print(f"[!!!] Success with timestamp: {data}")