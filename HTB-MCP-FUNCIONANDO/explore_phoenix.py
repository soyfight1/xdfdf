#!/usr/bin/env python3
import requests
import json

base_url = "http://94.237.57.115:46418/challenge"

print("=== Explorando Phoenix Pipeline ===\n")

# Endpoints a probar
endpoints = [
    "/",
    "/login",
    "/register",
    "/api",
    "/api/login",
    "/api/register",
    "/api/status",
    "/api/users",
    "/admin",
    "/dashboard",
    "/profile",
    "/api/verify",
    "/public/js/particles.js",
    "/public/js/public.js",
    "/public/css/styles.css",
    "/../api/verify",
    "/../api/file"
]

session = requests.Session()

for endpoint in endpoints:
    try:
        url = f"{base_url}{endpoint}"
        r = session.get(url, timeout=5, allow_redirects=False)
        
        print(f"GET {endpoint}: {r.status_code}")
        
        # Si es una redirección, mostrar a dónde
        if r.status_code in [301, 302, 303, 307, 308]:
            print(f"  Redirige a: {r.headers.get('Location', 'N/A')}")
        
        # Si devuelve JSON
        if 'application/json' in r.headers.get('Content-Type', ''):
            try:
                data = r.json()
                print(f"  JSON: {json.dumps(data, indent=2)[:200]}")
            except:
                pass
                
        # Si es un archivo JS o CSS pequeño, mostrar parte
        if endpoint.endswith(('.js', '.css')) and r.status_code == 200:
            content = r.text[:500]
            if 'api' in content.lower() or 'endpoint' in content.lower() or 'url' in content.lower():
                print(f"  Contenido relevante encontrado:")
                for line in content.split('\n'):
                    if any(word in line.lower() for word in ['api', 'endpoint', 'url', 'fetch', 'axios']):
                        print(f"    {line.strip()[:100]}")
                        
    except Exception as e:
        pass

# Probar registro y login
print("\n=== Probando autenticación ===")

# Intentar registrar un usuario
register_data = {
    "username": "test123",
    "password": "test123",
    "email": "test@test.com"
}

print("\nIntentando registro...")
r = session.post(f"{base_url}/register", data=register_data, allow_redirects=False)
print(f"POST /register: {r.status_code}")
if r.status_code in [301, 302, 303, 307, 308]:
    print(f"  Redirige a: {r.headers.get('Location', 'N/A')}")

# También probar como JSON
r = session.post(f"{base_url}/api/register", json=register_data)
print(f"POST /api/register: {r.status_code}")
if r.status_code == 200:
    print(f"  Response: {r.text[:200]}")

# Intentar login
login_data = {
    "username": "admin",
    "password": "admin"
}

print("\nIntentando login como admin...")
r = session.post(f"{base_url}/login", data=login_data, allow_redirects=False)
print(f"POST /login: {r.status_code}")
if r.status_code in [301, 302, 303, 307, 308]:
    print(f"  Redirige a: {r.headers.get('Location', 'N/A')}")
    
# Verificar cookies
if session.cookies:
    print("\nCookies obtenidas:")
    for cookie in session.cookies:
        print(f"  {cookie.name}: {cookie.value[:50]}...")

# Probar acceso después del login
print("\nIntentando acceder a dashboard después del login...")
r = session.get(f"{base_url}/dashboard", allow_redirects=False)
print(f"GET /dashboard: {r.status_code}")
if r.status_code in [301, 302, 303, 307, 308]:
    print(f"  Redirige a: {r.headers.get('Location', 'N/A')}")