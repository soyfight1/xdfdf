#!/usr/bin/env python3
import json
import subprocess
import os

# Leer el token del archivo .env
token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# Iniciar el servidor MCP
p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)

# Inicializar el protocolo
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
print("Inicialización:", p.stdout.readline())

# Listar challenges disponibles
print("\n=== Listando challenges ===")
p.stdin.write('{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_challenges","arguments":{}}}\n')
p.stdin.flush()
result = p.stdout.readline()
print("Challenges:", result)

# Buscar información específica del challenge 956
print("\n=== Buscando Phoenix Pipeline (ID 956) ===")
try:
    challenges_data = json.loads(result)
    if 'result' in challenges_data and 'content' in challenges_data['result']:
        content = challenges_data['result']['content'][0]['text']
        # El contenido podría estar en formato JSON o texto
        print(content)
except:
    pass

p.terminate()