#!/usr/bin/env python3
import requests

URL = "http://activist-birds.picoctf.net:63813"

print("[*] Checking server status...")

# Check all endpoints
endpoints = [
    "/", "/api/", "/api/password", "/api/root_cert",
    "/api/login", "/api/me", "/api/emails", 
    "/static/", "/wasm/", "/node_modules/"
]

for ep in endpoints:
    try:
        r = requests.get(f"{URL}{ep}", timeout=5)
        print(f"{ep}: {r.status_code} - Length: {len(r.text)}")
        if r.status_code == 200 and len(r.text) < 1000:
            print(f"  Content: {r.text[:200]}")
    except Exception as e:
        print(f"{ep}: ERROR - {e}")

# Try to get static files
static_files = [
    "/wasm/openssl.wasm", "/wasm/parser.wasm",
    "/src/api.js", "/src/email.js", "/src/smime.js",
    "/package.json", "/.env", "/docker-compose.yml"
]

for file in static_files:
    r = requests.get(f"{URL}{file}")
    if r.status_code == 200:
        print(f"FOUND {file}: {len(r.content)} bytes")

print("\n[*] Server appears to be:", "UP" if requests.get(URL).status_code else "DOWN")