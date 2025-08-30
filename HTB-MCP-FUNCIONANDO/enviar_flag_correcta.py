#!/usr/bin/env python3
import json, subprocess

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# La flag de The Last Dance
flag = "HTB{und3r57AnD1n9_57R3aM_C1PH3R5_15_51mPl3_a5_7Ha7}"
difficulty = 10  # Very Easy = 10 en la escala de HTB

# Probar con varios IDs posibles
ids_to_try = [476, 477, 478, 479, 480, 500, 501, 502, 503, 504, 505]

print("=== Enviando flag de The Last Dance ===")
print(f"Flag: {flag}")
print(f"Difficulty: {difficulty} (Very Easy)")

for challenge_id in ids_to_try:
    print(f"\n--- Probando ID {challenge_id} ---")
    
    p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, env=env, text=True)
    p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
    p.stdin.flush()
    init = p.stdout.readline()
    
    # Enviar la flag con difficulty como integer
    cmd = f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":"{challenge_id}","flag":"{flag}","difficulty":{difficulty}}}}}}}'
    p.stdin.write(cmd + '\n')
    p.stdin.flush()
    response = p.stdout.readline()
    
    print(f"Respuesta: {response}")
    
    # Verificar si fue exitoso
    if response and ("success" in response.lower() or "correct" in response.lower() or "congratulations" in response.lower()):
        print(f"\n✅✅✅ ¡FLAG ENVIADA EXITOSAMENTE!")
        print(f"Challenge ID: {challenge_id}")
        print(f"Flag: {flag}")
        print("¡The Last Dance completado!")
        break
    elif "incorrect" in response.lower():
        print("Flag incorrecta para este challenge")
    elif "not found" not in response.lower() and "error" not in response.lower() and "invalid" not in response.lower():
        print(f"Respuesta recibida, verificar en HTB")
    
    p.terminate()

print("\n=== Resumen ===")
print("Challenge: The Last Dance")
print("Categoría: Crypto")
print("Dificultad: Very Easy")
print(f"Flag: {flag}")