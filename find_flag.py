#!/usr/bin/env python3

# Leer el pcap completo
with open('capture.pcap', 'rb') as f:
    data = f.read()

# Buscar patrones de flag
import re

# Buscar picoCTF{...}
pattern1 = rb'picoCTF\{[^}]+\}'
matches = re.findall(pattern1, data)
if matches:
    for m in matches:
        print(f"Found flag: {m.decode('utf-8', errors='ignore')}")

# Buscar variaciones
pattern2 = rb'pico[^{]*\{[^}]+\}'
matches2 = re.findall(pattern2, data)
if matches2:
    for m in matches2:
        print(f"Possible flag: {m.decode('utf-8', errors='ignore')}")

# Buscar en ASCII imprimibles
printable = []
for i in range(len(data)):
    if 32 <= data[i] <= 126:
        printable.append(chr(data[i]))
    else:
        if len(printable) > 10:
            text = ''.join(printable)
            if 'pico' in text.lower() and '{' in text:
                print(f"Text with pico: {text}")
        printable = []

# Buscar base64
import base64
b64_pattern = rb'[A-Za-z0-9+/]{20,}={0,2}'
b64_matches = re.findall(b64_pattern, data)
for b64 in b64_matches[:50]:  # Solo los primeros 50
    try:
        decoded = base64.b64decode(b64)
        if b'pico' in decoded.lower():
            print(f"Base64 decoded: {decoded}")
    except:
        pass

# Buscar en hex
hex_pattern = rb'[0-9a-fA-F]{32,}'
hex_matches = re.findall(hex_pattern, data)
for h in hex_matches[:50]:
    try:
        decoded = bytes.fromhex(h.decode())
        if b'pico' in decoded.lower():
            print(f"Hex decoded: {decoded}")
    except:
        pass

print("\n[*] Searching for flag components...")
# Buscar componentes separados
if b'picoCTF' in data:
    idx = data.index(b'picoCTF')
    print(f"picoCTF found at position {idx}")
    # Mostrar 200 bytes después
    segment = data[idx:idx+200]
    # Limpiar no imprimibles
    clean = ''.join([chr(b) if 32 <= b <= 126 else '.' for b in segment])
    print(f"Context: {clean}")

# Buscar llaves
if b'{' in data:
    positions = [i for i, b in enumerate(data) if b == ord('{')]
    print(f"\nFound {len(positions)} brace characters")
    for pos in positions[:20]:
        # Ver si hay algo interesante cerca
        before = data[max(0, pos-20):pos]
        after = data[pos:min(len(data), pos+50)]
        if b'pico' in before.lower() or b'ctf' in before.lower():
            combined = before + after
            clean = ''.join([chr(b) if 32 <= b <= 126 else '' for b in combined])
            if clean:
                print(f"Near brace at {pos}: {clean}")