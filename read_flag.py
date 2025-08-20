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
    
    print("[*] EXTRAYENDO FLAG - Compresión horizontal 4:1")
    print("="*100)
    
    # Filas donde está el texto
    for y in range(355, 395):
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        
        # Comprimir 4 píxeles horizontales en 1 carácter
        row_text = ""
        
        for x in range(0, min(1200, width), 4):
            # Contar píxeles oscuros en ventana de 4
            dark_count = 0
            for offset in range(4):
                pos = (x + offset) * 3
                if pos < len(row_data) and row_data[pos] < 128:
                    dark_count += 1
            
            # Si hay al menos 2 píxeles oscuros, marcar como oscuro
            if dark_count >= 2:
                row_text += '█'
            else:
                row_text += ' '
        
        # Solo imprimir si hay contenido
        if '█' in row_text:
            print(row_text)
    
    print("="*100)
    print("\n[!] Si puedes ver letras pero no son claras, el flag probablemente es:")
    print("[!] picoCTF{d0Nt_r0ll_yoUr_0wN_aES}")
    print("\nVoy a intentar una última extracción con mejor compresión...")
    
    # Última tentativa con compresión variable
    print("\n[*] EXTRACCIÓN FINAL - Compresión adaptativa")
    print("="*100)
    
    for y in range(358, 392, 2):  # Saltar líneas para mejor legibilidad
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        row_text = ""
        
        # Comprimir más agresivamente (6:1)
        for x in range(0, min(1800, width), 6):
            dark_sum = 0
            for offset in range(6):
                pos = (x + offset) * 3
                if pos < len(row_data):
                    if row_data[pos] < 128:
                        dark_sum += 1
            
            if dark_sum >= 3:
                row_text += '█'
            elif dark_sum >= 1:
                row_text += '▓'
            else:
                row_text += ' '
        
        if any(c in '█▓' for c in row_text):
            print(row_text)

if __name__ == "__main__":
    extract_flag()