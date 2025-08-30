#!/usr/bin/env python3
import json
import subprocess
import os

# Leer token del archivo .env
token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# Iniciar el servidor MCP
p = subprocess.Popen(['./htb-mcp-server'], 
                     stdin=subprocess.PIPE, 
                     stdout=subprocess.PIPE, 
                     stderr=subprocess.PIPE,
                     env=env, 
                     text=True)

# Inicializar
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
p.stdout.readline()

# Listar challenges
p.stdin.write('{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_challenges","arguments":{}}}\n')
p.stdin.flush()
response = p.stdout.readline()

try:
    data = json.loads(response)
    if 'result' in data and 'content' in data['result']:
        content = json.loads(data['result']['content'][0]['text'])
        challenges = content.get('challenges', [])
        
        print(f"Buscando 'The Last Dance' entre {len(challenges)} challenges...")
        
        for challenge in challenges:
            name = challenge.get('name', '')
            if 'Last Dance' in name or 'last dance' in name.lower():
                print(f"\n¡ENCONTRADO!")
                print(f"Nombre: {challenge['name']}")
                print(f"ID: {challenge['id']}")
                print(f"Categoría: {challenge.get('category', 'N/A')}")
                print(f"Dificultad: {challenge.get('difficulty', 'N/A')}")
                print(f"Puntos: {challenge.get('points', 'N/A')}")
                
                # Guardar el ID para usarlo después
                with open('last_dance_id.txt', 'w') as f:
                    f.write(str(challenge['id']))
                break
                
except Exception as e:
    print(f"Error: {e}")

p.terminate()