#!/usr/bin/env python3

import binascii
from collections import Counter

BLOCK_SIZE = 16

def parse_header_ppm(data):
    header = b""
    for i in range(3):
        idx = data.index(b'\n')
        header += data[:idx + 1]
        data = data[idx + 1:]
    return header, data

def analyze_ecb_for_flag(ct):
    # Dividir en bloques
    blocks = [ct[i * BLOCK_SIZE:(i+1) * BLOCK_SIZE] for i in range(len(ct) // BLOCK_SIZE)]
    
    # Contar frecuencia
    block_counts = Counter(blocks)
    
    # Obtener el bloque más común (fondo)
    background = block_counts.most_common(1)[0][0]
    
    print(f"[*] Total bloques: {len(blocks)}")
    print(f"[*] Bloque de fondo: {binascii.hexlify(background)[:32].decode()}...")
    print(f"[*] Aparece {block_counts[background]} veces")
    
    # Imagen PPM: 1895 x 820 píxeles
    # Cada píxel = 3 bytes (RGB)
    # Total píxeles = 1,553,900
    # Bytes por fila = 1895 * 3 = 5685
    width = 1895
    height = 820
    bytes_per_pixel = 3
    bytes_per_row = width * bytes_per_pixel
    blocks_per_row = bytes_per_row // BLOCK_SIZE + (1 if bytes_per_row % BLOCK_SIZE else 0)
    
    print(f"\n[*] Dimensiones imagen: {width}x{height}")
    print(f"[*] Bytes por fila: {bytes_per_row}")
    print(f"[*] Bloques por fila: {blocks_per_row}")
    
    # Crear mapa visual ASCII
    print("\n[*] Mapa de bloques no-fondo (X = no-fondo, . = fondo):")
    
    visual_map = []
    for i in range(0, min(len(blocks), 5000), blocks_per_row):  # Primeras filas
        row = []
        for j in range(min(blocks_per_row, len(blocks) - i)):
            if i + j < len(blocks):
                if blocks[i + j] != background:
                    row.append('X')
                else:
                    row.append('.')
        if row and 'X' in row:  # Solo mostrar filas con contenido
            visual_map.append(''.join(row))
    
    # Mostrar las filas con contenido
    for row in visual_map[:50]:  # Primeras 50 filas con contenido
        print(row)
    
    # Buscar patrones en bloques consecutivos no-fondo
    print("\n[*] Analizando secuencias de bloques no-fondo...")
    
    sequences = []
    current_seq = []
    
    for i, block in enumerate(blocks):
        if block != background:
            current_seq.append((i, block))
        else:
            if current_seq:
                sequences.append(current_seq)
                current_seq = []
    
    if current_seq:
        sequences.append(current_seq)
    
    print(f"[*] Encontradas {len(sequences)} secuencias de bloques no-fondo")
    
    # Analizar las secuencias más largas
    sequences.sort(key=lambda x: len(x), reverse=True)
    
    for i, seq in enumerate(sequences[:5]):
        print(f"\n[*] Secuencia {i+1}: {len(seq)} bloques")
        print(f"    Posiciones: {seq[0][0]} - {seq[-1][0]}")
        print(f"    Fila aprox: {seq[0][0] // blocks_per_row}")
        
        # Ver si hay texto ASCII en los bloques
        combined = b"".join([b[1] for b in seq])
        printable = ""
        for byte in combined:
            if 32 <= byte <= 126:
                printable += chr(byte)
            else:
                printable += "."
        
        if any(c in printable for c in "picoCTF{}"):
            print(f"    [!] POSIBLE FLAG DETECTADO: {printable[:100]}")
    
    # Buscar específicamente patrones de texto
    print("\n[*] Buscando patrones de texto en bloques únicos...")
    
    unique_blocks = [b for b in block_counts.keys() if block_counts[b] <= 10]
    
    # Concatenar todos los bloques únicos
    all_unique = b"".join(unique_blocks)
    
    # Buscar strings ASCII
    ascii_strings = []
    current_string = ""
    
    for byte in all_unique:
        if 32 <= byte <= 126:
            current_string += chr(byte)
        else:
            if len(current_string) > 4:
                ascii_strings.append(current_string)
            current_string = ""
    
    if current_string and len(current_string) > 4:
        ascii_strings.append(current_string)
    
    print(f"[*] Strings ASCII encontrados en bloques únicos:")
    for s in ascii_strings[:20]:
        print(f"    {s}")
        if "pico" in s.lower() or "ctf" in s.lower() or "flag" in s.lower():
            print(f"    [!!!] POSIBLE FLAG: {s}")
    
    # Análisis más agresivo: buscar en TODOS los datos
    print("\n[*] Búsqueda exhaustiva de patrones picoCTF...")
    
    full_data = b"".join(blocks)
    
    # Buscar "picoCTF" en diferentes encodings
    patterns = [
        b"picoCTF",
        b"PICOCTF",
        b"pico",
        b"CTF{",
        b"flag",
        b"FLAG"
    ]
    
    for pattern in patterns:
        if pattern in full_data:
            idx = full_data.index(pattern)
            context = full_data[max(0, idx-50):min(len(full_data), idx+100)]
            
            printable = ""
            for byte in context:
                if 32 <= byte <= 126:
                    printable += chr(byte)
                else:
                    printable += f"[{byte:02x}]"
            
            print(f"\n[!!!] Patrón '{pattern.decode()}' encontrado:")
            print(f"      Contexto: {printable}")

if __name__ == "__main__":
    # Leer el archivo ECB
    with open('body.ecb.ppm', 'rb') as f:
        data = f.read()
    
    header, ct_ecb = parse_header_ppm(data)
    
    analyze_ecb_for_flag(ct_ecb)