#!/usr/bin/env python3
import subprocess
import json

print("=== Enviando flag con MCP ===\n")

# Leer el token
token = open('.env').read().split('HTB_TOKEN=')[1].split('\n')[0]
env = {'HTB_TOKEN': token}

# Iniciar el servidor MCP
p = subprocess.Popen(['./htb-mcp-server'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)

# Inicializar
p.stdin.write('{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"0.1.0"}}\n')
p.stdin.flush()
init_response = p.stdout.readline()
print(f"Inicialización: {init_response[:100]}")

# Intentar enviar una flag de prueba
flag = "HTB{test_flag}"
challenge_id = "956"

# Formato correcto según el ejemplo
cmd = f'{{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":"{challenge_id}","flag":"{flag}"}}}}}}\n'
print(f"Enviando comando: {cmd[:150]}...")

p.stdin.write(cmd)
p.stdin.flush()
result = p.stdout.readline()
print(f"Resultado: {result}")

# Si eso no funciona, probar con el formato numérico
cmd2 = f'{{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{{"name":"submit_challenge_flag","arguments":{{"challenge_id":{challenge_id},"flag":"{flag}"}}}}}}\n'
p.stdin.write(cmd2)
p.stdin.flush()
result2 = p.stdout.readline()
print(f"Resultado (intento 2): {result2}")

p.terminate()