#!/usr/bin/env python3
import requests
import json

# Leer el token
token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]

# Obtener información del challenge
challenge_id = 956
headers = {"Authorization": f"Bearer {token}"}

# Obtener info general del challenge
print("Obteniendo información del challenge Phoenix Pipeline...")
r = requests.get(f"https://labs.hackthebox.com/api/v4/challenge/info/{challenge_id}", headers=headers)
if r.status_code == 200:
    data = r.json()
    print(json.dumps(data, indent=2))
    
    # Extraer información relevante
    if 'challenge' in data:
        challenge = data['challenge']
        print("\n=== Información del Challenge ===")
        print(f"Nombre: {challenge.get('name', 'N/A')}")
        print(f"Descripción: {challenge.get('description', 'N/A')}")
        print(f"Categoría: {challenge.get('category_name', 'N/A')}")
        print(f"Dificultad: {challenge.get('difficulty', 'N/A')}")
        
        # Si es un challenge con instancia Docker
        if 'docker_ip' in challenge and challenge['docker_ip']:
            print(f"\nIP Docker: {challenge['docker_ip']}")
            if 'docker_ports' in challenge:
                print(f"Puertos: {challenge['docker_ports']}")
        
        # Si hay archivos para descargar
        if 'download' in challenge and challenge['download']:
            print(f"\nArchivo para descargar: {challenge['download']}")
            
        # Si es solo download (no necesita IP)
        if 'docker' in challenge:
            print(f"\nRequiere Docker: {challenge['docker']}")
else:
    print(f"Error: {r.status_code}")
    print(r.text)