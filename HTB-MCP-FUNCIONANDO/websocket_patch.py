#!/usr/bin/env python3
import websocket
import json
import time

print("=== Intentando conectar via WebSocket ===\n")

# URL del WebSocket
ws_url = "ws://94.237.57.115:46418/socket.io/"

# Leer el archivo parcheado
with open("OperatorController_patched.php", "r") as f:
    patched_content = f.read()

try:
    # Intentar conectar
    print(f"Conectando a {ws_url}")
    ws = websocket.create_connection(ws_url, timeout=5)
    
    print("Conexión establecida!")
    
    # Enviar mensaje de inicialización
    init_msg = {
        "type": "init",
        "data": {}
    }
    ws.send(json.dumps(init_msg))
    print(f"Enviado: {init_msg}")
    
    # Recibir respuesta
    result = ws.recv()
    print(f"Recibido: {result}")
    
    # Intentar guardar el archivo
    save_msg = {
        "type": "save",
        "data": {
            "fileName": "app/Controllers/OperatorController.php",
            "content": patched_content
        }
    }
    ws.send(json.dumps(save_msg))
    print(f"Enviando archivo parcheado...")
    
    # Recibir respuesta
    result = ws.recv()
    print(f"Respuesta: {result}")
    
    ws.close()
    
except websocket.WebSocketException as e:
    print(f"Error WebSocket: {e}")
except Exception as e:
    print(f"Error: {e}")

# Verificar si funcionó
print("\n=== Verificando si el parche se aplicó ===")
import requests
r = requests.get("http://94.237.57.115:46418/api/verify")
print(f"Estado: {r.text}")

if "Vulnerability 1 is not patched" not in r.text:
    print("\n✅ ¡Parche aplicado exitosamente!")
    print("La flag debería estar disponible ahora.")
else:
    print("\n❌ El parche no se aplicó")