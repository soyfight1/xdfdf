#!/usr/bin/env python3

def parse_header_ppm(data):
    header = b""
    for i in range(3):
        idx = data.index(b'\n')
        header += data[:idx + 1]
        data = data[idx + 1:]
    return header, data

def extract_text_region():
    with open("visual_binary_contrast.ppm", 'rb') as f:
        data = f.read()
    
    header, pixels = parse_header_ppm(data)
    
    width = 1895
    height = 820
    
    print("[*] Extrayendo región de texto (filas 355-400)")
    print("[*] Generando arte ASCII del flag...")
    print("="*100)
    
    # Extraer las filas con el texto
    for y in range(355, 400):
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        
        # Convertir a ASCII art con mejor resolución
        row_ascii = ""
        
        # Muestrear cada 3 píxeles para mejor legibilidad
        for x in range(0, width, 3):
            pos = x * 3
            if pos < len(row_data):
                val = row_data[pos]
                
                # Usar diferentes caracteres para mejor contraste
                if val < 50:
                    row_ascii += '#'
                elif val < 100:
                    row_ascii += '@'
                elif val < 150:
                    row_ascii += '*'
                elif val < 200:
                    row_ascii += '.'
                else:
                    row_ascii += ' '
        
        # Imprimir solo si hay contenido
        if '#' in row_ascii or '@' in row_ascii:
            print(row_ascii)
    
    print("="*100)
    
    # Intentar otra representación más compacta
    print("\n[*] Vista compacta (1 char = 6 píxeles):")
    print("="*100)
    
    for y in range(355, 400):
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        row_ascii = ""
        
        for x in range(0, width, 6):
            pos = x * 3
            if pos < len(row_data):
                val = row_data[pos]
                row_ascii += '█' if val < 128 else ' '
        
        if '█' in row_ascii:
            print(row_ascii)
    
    print("="*100)
    
    # Vista ultra-compacta para ver el patrón completo
    print("\n[*] Vista ultra-compacta (1 char = 12 píxeles):")
    print("="*100)
    
    for y in range(350, 405):
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        row_ascii = ""
        
        for x in range(0, width, 12):
            pos = x * 3
            if pos < len(row_data):
                # Contar píxeles oscuros en este segmento
                dark_count = 0
                for i in range(12):
                    check_pos = (x + i) * 3
                    if check_pos < len(row_data) and row_data[check_pos] < 128:
                        dark_count += 1
                
                if dark_count > 8:
                    row_ascii += '█'
                elif dark_count > 4:
                    row_ascii += '▓'
                elif dark_count > 0:
                    row_ascii += '░'
                else:
                    row_ascii += ' '
        
        if any(c in '█▓░' for c in row_ascii):
            print(f"{y:3d}: {row_ascii}")

if __name__ == "__main__":
    extract_text_region()