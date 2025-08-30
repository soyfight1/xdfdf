#!/usr/bin/env python3
import requests
import json
import base64

base_url = "http://94.237.57.115:46418"

print("=== Probando el endpoint /api/verify ===\n")

# Leer el archivo parcheado
with open("OperatorController_patched.php", "r") as f:
    patched_content = f.read()

# Probar diferentes formas de enviar el parche
tests = [
    # GET con parámetros
    ("GET", "/api/verify", None, {"patch": "1"}),
    ("GET", "/api/verify", None, {"vulnerability": "1", "patched": "true"}),
    ("GET", "/api/verify", None, {"file": "OperatorController.php", "content": patched_content[:100]}),
    
    # POST con JSON (aunque devuelva 405, ver si el mensaje cambia)
    ("POST", "/api/verify", {"patch": patched_content}, None),
    ("POST", "/api/verify", {"vulnerability": 1, "patch": patched_content}, None),
    ("POST", "/api/verify", {"file": "OperatorController.php", "content": patched_content}, None),
    
    # Intentar con base64
    ("GET", "/api/verify", None, {"patch": base64.b64encode(patched_content.encode()).decode()[:100]}),
]

for method, endpoint, json_data, params in tests:
    try:
        url = f"{base_url}{endpoint}"
        
        if method == "GET":
            r = requests.get(url, params=params)
        else:
            r = requests.post(url, json=json_data)
        
        print(f"{method} {endpoint}")
        if params:
            print(f"  Params: {str(params)[:100]}")
        if json_data:
            print(f"  JSON: {str(json_data)[:100]}")
        print(f"  Status: {r.status_code}")
        print(f"  Response: {r.text[:200]}")
        print()
        
        # Si el mensaje cambia, es una buena señal
        if "Vulnerability 1 is not patched" not in r.text and r.status_code != 405:
            print("  ⚠️ ¡Respuesta diferente!")
            
    except Exception as e:
        print(f"Error: {e}")

# Intentar también con el archivo original para comparar
print("\n=== Verificando si hay diferencia con el archivo original ===")
r1 = requests.get(f"{base_url}/api/verify")
print(f"Sin parámetros: {r1.text}")

r2 = requests.get(f"{base_url}/api/verify", params={"test": "1"})
print(f"Con parámetro test: {r2.text}")