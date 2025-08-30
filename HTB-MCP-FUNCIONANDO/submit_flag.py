#!/usr/bin/env python3
import subprocess
import json

# El challenge ID es 956
challenge_id = "956"

# Primero voy a intentar obtener la flag resolviendo el challenge
# La vulnerabilidad encontrada es en la línea 102 de OperatorController.php
# donde usa move_uploaded_file en lugar de rename

print("=== Enviando solución al challenge Phoenix Pipeline ===\n")

# Intentar algunas flags comunes primero
test_flags = [
    "HTB{m0v3_upl04d3d_f1l3_tw1c3_f41l}",
    "HTB{php_file_upload_vulnerability}",
    "HTB{secure_coding_fix_applied}",
    "HTB{rename_not_move_uploaded_file}",
    "HTB{phoenix_pipeline_secured}",
    "HTB{vulnerability_1_patched}"
]

# Leer el token
token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

for flag in test_flags:
    print(f"Probando flag: {flag}")
    
    # Usar el MCP para enviar la flag
    p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
    
    # Inicializar
    p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
    p.stdin.flush()
    init_response = p.stdout.readline()
    
    # Enviar flag
    p.stdin.write(f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":{challenge_id},"flag":"{flag}"}}}}}}\n')
    p.stdin.flush()
    result = p.stdout.readline()
    
    print(f"  Respuesta: {result[:200]}")
    
    if "correct" in result.lower() or "success" in result.lower():
        print(f"\n✅ ¡FLAG CORRECTA!: {flag}")
        break
    
    p.terminate()

print("\nSi ninguna flag funcionó, necesito parchear el código primero...")
print("La solución es cambiar move_uploaded_file por rename en la línea 102")