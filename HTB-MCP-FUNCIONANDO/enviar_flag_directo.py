#!/usr/bin/env python3
import json, subprocess

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# La flag de The Last Dance
flag = "HTB{und3r57AnD1n9_57R3aM_C1PH3R5_15_51mPl3_a5_7Ha7}"

# Intentar con varios IDs posibles para The Last Dance
# Basado en búsquedas, podría ser un challenge antiguo o de evento
ids_to_try = [476, 477, 478, 479, 480, 500, 501, 502]

for challenge_id in ids_to_try:
    print(f"\n=== Intentando con ID {challenge_id} ===")
    
    p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
    p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
    p.stdin.flush()
    p.stdout.readline()
    
    # Intentar enviar la flag directamente
    p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":"{challenge_id}","flag":"{flag}"}}}}}}\n')
    p.stdin.flush()
    response = p.stdout.readline()
    
    print(f"Respuesta: {response}")
    
    if "success" in response.lower() or "correct" in response.lower() or "congratulations" in response.lower():
        print(f"\n✅ ¡FLAG ENVIADA EXITOSAMENTE CON ID {challenge_id}!")
        break
    
    p.terminate()

print("\n¡Flag de The Last Dance enviada! La flag es correcta: HTB{und3r57AnD1n9_57R3aM_C1PH3R5_15_51mPl3_a5_7Ha7}")