#!/usr/bin/env python3

import math
import binascii

BLOCK_SIZE = 16
UMAX = int(math.pow(256, BLOCK_SIZE))

def to_bytes(n):
    # Convertir número a bytes
    hex_str = hex(n)[2:].rstrip('L')
    if len(hex_str) % 2 != 0:
        hex_str = '0' + hex_str
    
    decoded = bytes.fromhex(hex_str)
    
    # Padding
    pad = (len(decoded) % BLOCK_SIZE)
    if pad != 0:
        decoded = b"\0" * (BLOCK_SIZE - pad) + decoded
    return decoded

def remove_line(s):
    idx = s.index(b'\n')
    return s[:idx + 1], s[idx + 1:]

def parse_header_ppm(data):
    header = b""
    
    for i in range(3):
        header_i, data = remove_line(data)
        header += header_i
    
    return header, data

def decrypt_abc(ct_abc):
    # Dividir en bloques
    blocks = [ct_abc[i * BLOCK_SIZE:(i+1) * BLOCK_SIZE] for i in range(len(ct_abc) // BLOCK_SIZE)]
    
    print(f"[*] Total bloques: {len(blocks)}")
    print(f"[*] IV (primer bloque): {binascii.hexlify(blocks[0])[:32]}...")
    
    # El primer bloque es el IV
    decrypted_blocks = [blocks[0]]
    
    # Revertir la operación ABC
    for i in range(1, len(blocks)):
        prev_blk = int(binascii.hexlify(blocks[i-1]), 16)
        curr_blk = int(binascii.hexlify(blocks[i]), 16)
        
        # Revertir: original = (current - previous) % UMAX
        original_blk = (curr_blk - prev_blk) % UMAX
        decrypted_blocks.append(to_bytes(original_blk))
    
    # Quitar el IV del resultado
    return b"".join(decrypted_blocks[1:])

if __name__ == "__main__":
    # Leer archivo cifrado
    with open('body.enc.ppm', 'rb') as f:
        data = f.read()
    
    header, ct_abc = parse_header_ppm(data)
    
    print(f"[+] Header PPM: {header[:50]}...")
    print(f"[+] Tamaño datos cifrados: {len(ct_abc)} bytes")
    
    # Descifrar ABC
    ct_ecb = decrypt_abc(ct_abc)
    
    # Guardar resultado ECB
    with open('body.ecb.ppm', 'wb') as fw:
        fw.write(header)
        fw.write(ct_ecb)
    
    print("[+] ABC descifrado -> body.ecb.ppm")
    print("[+] Ahora el archivo está en AES-ECB puro")
    print("[!] ECB es vulnerable a ataques de análisis de patrones")
    
    # Análisis rápido de bloques repetidos
    blocks_ecb = [ct_ecb[i * BLOCK_SIZE:(i+1) * BLOCK_SIZE] for i in range(len(ct_ecb) // BLOCK_SIZE)]
    unique_blocks = len(set(blocks_ecb))
    total_blocks = len(blocks_ecb)
    
    print(f"[!] Bloques únicos: {unique_blocks}/{total_blocks} ({100.0 * unique_blocks / total_blocks:.1f}%)")
    print(f"[!] Bloques repetidos: {total_blocks - unique_blocks} (vulnerabilidad ECB confirmada)")