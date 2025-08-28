#!/usr/bin/env python3

import struct

# Los datos hardcodeados están en el stack local de la función check
# Tres valores de 64 bits más algunos bytes adicionales
encrypted = bytearray()
encrypted.extend(struct.pack('<Q', 0x617b2375f81ea7e1))  # -0x50(%rbp)
encrypted.extend(struct.pack('<Q', 0xd269df5b5afc9db9))  # -0x48(%rbp)  
encrypted.extend(struct.pack('<Q', 0xf467edf4ed1bfed2))  # -0x41(%rbp) - nota: offset -0x41, no -0x40
encrypted.append(0)  # Padding para completar

print(f"Encrypted buffer (hex): {encrypted.hex()}")
print(f"Encrypted buffer length: {len(encrypted)}")

# La función check verifica cada bit individualmente
# Usa dos contadores: uno para el byte actual (ec) y otro para el bit (e8)

def solve():
    password = []
    
    # Simular la lógica del check pero al revés
    ec = 0  # -0x14(%rbp) - contador de caracteres del password
    e8 = 0  # -0x18(%rbp) - contador de bits
    e4 = 0  # -0x1c(%rbp) - índice en el buffer cifrado
    
    while ec < 27:  # El password debe tener 27 caracteres (incluyendo newline)
        current_char = 0
        
        for e0 in range(8):  # -0x20(%rbp) - iterador de bits
            if e8 == 0:
                e8 = 1  # Primera vez, e8 se incrementa
            
            # Calcular las máscaras de bit
            mask1 = 1 << (7 - e0)      # Para el buffer cifrado
            mask2 = 1 << (7 - e8)      # Para el carácter del password
            
            # Obtener el bit del buffer cifrado
            if e4 < len(encrypted):
                encrypted_bit = bool(encrypted[e4] & mask1)
                
                # La verificación es: encrypted_bit XOR password_bit == 0
                # Por lo tanto: password_bit = encrypted_bit
                if encrypted_bit:
                    current_char |= mask2
            
            e8 += 1
            if e8 == 8:
                e8 = 0
                ec += 1
        
        password.append(current_char)
        e4 += 1
        
        if ec >= 27:
            break
    
    return bytes(password[:26])  # Sin el newline

# Intentar con diferentes interpretaciones
print("\n=== Solución 1: Interpretación directa ===")
flag1 = solve()
print(f"Flag: {flag1}")

# Otra interpretación: los contadores se usan de forma diferente
def solve2():
    result = []
    
    for i in range(27):
        char = 0
        for bit in range(8):
            # Índice en el buffer cifrado
            byte_idx = (i * 8 + bit) // 8
            bit_idx = 7 - ((i * 8 + bit) % 8)
            
            if byte_idx < len(encrypted):
                if encrypted[byte_idx] & (1 << bit_idx):
                    char |= (1 << (7 - bit))
        
        result.append(char)
    
    return bytes(result[:26])

print("\n=== Solución 2: Mapeo directo de bits ===")
flag2 = solve2()
print(f"Flag: {flag2}")

# Interpretación 3: La lógica real del binario
def solve3():
    result = []
    ec = 0  # Contador de caracteres procesados
    e8 = 0  # Contador de bits (0-7)
    e4 = 0  # Índice en el buffer cifrado
    
    for char_idx in range(27):
        char = 0
        e8 = 0
        
        for bit_idx in range(8):
            if e8 == 0 and char_idx > 0:
                e8 = 1
                
            # Máscaras según el código
            d8 = 1 << (7 - bit_idx)  # -0x28(%rbp)
            d4 = 1 << (7 - e8)        # -0x2c(%rbp)
            
            # Bit del buffer cifrado
            if e4 < len(encrypted):
                enc_bit = bool(encrypted[e4] & d8)
                
                # XOR debe ser 0, así que los bits deben ser iguales
                if enc_bit:
                    char |= d4
            
            e8 += 1
            if e8 == 8:
                e8 = 0
                ec += 1
        
        result.append(char)
        e4 += 1
    
    return bytes(result[:26])

print("\n=== Solución 3: Lógica exacta del binario ===")
flag3 = solve3()
print(f"Flag: {flag3}")

# Buscar patrones ASCII válidos
print("\n=== Buscando caracteres ASCII válidos ===")
for offset in range(len(encrypted) - 7):
    chunk = encrypted[offset:offset+8]
    if all(32 <= b <= 126 for b in chunk):
        print(f"ASCII en offset {offset}: {chunk.decode('ascii', errors='ignore')}")

# Probar XOR simple con diferentes claves
print("\n=== Probando XOR con claves comunes ===")
for key in range(256):
    result = bytes([b ^ key for b in encrypted[:26]])
    if result.startswith(b'picoCTF{'):
        print(f"XOR con clave {hex(key)}: {result}")

# Debug: mostrar los primeros bytes en diferentes formatos
print("\n=== Debug: Primeros bytes ===")
print(f"Hex: {encrypted[:8].hex()}")
print(f"Binario: {' '.join(format(b, '08b') for b in encrypted[:8])}")
print(f"ASCII (si es válido): {repr(bytes([b if 32 <= b <= 126 else ord('?') for b in encrypted[:8]]))}")