#!/usr/bin/env python3
import json, subprocess, os

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
init = p.stdout.readline()

p.stdin.write('{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"list_challenges","arguments":{}}}\n')
p.stdin.flush()
response = p.stdout.readline()

try:
    data = json.loads(response)
    if 'result' in data and 'content' in data['result']:
        content = json.loads(data['result']['content'][0]['text'])
        challenges = content.get('challenges', [])
        
        print(f"Total challenges: {len(challenges)}\n")
        
        # Buscar específicamente The Last Dance
        found = False
        for ch in challenges:
            name = ch.get('name', '')
            if 'dance' in name.lower() or 'last' in name.lower():
                print(f"*** POSIBLE MATCH: {name} - ID: {ch['id']} - Category: {ch.get('category')} ***")
                found = True
        
        if not found:
            print("No se encontró 'The Last Dance'. Mostrando todos los challenges de Crypto:")
            print("-" * 50)
            for ch in challenges:
                if ch.get('category', '').lower() == 'crypto':
                    print(f"ID: {ch['id']} - Name: {ch['name']} - Difficulty: {ch.get('difficulty')}")
            
except Exception as e:
    print(f"Error: {e}")
    print(f"Response: {response}")

p.terminate()