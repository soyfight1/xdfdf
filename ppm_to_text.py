#!/usr/bin/env python3

def parse_header_ppm(data):
    header = b""
    for i in range(3):
        idx = data.index(b'\n')
        header += data[:idx + 1]
        data = data[idx + 1:]
    return header, data

def ppm_to_ascii_art(filename, threshold=128):
    """Convierte PPM a arte ASCII para ver el contenido"""
    with open(filename, 'rb') as f:
        data = f.read()
    
    header, pixels = parse_header_ppm(data)
    
    # Parsear dimensiones del header
    lines = header.decode().strip().split('\n')
    width, height = map(int, lines[1].split())
    
    print(f"[*] Procesando {filename}: {width}x{height}")
    
    # Convertir a matriz de píxeles
    ascii_art = []
    
    # Reducir resolución para que sea legible
    sample_rate = 8  # Tomar 1 de cada 8 píxeles
    
    for y in range(0, height, sample_rate):
        row = []
        for x in range(0, width, sample_rate):
            # Posición en el array de bytes
            pos = (y * width + x) * 3
            
            if pos + 2 < len(pixels):
                # Obtener valor RGB
                r, g, b = pixels[pos], pixels[pos+1], pixels[pos+2]
                
                # Promedio para escala de grises
                gray = (r + g + b) // 3
                
                # Convertir a carácter ASCII
                if gray > 200:
                    row.append(' ')
                elif gray > 150:
                    row.append('.')
                elif gray > 100:
                    row.append('o')
                elif gray > 50:
                    row.append('O')
                else:
                    row.append('#')
        
        if row:
            ascii_art.append(''.join(row))
    
    return ascii_art

def main():
    # Procesar las imágenes generadas
    files = [
        "visual_binary_contrast.ppm",
        "visual_inverted.ppm",
        "visual_rare_blocks_only.ppm"
    ]
    
    for filename in files:
        print(f"\n{'='*80}")
        print(f"[+] {filename}")
        print('='*80)
        
        try:
            art = ppm_to_ascii_art(filename)
            
            # Mostrar las líneas que tienen contenido (no solo espacios)
            content_lines = []
            for i, line in enumerate(art):
                if not all(c in ' .' for c in line):
                    content_lines.append((i, line))
            
            if content_lines:
                print(f"[*] Líneas con contenido: {len(content_lines)}")
                
                # Mostrar región central donde probablemente esté el flag
                start = max(0, len(content_lines)//2 - 10)
                end = min(len(content_lines), start + 20)
                
                for i, line in content_lines[start:end]:
                    print(line)
                
                # Buscar patrones que parezcan texto
                for i, line in content_lines:
                    # Buscar secuencias de caracteres oscuros que podrían ser letras
                    dark_sequences = []
                    current = ""
                    for c in line:
                        if c in '#O':
                            current += c
                        else:
                            if len(current) > 3:
                                dark_sequences.append(current)
                            current = ""
                    
                    if dark_sequences:
                        print(f"[!] Línea {i} tiene patrones: {dark_sequences[:5]}")
            
        except Exception as e:
            print(f"[!] Error procesando {filename}: {e}")
    
    # Análisis adicional del contraste binario
    print("\n" + "="*80)
    print("[*] Análisis detallado de visual_binary_contrast.ppm")
    print("="*80)
    
    with open("visual_binary_contrast.ppm", 'rb') as f:
        data = f.read()
    
    header, pixels = parse_header_ppm(data)
    
    # Buscar transiciones negro->blanco que podrían formar letras
    width = 1895
    height = 820
    
    # Escanear por filas buscando patrones
    for y in range(height):
        row_data = pixels[y * width * 3:(y + 1) * width * 3]
        
        # Contar transiciones en la fila
        transitions = 0
        prev = row_data[0] if row_data else 0
        
        for i in range(0, len(row_data), 3):
            curr = row_data[i]
            if (prev < 128 and curr >= 128) or (prev >= 128 and curr < 128):
                transitions += 1
            prev = curr
        
        # Las filas con texto tendrán muchas transiciones
        if transitions > 50:
            print(f"[!] Fila {y} tiene {transitions} transiciones (posible texto)")
            
            # Crear representación ASCII de esta fila
            row_ascii = ""
            for x in range(0, min(width, 200)):  # Primeros 200 píxeles
                pos = (y * width + x) * 3
                if pos < len(pixels):
                    val = pixels[pos]
                    row_ascii += '#' if val < 128 else ' '
            
            if '###' in row_ascii:  # Si hay secuencias oscuras
                print(f"    Vista parcial: {row_ascii[:100]}")

if __name__ == "__main__":
    main()