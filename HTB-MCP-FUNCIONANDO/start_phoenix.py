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

# Iniciar el challenge Phoenix Pipeline (ID 956)
challenge_id = "956"
p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"start_challenge","arguments":{{"challenge_id":{challenge_id}}}}}}}\n')
p.stdin.flush()
result = p.stdout.readline()
print("Resultado del challenge:", result)

# Obtener información del challenge
p.stdin.write(f'{{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{{"name":"get_challenge_info","arguments":{{"challenge_id":{challenge_id}}}}}}}\n')
p.stdin.flush()
info = p.stdout.readline()
print("Información del challenge:", info)

p.terminate()