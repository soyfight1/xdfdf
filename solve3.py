#!/usr/bin/env python3

import struct

# Datos cifrados del binario
encrypted = bytearray()
encrypted.extend(struct.pack('<Q', 0x617b2375f81ea7e1))
encrypted.extend(struct.pack('<Q', 0xd269df5b5afc9db9))
# El tercer valor se almacena en -0x41(%rbp), que son 7 bytes desde -0x41
encrypted.extend(struct.pack('<Q', 0xf467edf4ed1bfed2)[:7])

print(f"Encrypted data ({len(encrypted)} bytes): {encrypted.hex()}")

# Análisis del código assembly:
# La función verifica bit por bit usando dos máscaras
# e4 es el índice en el buffer cifrado
# ec es el índice en el password de entrada
# e8 es un contador especial de bits
# e0 es el iterador de 0-7 para cada bit

def decrypt():
    password = []
    
    e4 = 0  # Índice en encrypted
    ec = 0  # Índice en password
    
    while ec < 27 and e4 < len(encrypted):
        e8 = 0  # Reset bit counter
        
        for e0 in range(8):  # Para cada bit del byte cifrado
            if e8 == 0:
                e8 = 1  # Se incrementa en la primera iteración
            
            # Crear máscaras
            mask_encrypted = 1 << (7 - e0)
            mask_password = 1 << (7 - e8)
            
            # Obtener bit del dato cifrado
            encrypted_bit = bool(encrypted[e4] & mask_encrypted)
            
            # Para cada carácter del password, construir bit por bit
            if ec < 27:
                if len(password) <= ec:
                    password.append(0)
                
                # Si el bit cifrado es 1, el bit del password debe ser 1 para que XOR = 0
                if encrypted_bit:
                    password[ec] |= mask_password
            
            e8 += 1
            if e8 == 8:
                e8 = 0
                ec += 1
                if ec >= 27:
                    break
        
        e4 += 1
    
    return bytes(password[:26])  # Sin newline

# Otra interpretación basada en el patrón observado
def decrypt2():
    # El patrón "picOWF{" sugiere que hay un desplazamiento
    # O -> C es una diferencia de 4 en ASCII
    # W -> T es una diferencia de 3 en ASCII
    
    result = []
    
    # Procesar cada byte
    for i in range(min(27, len(encrypted) * 8 // 8)):
        byte_val = 0
        
        for bit in range(8):
            # Calcular posición del bit en el stream cifrado
            bit_pos = i * 8 + bit
            byte_idx = bit_pos // 8
            bit_idx = bit_pos % 8
            
            if byte_idx < len(encrypted):
                # Extraer bit del buffer cifrado
                if encrypted[byte_idx] & (1 << (7 - bit_idx)):
                    byte_val |= (1 << (7 - bit))
        
        result.append(byte_val)
    
    return bytes(result[:26])

# Implementación más precisa basada en el análisis del binario
def decrypt3():
    result = []
    
    # Los datos están organizados en grupos de 8 bits
    # pero el acceso no es lineal
    
    e4 = 0  # índice en encrypted
    for char_idx in range(27):
        char = 0
        bit_counter = 0
        
        for bit_idx in range(8):
            if char_idx == 0 and bit_idx == 0:
                bit_counter = 1
            elif bit_counter == 0:
                bit_counter = 1
            
            # Obtener bit del buffer cifrado
            if e4 < len(encrypted):
                enc_byte = encrypted[e4]
                enc_bit = (enc_byte >> (7 - bit_idx)) & 1
                
                # Colocar el bit en la posición correcta del carácter
                char |= (enc_bit << (7 - bit_counter))
            
            bit_counter += 1
            if bit_counter == 8:
                bit_counter = 0
        
        result.append(char)
        
        # Avanzar en el buffer cifrado cada 8 bits procesados
        if char_idx % 1 == 0 and char_idx < 26:
            e4 += 1
    
    return bytes(result[:26])

print("\n=== Método 1: Decodificación con lógica del binario ===")
flag1 = decrypt()
print(f"Flag: {flag1}")
print(f"ASCII: {repr(flag1)}")

print("\n=== Método 2: Decodificación lineal ===")
flag2 = decrypt2()
print(f"Flag: {flag2}")
print(f"ASCII: {repr(flag2)}")

print("\n=== Método 3: Decodificación ajustada ===")
flag3 = decrypt3()
print(f"Flag: {flag3}")
print(f"ASCII: {repr(flag3)}")

# Intentar corregir el patrón "picOWF{" -> "picoCTF{"
print("\n=== Corrección del patrón ===")
# Si vemos "picOWF{", necesitamos ajustar algunos bits
test = bytearray(b'picOWF{')
correct = bytearray(b'picoCTF')
diff = [test[i] ^ correct[i] for i in range(len(test))]
print(f"Diferencias XOR: {diff}")

# Aplicar corrección
if flag1.startswith(b'picOWF{'):
    corrected = bytearray(flag1)
    corrected[3] = ord('o')  # O -> o
    corrected[4] = ord('C')  # W -> C  
    corrected[5] = ord('T')  # F -> T
    corrected[6] = ord('F')  # { -> F
    corrected[7] = ord('{')  # siguiente carácter
    print(f"Flag corregida manualmente: {bytes(corrected)}")

# Buscar el patrón correcto analizando los bits
print("\n=== Análisis detallado de bits ===")
print("Primeros 8 bytes cifrados:")
for i in range(8):
    if i < len(encrypted):
        print(f"Byte {i}: {encrypted[i]:02x} = {encrypted[i]:08b} = '{chr(encrypted[i]) if 32 <= encrypted[i] <= 126 else '?'}'")

# Debug info del problema
print("\n=== Debug info del CTF ===")
print("u:877492 = 0xD6634")
print("c:458 = 0x1CA")  
print("i:296160 = 0x485E0")
print("Estos podrían ser hints sobre el algoritmo o claves")