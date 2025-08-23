#!/usr/bin/env python3
import os
import re
import struct
import hashlib

def analyze_exe():
    print("=== Analizando Arly.exe ===")
    with open('Arly.exe', 'rb') as f:
        exe_data = f.read()
    
    # Buscar URLs
    urls = re.findall(b'https?://[^\x00\s]+', exe_data)
    if urls:
        print("URLs encontradas:")
        for url in urls[:10]:
            print(f"  - {url.decode('utf-8', errors='ignore')}")
    
    # Buscar IPs
    ips = re.findall(b'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', exe_data)
    if ips:
        print("\nIPs encontradas:")
        for ip in set(ips):
            print(f"  - {ip.decode()}")
    
    # Buscar posibles flags
    flag_patterns = [
        b'FLAG{[^}]+}',
        b'flag{[^}]+}',
        b'CTF{[^}]+}',
        b'ctf{[^}]+}'
    ]
    
    for pattern in flag_patterns:
        matches = re.findall(pattern, exe_data)
        if matches:
            print(f"\n¡POSIBLE FLAG ENCONTRADA!: {matches}")
    
    # Buscar referencias al archivo RO051wADAG4X
    if b'RO051wADAG4X' in exe_data:
        print("\n¡El ejecutable hace referencia a RO051wADAG4X!")
        
def analyze_data_file():
    print("\n=== Analizando data/RO051wADAG4X ===")
    with open('data/RO051wADAG4X', 'rb') as f:
        data = f.read()
    
    print(f"Tamaño: {len(data)} bytes ({len(data)/1024/1024:.2f} MB)")
    print(f"MD5: {hashlib.md5(data).hexdigest()}")
    print(f"Primeros 16 bytes: {data[:16].hex()}")
    
    # Análisis de entropía simple
    byte_counts = {}
    for byte in data[:10000]:  # Muestra de los primeros 10KB
        byte_counts[byte] = byte_counts.get(byte, 0) + 1
    
    unique_bytes = len(byte_counts)
    print(f"Bytes únicos en muestra: {unique_bytes}/256")
    
    # Si todos los bytes aparecen, probablemente está cifrado/comprimido
    if unique_bytes > 250:
        print("Alta entropía - probablemente cifrado o comprimido")
    
    # Buscar patrones repetitivos
    pattern_4bytes = data[:4]
    occurrences = data.count(pattern_4bytes)
    print(f"El patrón {pattern_4bytes.hex()} aparece {occurrences} veces")
    
    # Intentar XOR con claves simples
    print("\nProbando XOR con claves simples...")
    test_data = data[:1000]
    
    for key in [0x41, 0x42, 0x43, 0x44, 0x45, 0xFF, 0xAA, 0x55]:
        decoded = bytes([b ^ key for b in test_data[:100]])
        if b'flag' in decoded.lower() or b'FLAG' in decoded:
            print(f"¡Posible decodificación con XOR 0x{key:02X}!")
            print(f"Resultado: {decoded[:50]}")

def check_dlls():
    print("\n=== Analizando DLLs ===")
    dlls = ['alibabacloud-oss-cpp-sdk.dll', 'cpr.dll', 'acproxy.dll']
    
    for dll in dlls:
        if os.path.exists(dll):
            with open(dll, 'rb') as f:
                dll_data = f.read(100000)  # Primeros 100KB
            
            if b'send' in dll_data or b'recv' in dll_data or b'connect' in dll_data:
                print(f"{dll}: Contiene funciones de red")
            
            # Buscar strings interesantes
            interesting = re.findall(b'[a-zA-Z0-9]{20,}', dll_data)
            if interesting:
                print(f"{dll}: Strings largos encontrados (posibles claves/tokens)")

def search_config_files():
    print("\n=== Buscando archivos de configuración ===")
    
    # Revisar archivos JSON
    json_files = ['install_profile.json']
    for jf in json_files:
        if os.path.exists(jf):
            with open(jf, 'r') as f:
                content = f.read()
                if content:
                    print(f"{jf}: {content[:200]}")
                else:
                    print(f"{jf}: Archivo vacío")
    
    # Revisar el keystore
    if os.path.exists('lekeystore.jks'):
        with open('lekeystore.jks', 'rb') as f:
            ks_data = f.read()
        print(f"lekeystore.jks: {len(ks_data)} bytes")
        if b'flag' in ks_data.lower() or b'FLAG' in ks_data:
            print("¡El keystore podría contener información importante!")

if __name__ == "__main__":
    analyze_exe()
    analyze_data_file()
    check_dlls()
    search_config_files()