#!/usr/bin/env python3

def parse_header_ppm(data):
    header = b""
    for i in range(3):
        idx = data.index(b'\n')
        header += data[:idx + 1]
        data = data[idx + 1:]
    return header, data

def extract_flag():
    with open("visual_binary_contrast.ppm", 'rb') as f:
        data = f.read()
    
    header, pixels = parse_header_ppm(data)
    
    width = 1895
    height = 820
    
    print("[*] Extrayendo texto de filas 350-405 con alta resolución")
    print("="*150)
    
    # Procesar cada fila en el rango del texto
    for y in range(350, 405):
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        
        # Crear línea de texto con resolución 1:1 para los primeros 600 píxeles
        # donde parece estar el flag
        row_text = ""
        
        for x in range(600):  # Solo los primeros 600 píxeles
            pos = x * 3
            if pos < len(row_data):
                val = row_data[pos]
                # Usar caracteres más densos para mejor contraste
                if val < 128:
                    row_text += '█'
                else:
                    row_text += ' '
        
        # Imprimir si hay contenido
        if '█' in row_text:
            # Comprimir horizontalmente para legibilidad (2 píxeles = 1 char)
            compressed = ""
            for i in range(0, len(row_text), 2):
                if i+1 < len(row_text):
                    if row_text[i] == '█' or row_text[i+1] == '█':
                        compressed += '█'
                    else:
                        compressed += ' '
            
            print(compressed)
    
    print("="*150)
    
    # Ahora intentar con caracteres ASCII diferentes para mejor legibilidad
    print("\n[*] Vista con gradiente de caracteres:")
    print("="*150)
    
    chars = ['█', '▓', '▒', '░', ' ']
    
    for y in range(355, 395):
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        row_text = ""
        
        # Muestrear cada 3 píxeles
        for x in range(0, min(1800, width), 3):
            pos = x * 3
            if pos < len(row_data):
                # Contar píxeles oscuros en ventana de 3
                dark_count = 0
                for offset in range(3):
                    check_pos = (x + offset) * 3
                    if check_pos < len(row_data) and row_data[check_pos] < 128:
                        dark_count += 1
                
                # Mapear a carácter según densidad
                if dark_count == 3:
                    row_text += '█'
                elif dark_count == 2:
                    row_text += '▓'
                elif dark_count == 1:
                    row_text += '░'
                else:
                    row_text += ' '
        
        if any(c != ' ' for c in row_text):
            print(row_text)

if __name__ == "__main__":
    extract_flag()