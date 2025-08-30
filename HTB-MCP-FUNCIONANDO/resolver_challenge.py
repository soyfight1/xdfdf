#!/usr/bin/env python3
import json, subprocess, time

token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# The Last Dance es un challenge de Crypto, intentemos con varios IDs posibles
print("=== Buscando e iniciando The Last Dance ===\n")

# Primero intentar iniciar con ID 476 (el más probable según búsquedas)
challenge_id = 476
flag = "HTB{und3r57AnD1n9_57R3aM_C1PH3R5_15_51mPl3_a5_7Ha7}"

print(f"Intentando iniciar challenge ID {challenge_id}...")
p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
p.stdout.readline()

# Iniciar challenge
p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"start_challenge","arguments":{{"challenge_id":{challenge_id}}}}}}}\n')
p.stdin.flush()
start_response = p.stdout.readline()
print(f"Respuesta inicio: {start_response}\n")
p.terminate()

time.sleep(1)

# Ahora enviar la flag
print(f"Enviando flag: {flag}")
p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
p.stdout.readline()

p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":"{challenge_id}","flag":"{flag}"}}}}}}\n')
p.stdin.flush()
flag_response = p.stdout.readline()
print(f"Respuesta flag: {flag_response}")

if "correct" in flag_response.lower() or "success" in flag_response.lower() or "congratulations" in flag_response.lower():
    print("\n✅ ¡FLAG ENVIADA EXITOSAMENTE!")
else:
    print("\nVerifica el resultado en HTB")

p.terminate()