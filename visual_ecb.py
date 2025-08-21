#!/usr/bin/env python3

from collections import Counter

BLOCK_SIZE = 16

def parse_header_ppm(data):
    header = b""
    for i in range(3):
        idx = data.index(b'\n')
        header += data[:idx + 1]
        data = data[idx + 1:]
    return header, data

def create_visual_attack(ct):
    # Dividir en bloques
    blocks = [ct[i * BLOCK_SIZE:(i+1) * BLOCK_SIZE] for i in range(len(ct) // BLOCK_SIZE)]
    
    # Contar frecuencias
    block_counts = Counter(blocks)
    most_common = block_counts.most_common()
    
    # El más común es el fondo
    background = most_common[0][0]
    
    print(f"[*] Bloque de fondo aparece {block_counts[background]} veces")
    print(f"[*] Total de bloques únicos: {len(block_counts)}")
    
    # Estrategia 1: Reemplazar fondo con blanco puro, resto con negro
    attack1 = []
    white = b'\xFF' * BLOCK_SIZE
    black = b'\x00' * BLOCK_SIZE
    
    for block in blocks:
        if block == background:
            attack1.append(white)
        else:
            attack1.append(black)
    
    # Estrategia 2: Gradiente según frecuencia
    attack2 = []
    for block in blocks:
        freq = block_counts[block]
        if freq > 1000:
            # Muy común = blanco
            attack2.append(b'\xFF' * BLOCK_SIZE)
        elif freq > 100:
            # Común = gris claro
            attack2.append(b'\xC0' * BLOCK_SIZE)
        elif freq > 10:
            # Poco común = gris
            attack2.append(b'\x80' * BLOCK_SIZE)
        elif freq > 1:
            # Raro = gris oscuro
            attack2.append(b'\x40' * BLOCK_SIZE)
        else:
            # Único = negro
            attack2.append(b'\x00' * BLOCK_SIZE)
    
    # Estrategia 3: Solo mostrar bloques raros (frecuencia < 10)
    attack3 = []
    for block in blocks:
        if block_counts[block] < 10:
            attack3.append(block)  # Mantener original
        else:
            attack3.append(white)  # Fondo blanco
    
    # Estrategia 4: Resaltar segundo bloque más común
    if len(most_common) > 1:
        second = most_common[1][0]
        attack4 = []
        for block in blocks:
            if block == background:
                attack4.append(white)
            elif block == second:
                attack4.append(b'\x7F' * BLOCK_SIZE)  # Gris medio
            else:
                attack4.append(black)
    else:
        attack4 = attack1
    
    # Estrategia 5: Invertir colores
    attack5 = []
    for block in blocks:
        if block == background:
            attack5.append(black)
        else:
            attack5.append(white)
    
    return [
        ("binary_contrast", b"".join(attack1)),
        ("frequency_gradient", b"".join(attack2)),
        ("rare_blocks_only", b"".join(attack3)),
        ("second_common_highlight", b"".join(attack4)),
        ("inverted", b"".join(attack5))
    ]

def main():
    # Leer archivo ECB
    with open('body.ecb.ppm', 'rb') as f:
        data = f.read()
    
    header, ct_ecb = parse_header_ppm(data)
    
    print("[+] Generando ataques visuales ECB...")
    attacks = create_visual_attack(ct_ecb)
    
    for name, modified in attacks:
        filename = f"visual_{name}.ppm"
        with open(filename, 'wb') as fw:
            fw.write(header)
            fw.write(modified)
        print(f"[+] Creado: {filename}")
    
    print("\n[*] Los archivos PPM pueden abrirse con cualquier visor de imágenes")
    print("[*] El flag debería ser visible en alguna de las variantes")

if __name__ == "__main__":
    main()