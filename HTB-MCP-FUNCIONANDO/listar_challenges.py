#!/usr/bin/env python3
import json
import subprocess
import os

# Leer token del archivo .env
try:
    with open('.env', 'r') as f:
        content = f.read()
        token = content.split('HTB_TOKEN=')[1].split('\n')[0]
except:
    print("Error: No se pudo leer el token de .env")
    print("Por favor, actualiza el archivo .env con tu token de HTB")
    exit(1)

env = {'HTB_TOKEN': token}

# Iniciar el servidor MCP
p = subprocess.Popen(['./htb-mcp-server'], 
                     stdin=subprocess.PIPE, 
                     stdout=subprocess.PIPE, 
                     stderr=subprocess.PIPE,
                     env=env, 
                     text=True)

# Inicializar el protocolo
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
init_response = p.stdout.readline()
print(f"Inicialización: {init_response}")

# Listar challenges
p.stdin.write('{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_challenges","arguments":{}}}\n')
p.stdin.flush()
challenges_response = p.stdout.readline()
print(f"\nRespuesta completa: {challenges_response}")

try:
    data = json.loads(challenges_response)
    if 'result' in data and 'content' in data['result']:
        content = json.loads(data['result']['content'][0]['text'])
        challenges = content.get('challenges', [])
        
        print(f"\n=== Challenges disponibles ({len(challenges)}) ===\n")
        
        # Buscar "The Last Dance"
        last_dance = None
        for challenge in challenges:
            if 'The Last Dance' in challenge.get('name', ''):
                last_dance = challenge
                print(f"*** ENCONTRADO: {challenge['name']} ***")
                print(f"    ID: {challenge['id']}")
                print(f"    Categoría: {challenge.get('category', 'N/A')}")
                print(f"    Dificultad: {challenge.get('difficulty', 'N/A')}")
                print(f"    Puntos: {challenge.get('points', 'N/A')}")
                print()
            else:
                print(f"- {challenge.get('name', 'Sin nombre')} (ID: {challenge.get('id', 'N/A')})")
        
        if last_dance:
            print(f"\n¡Challenge 'The Last Dance' encontrado con ID: {last_dance['id']}!")
        else:
            print("\nNo se encontró el challenge 'The Last Dance'")
            print("Buscando con variaciones del nombre...")
            for challenge in challenges:
                name = challenge.get('name', '').lower()
                if 'last' in name or 'dance' in name:
                    print(f"  Posible coincidencia: {challenge['name']} (ID: {challenge['id']})")
                    
except json.JSONDecodeError as e:
    print(f"Error al parsear JSON: {e}")
except Exception as e:
    print(f"Error: {e}")

p.terminate()