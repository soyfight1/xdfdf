#!/usr/bin/env python3

import binascii
from collections import Counter
import random

BLOCK_SIZE = 16

def parse_header_ppm(data):
    header = b""
    for i in range(3):
        idx = data.index(b'\n')
        header += data[:idx + 1]
        data = data[idx + 1:]
    return header, data

def ecb_block_analysis(ct):
    # Dividir en bloques
    blocks = [ct[i * BLOCK_SIZE:(i+1) * BLOCK_SIZE] for i in range(len(ct) // BLOCK_SIZE)]
    
    # Contar frecuencia de bloques
    block_counts = Counter(blocks)
    
    # Obtener los bloques más comunes
    most_common = block_counts.most_common(10)
    
    print("[*] Top 10 bloques más frecuentes:")
    for i, (block, count) in enumerate(most_common):
        print(f"    {i+1}. {binascii.hexlify(block)[:32].decode()}... : {count} veces ({100.0*count/len(blocks):.1f}%)")
    
    return blocks, block_counts, most_common

def swap_blocks_attack(blocks, block_counts, most_common):
    # El bloque más común probablemente es el fondo
    background_block = most_common[0][0]
    
    # Crear múltiples variantes intercambiando bloques
    attacks = []
    
    # Ataque 1: Reemplazar el fondo con negro (todos 0)
    attack1 = []
    for block in blocks:
        if block == background_block:
            attack1.append(b'\x00' * BLOCK_SIZE)
        else:
            attack1.append(block)
    attacks.append(("null_background", b"".join(attack1)))
    
    # Ataque 2: Reemplazar el fondo con el segundo bloque más común
    if len(most_common) > 1:
        second_block = most_common[1][0]
        attack2 = []
        for block in blocks:
            if block == background_block:
                attack2.append(second_block)
            else:
                attack2.append(block)
        attacks.append(("swap_common", b"".join(attack2)))
    
    # Ataque 3: Invertir - reemplazar todo lo que NO es fondo con el fondo
    attack3 = []
    for block in blocks:
        if block != background_block:
            attack3.append(background_block)
        else:
            attack3.append(block)
    attacks.append(("inverted", b"".join(attack3)))
    
    # Ataque 4: Eliminar el fondo (reemplazar con bloque aleatorio único)
    unique_blocks = [b for b in block_counts.keys() if block_counts[b] == 1]
    if unique_blocks:
        random_unique = random.choice(unique_blocks)
        attack4 = []
        for block in blocks:
            if block == background_block:
                attack4.append(random_unique)
            else:
                attack4.append(block)
        attacks.append(("unique_background", b"".join(attack4)))
    
    # Ataque 5: Patrón de tablero de ajedrez con los dos bloques más comunes
    if len(most_common) > 1:
        second_block = most_common[1][0]
        attack5 = []
        use_second = False
        for block in blocks:
            if block == background_block:
                attack5.append(second_block if use_second else background_block)
                use_second = not use_second
            else:
                attack5.append(block)
        attacks.append(("chess_pattern", b"".join(attack5)))
    
    return attacks

def main():
    # Leer el archivo ECB
    with open('body.ecb.ppm', 'rb') as f:
        data = f.read()
    
    header, ct_ecb = parse_header_ppm(data)
    
    print(f"[+] Analizando {len(ct_ecb)} bytes de datos ECB")
    print(f"[+] Header: {header}")
    
    # Análisis de bloques
    blocks, block_counts, most_common = ecb_block_analysis(ct_ecb)
    
    # Realizar ataques de intercambio
    print("\n[*] Generando ataques de manipulación ECB...")
    attacks = swap_blocks_attack(blocks, block_counts, most_common)
    
    # Guardar todas las variantes
    for name, modified_ct in attacks:
        filename = f"attack_{name}.ppm"
        with open(filename, 'wb') as fw:
            fw.write(header)
            fw.write(modified_ct)
        print(f"[+] Generado: {filename}")
    
    # Análisis adicional: buscar patrones
    print("\n[*] Buscando patrones en posiciones de bloques únicos...")
    unique_positions = []
    for i, block in enumerate(blocks):
        if block_counts[block] == 1:
            unique_positions.append(i)
    
    if unique_positions:
        print(f"[!] Encontrados {len(unique_positions)} bloques únicos en posiciones:")
        print(f"    Primeros 10: {unique_positions[:10]}")
        
        # Los bloques únicos podrían formar el texto/flag
        # Crear imagen solo con bloques únicos
        unique_only = []
        for i, block in enumerate(blocks):
            if block_counts[block] <= 5:  # Bloques raros
                unique_only.append(block)
            else:
                unique_only.append(most_common[0][0])
        
        with open('attack_unique_only.ppm', 'wb') as fw:
            fw.write(header)
            fw.write(b"".join(unique_only))
        print("[+] Generado: attack_unique_only.ppm (solo bloques únicos/raros)")

if __name__ == "__main__":
    main()