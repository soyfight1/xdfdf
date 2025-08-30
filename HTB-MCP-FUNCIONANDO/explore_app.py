#!/usr/bin/env python3
import requests
import json

base_url = "http://94.237.57.115:46418"

print("=== Explorando HTB Editor ===\n")

# Verificar la aplicación principal
print("1. Página principal:")
r = requests.get(base_url)
print(f"   Status: {r.status_code}")
print(f"   Headers: {dict(r.headers)}")

# Buscar archivos JavaScript para entender la aplicación
print("\n2. Analizando assets JavaScript:")
r = requests.get(f"{base_url}/assets/index-DnSTJ-4u.js")
if r.status_code == 200:
    js_content = r.text[:5000]  # Primeros 5000 caracteres
    
    # Buscar endpoints API
    import re
    api_patterns = [
        r'fetch\(["\']([^"\']+)["\']',
        r'axios\.[a-z]+\(["\']([^"\']+)["\']',
        r'["\']\/api\/[^"\']+["\']',
        r'["\']\/[a-z]+\/[^"\']+["\']'
    ]
    
    endpoints = set()
    for pattern in api_patterns:
        matches = re.findall(pattern, js_content)
        endpoints.update(matches)
    
    if endpoints:
        print("   Posibles endpoints encontrados:")
        for endpoint in endpoints:
            if not endpoint.startswith('http'):
                print(f"     - {endpoint}")

# Probar endpoints comunes
print("\n3. Probando endpoints comunes:")
common_endpoints = [
    '/api',
    '/api/health',
    '/api/status',
    '/api/version',
    '/api/editor',
    '/api/code',
    '/api/execute',
    '/api/run',
    '/api/compile',
    '/api/save',
    '/api/load',
    '/api/files',
    '/api/projects',
    '/health',
    '/status',
    '/ws',
    '/websocket',
    '/.git',
    '/robots.txt',
    '/sitemap.xml'
]

for endpoint in common_endpoints:
    try:
        r = requests.get(f"{base_url}{endpoint}", timeout=3)
        if r.status_code != 404:
            print(f"   {endpoint}: {r.status_code}")
            if r.status_code == 200 and len(r.text) < 500:
                print(f"      Response: {r.text[:200]}")
    except:
        pass

# Verificar métodos HTTP
print("\n4. Verificando métodos HTTP en /:")
methods = ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS', 'HEAD']
for method in methods:
    try:
        r = requests.request(method, base_url, timeout=3)
        if r.status_code != 405:
            print(f"   {method}: {r.status_code}")
    except:
        pass