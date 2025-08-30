#!/usr/bin/env python3
import json, subprocess, sys

# La flag de "The Last Dance" que resolvimos
flag = "HTB{und3r57AnD1n9_57R3aM_C1PH3R5_15_51mPl3_a5_7Ha7}"
challenge_id = 836  # ID de "Last Resort" encontrado en la lista

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

print(f"=== Enviando flag de 'The Last Dance' ===")
print(f"Challenge ID: {challenge_id}")
print(f"Flag: {flag}\n")

p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
p.stdout.readline()

# Enviar la flag
p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":"{challenge_id}","flag":"{flag}"}}}}}}\n')
p.stdin.flush()
response = p.stdout.readline()

print(f"Respuesta: {response}")

try:
    data = json.loads(response)
    if 'result' in data:
        print("\n✅ FLAG ENVIADA A HACKTHEBOX")
        print("Verifica tu perfil en HTB para confirmar los puntos")
except:
    print("\nRespuesta recibida. Verifica en HTB si fue aceptada.")

p.terminate()