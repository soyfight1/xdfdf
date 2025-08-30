#!/usr/bin/env python3
import requests
import json

base_url = "http://94.237.57.115:46418"

print("=== Explorando API del HTB Editor ===\n")

# Headers comunes
headers = {
    "Content-Type": "application/json",
    "User-Agent": "Mozilla/5.0"
}

# Endpoints a probar
endpoints = [
    ("/api/files", "GET"),
    ("/api/file", "GET"),
    ("/api/verify", "GET"),
    ("/api/verify", "POST"),
    ("/api/validate", "GET"),
    ("/api/check", "GET"),
    ("/api/submit", "POST"),
    ("/api/flag", "POST"),
    ("/api/solution", "POST"),
    ("/challenge/", "GET"),
    ("/socket.io/", "GET"),
    ("/api", "GET"),
    ("/api/", "GET"),
    ("/api/status", "GET"),
    ("/api/health", "GET")
]

for endpoint, method in endpoints:
    try:
        url = f"{base_url}{endpoint}"
        
        if method == "GET":
            r = requests.get(url, headers=headers, timeout=5)
        else:
            # Probar con diferentes payloads
            payloads = [
                {},
                {"flag": "test"},
                {"solution": "test"},
                {"code": "print('test')"},
                {"file": "test.py"}
            ]
            
            for payload in payloads:
                r = requests.post(url, json=payload, headers=headers, timeout=5)
                if r.status_code != 404:
                    break
        
        if r.status_code != 404:
            print(f"{method} {endpoint}: {r.status_code}")
            
            # Si hay contenido JSON, mostrarlo
            try:
                if r.headers.get('Content-Type', '').startswith('application/json'):
                    data = r.json()
                    print(f"  Response: {json.dumps(data, indent=2)[:500]}")
            except:
                if len(r.text) < 200 and not r.text.startswith('<!'):
                    print(f"  Response: {r.text}")
                    
    except requests.exceptions.Timeout:
        print(f"{method} {endpoint}: TIMEOUT")
    except Exception as e:
        pass

# Probar WebSocket con diferentes paths
print("\n=== Probando WebSocket paths ===")
ws_paths = ["/socket.io", "/ws", "/websocket", "/"]
for path in ws_paths:
    try:
        r = requests.get(f"{base_url}{path}", 
                        headers={"Upgrade": "websocket", "Connection": "Upgrade"},
                        timeout=3)
        print(f"WS {path}: {r.status_code} - {r.headers.get('Upgrade', 'No upgrade')}")
    except:
        pass