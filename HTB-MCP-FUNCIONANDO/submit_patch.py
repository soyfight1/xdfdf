#!/usr/bin/env python3
import requests
import json

base_url = "http://94.237.57.115:46418"

print("=== Enviando parche al servidor ===\n")

# Leer el archivo parcheado
with open("OperatorController_patched.php", "r") as f:
    patched_content = f.read()

# Intentar actualizar el archivo
paths_to_try = [
    "app/Controllers/OperatorController.php",
    "Controllers/OperatorController.php",
    "OperatorController.php"
]

for path in paths_to_try:
    print(f"Intentando actualizar: {path}")
    
    # Método 1: POST con el contenido
    r = requests.post(f"{base_url}/api/file", 
                     json={"path": path, "content": patched_content})
    print(f"  POST /api/file: {r.status_code}")
    if r.status_code == 200:
        print(f"  Respuesta: {r.text[:200]}")
        break
    
    # Método 2: PUT
    r = requests.put(f"{base_url}/api/file",
                    json={"path": path, "content": patched_content})
    print(f"  PUT /api/file: {r.status_code}")
    if r.status_code == 200:
        print(f"  Respuesta: {r.text[:200]}")
        break
    
    # Método 3: PATCH
    r = requests.patch(f"{base_url}/api/file",
                      json={"path": path, "content": patched_content})
    print(f"  PATCH /api/file: {r.status_code}")
    if r.status_code == 200:
        print(f"  Respuesta: {r.text[:200]}")
        break

# Verificar si el parche se aplicó
print("\n=== Verificando el parche ===")
r = requests.get(f"{base_url}/api/verify")
print(f"Estado actual: {r.text}")

if "Vulnerability 1 is not patched" in r.text:
    print("\n❌ El parche aún no se ha aplicado")
    print("Intentando métodos alternativos...")
    
    # Intentar escribir directamente en el editor
    print("\nIntentando usar el editor web...")
    # Aquí necesitaríamos interactuar con el editor web via WebSocket
else:
    print("\n✅ ¡Parche aplicado exitosamente!")