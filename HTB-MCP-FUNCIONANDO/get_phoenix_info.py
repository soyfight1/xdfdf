#!/usr/bin/env python3
import requests
import json
import os

# Leer el token
token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]

# Headers para las peticiones
headers = {
    "Authorization": f"Bearer {token}",
    "User-Agent": "Mozilla/5.0"
}

# Obtener información del challenge
challenge_id = 956
print("=== Obteniendo información del Challenge Phoenix Pipeline ===")

# Intentar diferentes endpoints
endpoints = [
    f"https://www.hackthebox.com/api/v4/challenge/info/{challenge_id}",
    f"https://www.hackthebox.com/api/v4/challenge/{challenge_id}",
    f"https://labs.hackthebox.com/api/v4/challenge/info/{challenge_id}",
    f"https://labs.hackthebox.com/api/v4/challenge/{challenge_id}"
]

for endpoint in endpoints:
    print(f"\nProbando: {endpoint}")
    try:
        r = requests.get(endpoint, headers=headers, timeout=10)
        if r.status_code == 200:
            print("¡Éxito!")
            data = r.json()
            
            # Mostrar información relevante
            if 'challenge' in data:
                ch = data['challenge']
                print(f"\nNombre: {ch.get('name', 'N/A')}")
                print(f"Descripción: {ch.get('description', 'N/A')}")
                print(f"Categoría: {ch.get('category_name', 'N/A')}")
                
                # Si hay archivos para descargar
                if 'download' in ch and ch['download']:
                    download_url = ch['download']
                    print(f"\nArchivo para descargar: {download_url}")
                    
                    # Descargar el archivo
                    print("Descargando archivo...")
                    download_headers = headers.copy()
                    r_download = requests.get(f"https://www.hackthebox.com{download_url}", headers=download_headers, stream=True)
                    
                    if r_download.status_code == 200:
                        filename = "phoenix_pipeline.zip"
                        with open(filename, 'wb') as f:
                            for chunk in r_download.iter_content(chunk_size=8192):
                                f.write(chunk)
                        print(f"Archivo descargado: {filename}")
                    else:
                        print(f"Error al descargar: {r_download.status_code}")
                
                # Si necesita Docker
                if 'docker_ip' in ch and ch['docker_ip']:
                    print(f"\nIP Docker: {ch['docker_ip']}")
                    if 'docker_ports' in ch:
                        print(f"Puertos: {ch['docker_ports']}")
                        
            break
        else:
            print(f"Error: {r.status_code}")
    except Exception as e:
        print(f"Error: {e}")

# Intentar obtener el link de descarga directamente
print("\n=== Intentando obtener link de descarga ===")
download_endpoint = f"https://www.hackthebox.com/api/v4/challenge/download/{challenge_id}"
try:
    r = requests.get(download_endpoint, headers=headers, allow_redirects=False)
    if r.status_code in [200, 302]:
        if 'Location' in r.headers:
            download_url = r.headers['Location']
            print(f"URL de descarga encontrada: {download_url}")
            
            # Descargar el archivo
            r_download = requests.get(download_url, stream=True)
            if r_download.status_code == 200:
                filename = "phoenix_pipeline_challenge.zip"
                with open(filename, 'wb') as f:
                    for chunk in r_download.iter_content(chunk_size=8192):
                        f.write(chunk)
                print(f"Archivo descargado: {filename}")
except Exception as e:
    print(f"Error: {e}")