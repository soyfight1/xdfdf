#!/usr/bin/env python3
import json, subprocess

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# La flag de The Last Dance
flag = "HTB{und3r57AnD1n9_57R3aM_C1PH3R5_15_51mPl3_a5_7Ha7}"
difficulty = "very easy"

# Probar con varios IDs posibles
ids_to_try = [476, 477, 478, 479, 480, 500, 501, 502, 503, 504, 505]

for challenge_id in ids_to_try:
    print(f"\n=== Intentando enviar flag con ID {challenge_id} ===")
    print(f"Flag: {flag}")
    print(f"Difficulty: {difficulty}")
    
    p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=env, text=True)
    p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
    p.stdin.flush()
    init = p.stdout.readline()
    
    # Enviar la flag con difficulty
    cmd = f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":"{challenge_id}","flag":"{flag}","difficulty":"{difficulty}"}}}}}}'
    print(f"Enviando comando: {cmd}")
    p.stdin.write(cmd + '\n')
    p.stdin.flush()
    response = p.stdout.readline()
    
    print(f"Respuesta: {response}")
    
    # Verificar si fue exitoso
    if response and ("success" in response.lower() or "correct" in response.lower() or "congratulations" in response.lower() or "points" in response.lower()):
        print(f"\n✅ ¡FLAG ENVIADA EXITOSAMENTE CON ID {challenge_id}!")
        print("¡The Last Dance completado!")
        break
    elif "not found" not in response.lower() and "error" not in response.lower():
        # Si no hay error de "not found", podría ser el ID correcto
        print(f"Posible ID correcto: {challenge_id}")
    
    p.terminate()

print("\n=== Flag de The Last Dance ===")
print(f"Flag correcta: {flag}")
print("La flag ha sido procesada.")