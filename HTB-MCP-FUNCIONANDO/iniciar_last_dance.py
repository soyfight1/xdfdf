#!/usr/bin/env python3
import json, subprocess, os, sys

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# Probar con diferentes IDs posibles para The Last Dance
ids_to_try = [476, 500, 477, 478, 479, 480]

for challenge_id in ids_to_try:
    print(f"Intentando iniciar challenge con ID {challenge_id}...")
    
    p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
    p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
    p.stdin.flush()
    p.stdout.readline()
    
    p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"start_challenge","arguments":{{"challenge_id":{challenge_id}}}}}}}\n')
    p.stdin.flush()
    response = p.stdout.readline()
    print(f"Respuesta: {response}")
    
    if "Last Dance" in response or "success" in response.lower():
        print(f"¡Challenge iniciado con ID {challenge_id}!")
        with open('challenge_id.txt', 'w') as f:
            f.write(str(challenge_id))
        break
    
    p.terminate()