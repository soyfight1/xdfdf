#!/usr/bin/env python3

import struct

# Datos hardcodeados del binario
data = bytearray()
data.extend(struct.pack('<Q', 0x617b2375f81ea7e1))
data.extend(struct.pack('<Q', 0xd269df5b5afc9db9))
data.extend(struct.pack('<Q', 0xf467edf4ed1bfed2)[:3])  # Solo 3 bytes del último

print(f"Encrypted data length: {len(data)} bytes")
print(f"Encrypted data (hex): {data.hex()}")
print(f"Encrypted data (partial ASCII): {repr(data)}")

# Basándome en el análisis del desensamblado:
# La función verifica cada bit de cada byte usando shifts y XOR
# El patrón parece ser una operación XOR simple con transformación de bits

# Debug info: u:877492 e:? p:? c:458 i:296160
# Convirtiendo a hex: u:0xD6634 c:0x1CA i:0x485A0

# Intentar decodificar con XOR simple
def try_xor(data, key):
    result = bytearray()
    for i, byte in enumerate(data):
        result.append(byte ^ (key & 0xFF))
    return result

# Probar diferentes claves XOR
print("\nProbando diferentes métodos de decodificación:")

# Método 1: XOR con cada byte de posición
flag = bytearray()
for i in range(len(data)):
    # El código hace operaciones con (7 - pos) para shifts
    # Intentar revertir la lógica
    for test_char in range(256):
        # Simular la verificación del binario
        mask1 = 1 << (7 - (i % 8))
        mask2 = 1 << (7 - ((i // 8) % 8))
        
        encrypted_bit = (data[i] & mask1) > 0
        test_bit = (test_char & mask2) > 0
        
        if encrypted_bit ^ test_bit == 0:
            flag.append(test_char)
            break

# Método 2: Interpretación directa con transformación de bits
flag2 = bytearray()
ec = 0  # contador de caracteres
e8 = 0  # contador de bits

for char_idx in range(27):  # 27 caracteres esperados
    result_char = 0
    for bit_pos in range(8):
        # Calcular máscaras según el código
        mask1 = 1 << (7 - bit_pos)
        mask2 = 1 << (7 - e8)
        
        # Obtener bit del dato cifrado
        if char_idx < len(data):
            encrypted_bit = (data[char_idx] & mask1) > 0
            
            # El bit del resultado debe hacer que el XOR sea 0
            # encrypted_bit XOR result_bit = 0
            # Por lo tanto: result_bit = encrypted_bit
            if encrypted_bit:
                result_char |= mask2
        
        e8 += 1
        if e8 == 8:
            e8 = 0
    
    flag2.append(result_char)

# Método 3: Fuerza bruta inteligente basada en el patrón picoCTF
print("\nMétodo 3: Análisis de patrones")

# Sabemos que debe empezar con "picoCTF{" y terminar con "}"
known_prefix = b"picoCTF{"
known_suffix = b"}"

# XOR los primeros 8 bytes con el prefijo conocido
xor_key = bytearray()
for i in range(len(known_prefix)):
    xor_key.append(data[i] ^ known_prefix[i])

print(f"XOR key pattern: {xor_key.hex()}")

# Aplicar XOR simple
flag3 = bytearray()
for i in range(len(data)):
    flag3.append(data[i] ^ xor_key[i % len(xor_key)])

print(f"\nPosible flag 1: {flag}")
print(f"Posible flag 2: {flag2}")
print(f"Posible flag 3: {flag3}")

# Método 4: Revertir la lógica exacta del binario
print("\nMétodo 4: Reversión exacta de la lógica")

def decrypt_perplexed(encrypted_data):
    result = []
    ec = 0  # -0x14(%rbp)
    e8 = 0  # -0x18(%rbp)
    e4 = 0  # -0x1c(%rbp)
    
    while ec < 27:  # Longitud esperada
        char_result = 0
        for e0 in range(8):  # -0x20(%rbp)
            if e8 == 0:
                e8 = 1
            
            # Calcular máscaras
            shift1 = 7 - e0
            shift2 = 7 - e8
            mask1 = 1 << shift1
            mask2 = 1 << shift2
            
            # Obtener bit cifrado
            if e4 < len(encrypted_data):
                encrypted_bit = (encrypted_data[e4] & mask1) != 0
                
                # Para que el XOR sea 0, necesitamos el mismo bit
                if encrypted_bit:
                    char_result |= mask2
            
            e8 += 1
            if e8 == 8:
                e8 = 0
                ec += 1
                if ec < 27:
                    result.append(char_result)
                    char_result = 0
        
        e4 += 1
    
    return bytes(result)

flag4 = decrypt_perplexed(data)
print(f"Posible flag 4: {flag4}")

# Intentar todas las combinaciones posibles
print("\nBuscando patrones ASCII válidos...")
for i in range(len(data) - 6):
    chunk = data[i:i+7]
    if all(32 <= b <= 126 for b in chunk):
        print(f"ASCII en offset {i}: {chunk}")