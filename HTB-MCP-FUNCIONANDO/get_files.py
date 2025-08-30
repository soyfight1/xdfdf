#!/usr/bin/env python3
import requests
import json

base_url = "http://94.237.57.115:46418"

print("=== Obteniendo archivos del proyecto ===\n")

# Obtener lista de archivos
r = requests.get(f"{base_url}/api/files")
if r.status_code == 200:
    files = r.json()
    print("Archivos disponibles:")
    print(json.dumps(files, indent=2))
    
    # Si hay archivos, descargarlos
    if isinstance(files, list):
        for file_path in files:
            print(f"\n=== Descargando: {file_path} ===")
            r_file = requests.get(f"{base_url}/api/file", params={"path": file_path})
            if r_file.status_code == 200:
                content = r_file.text
                # Guardar el archivo localmente
                safe_path = file_path.replace("/", "_").replace("\\", "_")
                with open(f"challenge_{safe_path}", "w") as f:
                    f.write(content)
                print(f"Guardado como: challenge_{safe_path}")
                print(f"Primeras líneas del archivo:")
                print("\n".join(content.split("\n")[:20]))
            else:
                print(f"Error al descargar: {r_file.status_code}")
                print(r_file.text)
    elif isinstance(files, dict) and 'files' in files:
        for file_path in files['files']:
            print(f"\n=== Descargando: {file_path} ===")
            r_file = requests.get(f"{base_url}/api/file", params={"path": file_path})
            if r_file.status_code == 200:
                content = r_file.text
                # Guardar el archivo localmente
                safe_path = file_path.replace("/", "_").replace("\\", "_")
                with open(f"challenge_{safe_path}", "w") as f:
                    f.write(content)
                print(f"Guardado como: challenge_{safe_path}")
                print(f"Primeras líneas del archivo:")
                print("\n".join(content.split("\n")[:20]))

# Intentar obtener información sobre las vulnerabilidades
print("\n\n=== Información sobre vulnerabilidades ===")
r_verify = requests.get(f"{base_url}/api/verify")
print(f"Respuesta de /api/verify:")
print(r_verify.text)