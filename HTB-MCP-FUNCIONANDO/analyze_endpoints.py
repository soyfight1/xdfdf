#!/usr/bin/env python3
import requests
import json

base_url = "http://94.237.57.115:46418"

print("=== Analizando endpoints en detalle ===\n")

# Endpoints interesantes
endpoints = [
    '/api',
    '/api/execute',
    '/api/run', 
    '/api/code',
    '/api/compile',
    '/.git',
    '/robots.txt'
]

for endpoint in endpoints:
    print(f"\n--- {endpoint} ---")
    
    # GET request
    r = requests.get(f"{base_url}{endpoint}")
    print(f"GET Status: {r.status_code}")
    print(f"Content-Type: {r.headers.get('Content-Type', 'N/A')}")
    print(f"Content Length: {len(r.text)}")
    
    if len(r.text) < 1000:
        print(f"Response: {r.text}")
    else:
        print(f"Response (first 500 chars): {r.text[:500]}...")
    
    # POST request con diferentes payloads
    if 'api' in endpoint:
        print(f"\nPOST tests:")
        
        # Test 1: JSON vacío
        r = requests.post(f"{base_url}{endpoint}", json={})
        print(f"  Empty JSON: {r.status_code} - {r.text[:200] if len(r.text) < 200 else r.text[:200]+'...'}")
        
        # Test 2: Código Python
        payload = {"code": "print('test')", "language": "python"}
        r = requests.post(f"{base_url}{endpoint}", json=payload)
        print(f"  Python code: {r.status_code} - {r.text[:200] if len(r.text) < 200 else r.text[:200]+'...'}")
        
        # Test 3: Comando sistema
        payload = {"cmd": "ls", "command": "ls", "exec": "ls"}
        r = requests.post(f"{base_url}{endpoint}", json=payload)
        print(f"  System cmd: {r.status_code} - {r.text[:200] if len(r.text) < 200 else r.text[:200]+'...'}")

# Verificar si hay WebSocket
print("\n\n--- WebSocket Test ---")
import websocket
import ssl

ws_url = base_url.replace("http://", "ws://")
for ws_endpoint in ["/ws", "/websocket", "/socket.io"]:
    try:
        print(f"Probando WebSocket en {ws_endpoint}")
        ws = websocket.create_connection(f"{ws_url}{ws_endpoint}", timeout=3)
        ws.send("test")
        result = ws.recv()
        print(f"  Respuesta: {result}")
        ws.close()
    except Exception as e:
        print(f"  Error: {str(e)[:100]}")