#!/usr/bin/env python3
import subprocess
import re

# Método 1: Usar tshark con la clave
print("[*] Método 1: tshark decryption")
try:
    cmd = 'tshark -r capture.pcap -o "ssl.keys_list:0.0.0.0,443,http,picopico.key" -Y "http" -T fields -e http.file_data 2>/dev/null'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout)
        # Buscar hex y convertir
        hex_data = result.stdout.replace(':', '').strip()
        if hex_data:
            try:
                decoded = bytes.fromhex(hex_data).decode('utf-8', errors='ignore')
                if 'pico' in decoded.lower():
                    print(f"Found: {decoded}")
            except:
                pass
except:
    pass

# Método 2: Exportar objetos HTTP
print("\n[*] Método 2: Export HTTP objects")
try:
    cmd = 'tshark -r capture.pcap -o "ssl.keys_list:0.0.0.0,443,http,picopico.key" --export-objects "http,/tmp/" 2>/dev/null'
    subprocess.run(cmd, shell=True)
    # Buscar en archivos exportados
    import os
    for f in os.listdir('/tmp/'):
        if f.startswith('%'):
            with open(f'/tmp/{f}', 'rb') as file:
                content = file.read()
                if b'pico' in content.lower():
                    print(f"Found in {f}: {content}")
except:
    pass

# Método 3: Strings simple después de descifrar
print("\n[*] Método 3: Decrypted strings")
try:
    cmd = 'tshark -r capture.pcap -o "ssl.keys_list:0.0.0.0,443,http,picopico.key" -x 2>/dev/null | strings | grep -i pico'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout)
except:
    pass

# Método 4: Follow SSL Stream
print("\n[*] Método 4: Follow SSL stream")
try:
    cmd = 'tshark -r capture.pcap -o "ssl.keys_list:0.0.0.0,443,http,picopico.key" -z "follow,ssl,ascii,0" 2>/dev/null | grep -i pico'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.stdout:
        print(result.stdout)
except:
    pass

print("\n[*] Buscando flag pattern...")
cmd = 'strings capture.pcap | grep -E "picoCTF{.*}" || strings capture.pcap | grep -E "pico.*{.*}"'
result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
if result.stdout:
    print(f"POSSIBLE FLAG: {result.stdout}")