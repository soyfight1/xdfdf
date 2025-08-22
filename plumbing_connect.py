#!/usr/bin/env python3
import socket
import re

print("=" * 60)
print("RESOLVIENDO PLUMBING")
print("=" * 60)

host = "jupiter.challenges.picoctf.org"
port = 4427

print(f"\n[1] Conectando a {host}:{port}...")

try:
    # Crear socket y conectar
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(10)
    s.connect((host, port))
    
    print("[2] Conexión establecida. Recibiendo datos...")
    
    # Recibir datos
    all_data = b""
    while True:
        try:
            chunk = s.recv(4096)
            if not chunk:
                break
            all_data += chunk
            # Si ya tenemos mucho data, parar
            if len(all_data) > 100000:
                break
        except socket.timeout:
            break
    
    s.close()
    
    # Convertir a string
    data_str = all_data.decode('utf-8', errors='ignore')
    
    print(f"[3] Recibidos {len(all_data)} bytes")
    
    # Buscar la flag
    print("\n[4] Buscando la flag...")
    
    # Patrón para buscar picoCTF{...}
    flag_pattern = r'picoCTF\{[^}]+\}'
    matches = re.findall(flag_pattern, data_str)
    
    if matches:
        print("\n✓ FLAG ENCONTRADA:")
        for match in matches:
            print(f"  {match}")
    else:
        print("\n✗ No se encontró la flag en el formato esperado")
        print("\n[5] Buscando patrones alternativos...")
        
        # Buscar líneas que contengan "pico"
        lines = data_str.split('\n')
        pico_lines = [line for line in lines if 'pico' in line.lower()]
        
        if pico_lines:
            print(f"\nLíneas con 'pico' ({len(pico_lines)} encontradas):")
            for line in pico_lines[:10]:  # Mostrar máximo 10
                print(f"  {line[:100]}")  # Máximo 100 chars por línea
        
        # Mostrar las primeras y últimas líneas
        print("\n[6] Primeras 10 líneas:")
        for line in lines[:10]:
            if line.strip():
                print(f"  {line[:100]}")
        
        print("\n[7] Últimas 10 líneas:")
        for line in lines[-10:]:
            if line.strip():
                print(f"  {line[:100]}")
    
    # Guardar todo el output para análisis
    with open('/workspace/plumbing_output.txt', 'w') as f:
        f.write(data_str)
    print(f"\n[8] Output completo guardado en plumbing_output.txt")
    
except Exception as e:
    print(f"\n✗ Error: {e}")
    print("\nIntentando método alternativo...")

print("\n" + "=" * 60)