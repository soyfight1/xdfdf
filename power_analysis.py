#!/usr/bin/env python3
import socket
import time

# Sbox from the encrypt.py
Sbox = (
    0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
    0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
    0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
    0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
    0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
    0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
    0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
    0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
    0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
    0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
    0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
    0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
    0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
    0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
    0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
    0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16,
)

def query_server(plaintext_hex):
    """Consulta el servidor con un plaintext y obtiene la filtración"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('saturn.picoctf.net', 54532))
    time.sleep(0.1)
    
    # Recibir prompt
    s.recv(1024)
    
    # Enviar plaintext
    s.send((plaintext_hex + '\n').encode())
    time.sleep(0.1)
    
    # Recibir respuesta
    response = s.recv(1024).decode()
    s.close()
    
    # Extraer el número de la respuesta
    if 'leakage result:' in response:
        leak = int(response.split('leakage result:')[1].strip())
        return leak
    return None

def predict_leak_for_key(plaintext, key_candidate):
    """Predice cuántos 1s habría en los LSBs para una clave candidata"""
    leak_count = 0
    for i in range(16):
        sbox_out = Sbox[plaintext[i] ^ key_candidate[i]]
        if sbox_out & 0x01:
            leak_count += 1
    return leak_count

def find_key_byte(byte_position, known_key_bytes):
    """Encuentra un byte específico de la clave"""
    print(f"\n[+] Atacando byte {byte_position}...")
    
    # Crear múltiples plaintexts variando solo el byte objetivo
    candidates_scores = {}
    
    for test_value in range(0, 256, 16):  # Probar algunos valores
        # Crear plaintext con todos 0s excepto el byte objetivo
        plaintext = [0] * 16
        plaintext[byte_position] = test_value
        
        # Convertir a hex
        pt_hex = ''.join(f'{b:02x}' for b in plaintext)
        
        # Consultar servidor
        leak = query_server(pt_hex)
        if leak is None:
            continue
            
        print(f"  Test {test_value:02x}: leak = {leak}")
        
        # Para cada posible valor del byte de la clave
        for key_byte in range(256):
            # Crear clave candidata
            key_candidate = [0] * 16
            key_candidate[byte_position] = key_byte
            
            # Predecir filtración para esta clave
            expected_leak = 0
            sbox_out = Sbox[plaintext[byte_position] ^ key_byte]
            if sbox_out & 0x01:
                expected_leak = 1
            
            # Si coincide con la filtración observada, es candidato
            if byte_position == 0:  # Para el primer byte
                if expected_leak == leak:
                    if key_byte not in candidates_scores:
                        candidates_scores[key_byte] = 0
                    candidates_scores[key_byte] += 1
    
    # El byte con más coincidencias es probablemente el correcto
    if candidates_scores:
        best_byte = max(candidates_scores, key=candidates_scores.get)
        print(f"  Mejor candidato: {best_byte:02x} con score {candidates_scores[best_byte]}")
        return best_byte
    return None

print("=" * 60)
print("POWER ANALYSIS ATTACK")
print("=" * 60)

# Estrategia simplificada: usar plaintexts específicos
# Para cada byte, enviar plaintext con solo ese byte variando

recovered_key = []

# Método 1: Ataque byte por byte con plaintext controlado
for byte_pos in range(16):
    print(f"\n[+] Recuperando byte {byte_pos} de la clave...")
    
    # Usar múltiples queries para confirmar
    byte_candidates = {}
    
    # Probar con diferentes valores en la posición objetivo
    for trial in range(3):
        plaintext = [0] * 16
        plaintext[byte_pos] = trial * 85  # 0, 85, 170
        
        pt_hex = ''.join(f'{b:02x}' for b in plaintext)
        leak = query_server(pt_hex)
        
        if leak is not None:
            print(f"  Trial {trial}: plaintext[{byte_pos}]={plaintext[byte_pos]:02x}, leak={leak}")
            
            # Probar todos los posibles valores del byte de clave
            for key_byte in range(256):
                sbox_out = Sbox[plaintext[byte_pos] ^ key_byte]
                expected_bit = sbox_out & 0x01
                
                # Si solo este byte contribuye al leak
                if expected_bit == leak:
                    if key_byte not in byte_candidates:
                        byte_candidates[key_byte] = 0
                    byte_candidates[key_byte] += 1
    
    if byte_candidates:
        # Encontrar el candidato más frecuente
        best = max(byte_candidates, key=byte_candidates.get)
        recovered_key.append(best)
        print(f"  ✓ Byte {byte_pos} = {best:02x}")
    else:
        print(f"  ✗ No se pudo determinar byte {byte_pos}")
        recovered_key.append(0)

print("\n" + "=" * 60)
print("CLAVE RECUPERADA:")
key_hex = ''.join(f'{b:02x}' for b in recovered_key)
print(f"Hex: {key_hex}")
print(f"Flag: picoCTF{{{key_hex}}}")
print("=" * 60)