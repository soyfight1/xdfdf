#!/usr/bin/env python3
import json, subprocess, os, sys
import time

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# Paso 1: Listar challenges para encontrar The Last Dance
print("=== Buscando 'The Last Dance' ===")
p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
init = p.stdout.readline()

p.stdin.write('{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_challenges","arguments":{}}}\n')
p.stdin.flush()
response = p.stdout.readline()
p.terminate()

challenge_id = None
try:
    data = json.loads(response)
    if 'result' in data and 'content' in data['result']:
        content = json.loads(data['result']['content'][0]['text'])
        challenges = content.get('challenges', [])
        
        for ch in challenges:
            name = ch.get('name', '').lower()
            if 'last dance' in name or 'the last dance' in name:
                challenge_id = ch['id']
                print(f"¡Encontrado! Challenge: {ch['name']}, ID: {challenge_id}")
                break
                
        if not challenge_id:
            # Si no encuentra, buscar variaciones
            for ch in challenges:
                name = ch.get('name', '').lower()
                if 'last' in name and 'dance' in name:
                    challenge_id = ch['id']
                    print(f"¡Encontrado! Challenge: {ch['name']}, ID: {challenge_id}")
                    break
except:
    pass

if not challenge_id:
    # Si no lo encuentra, probar con IDs conocidos
    print("No encontrado en la lista, probando con ID 476...")
    challenge_id = 476

# Paso 2: Iniciar el challenge
print(f"\n=== Iniciando challenge ID {challenge_id} ===")
p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
p.stdout.readline()

p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"start_challenge","arguments":{{"challenge_id":{challenge_id}}}}}}}\n')
p.stdin.flush()
start_response = p.stdout.readline()
print(f"Respuesta: {start_response}")
p.terminate()

time.sleep(2)

# Paso 3: Enviar la flag
flag = "HTB{und3r57AnD1n9_57R3aM_C1PH3R5_15_51mPl3_a5_7Ha7}"
print(f"\n=== Enviando flag para challenge ID {challenge_id} ===")
print(f"Flag: {flag}")

p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
p.stdout.readline()

p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":{challenge_id},"flag":"{flag}"}}}}}}\n')
p.stdin.flush()
flag_response = p.stdout.readline()
print(f"Respuesta: {flag_response}")

# Verificar si fue exitoso
if "success" in flag_response.lower() or "correct" in flag_response.lower():
    print("\n¡FLAG ENVIADA EXITOSAMENTE! ✓")
else:
    print("\nRespuesta recibida, verificar en HTB si fue aceptada")

p.terminate()