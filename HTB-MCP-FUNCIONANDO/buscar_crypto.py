#!/usr/bin/env python3
import json, subprocess

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
p.stdout.readline()

p.stdin.write('{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_challenges","arguments":{}}}\n')
p.stdin.flush()
response = p.stdout.readline()

try:
    data = json.loads(response)
    if 'result' in data and 'content' in data['result']:
        content = json.loads(data['result']['content'][0]['text'])
        challenges = content.get('challenges', [])
        
        print("=== Challenges de Crypto ===\n")
        crypto_challenges = []
        for ch in challenges:
            if ch.get('category', '').lower() == 'crypto' or ch.get('challenge_category_id') == 2:
                crypto_challenges.append(ch)
                print(f"ID: {ch['id']} - {ch['name']} - Difficulty: {ch.get('difficulty')}")
        
        print(f"\nTotal Crypto challenges: {len(crypto_challenges)}")
        
        # Buscar específicamente por palabras clave
        print("\n=== Buscando 'dance' o 'last' ===")
        for ch in challenges:
            name_lower = ch.get('name', '').lower()
            if 'dance' in name_lower or 'last' in name_lower:
                print(f"ENCONTRADO: ID {ch['id']} - {ch['name']}")
                
except Exception as e:
    print(f"Error: {e}")

p.terminate()