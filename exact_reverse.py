#!/usr/bin/env python3

import struct

# Recrear EXACTAMENTE lo que hace el binario
# basándome en el desensamblado línea por línea

def check_password(password):
    """Simula la función check del binario"""
    
    # Verificar longitud (0x40116f: cmp $0x1b,%rax)
    if len(password) != 27:
        return 1  # Error
    
    # Buffer local con datos hardcodeados (-0x50 a -0x41 en rbp)
    buffer = bytearray(27)
    
    # 0x40117f: movabs $0x617b2375f81ea7e1,%rax
    # 0x401193: mov %rax,-0x50(%rbp)
    buffer[0:8] = struct.pack('<Q', 0x617b2375f81ea7e1)
    
    # 0x401189: movabs $0xd269df5b5afc9db9,%rdx
    # 0x401197: mov %rdx,-0x48(%rbp)
    buffer[8:16] = struct.pack('<Q', 0xd269df5b5afc9db9)
    
    # 0x40119b: movabs $0xf467edf4ed1bfed2,%rax
    # 0x4011a5: mov %rax,-0x41(%rbp)  # Nota: -0x41, no -0x40!
    # Esto significa que se superpone con el buffer anterior
    temp = struct.pack('<Q', 0xf467edf4ed1bfed2)
    buffer[15:23] = temp  # 8 bytes desde posición 15
    
    print(f"Buffer hardcodeado ({len(buffer)} bytes): {buffer.hex()}")
    
    # Variables locales
    ec = 0  # -0x14(%rbp) - índice en password
    e8 = 0  # -0x18(%rbp) - contador especial
    dc = 0  # -0x24(%rbp)
    e4 = 0  # -0x1c(%rbp) - índice en buffer
    
    # 0x4011c5: jmp 0x40128e (salta al while)
    while True:
        # 0x40128e: <check+0x138>
        # 0x40128e: cmp con longitud
        if ec >= len(password):
            break
        
        # 0x4011ca: movl $0x0,-0x20(%rbp)  # e0 = 0
        for e0 in range(8):  # 0x401280: cmpl $0x8,-0x20(%rbp)
            # 0x4011d6: cmpl $0x0,-0x18(%rbp)
            if e8 == 0:
                e8 = 1  # 0x4011dc: addl $0x1,-0x18(%rbp)
            
            # 0x4011e0: mov $0x7,%eax
            # 0x4011e5: sub -0x20(%rbp),%eax  # 7 - e0
            # 0x4011ef: shl %cl,%edx  # 1 << (7 - e0)
            d8 = 1 << (7 - e0)  # -0x28(%rbp)
            
            # 0x4011f6: mov $0x7,%eax
            # 0x4011fb: sub -0x18(%rbp),%eax  # 7 - e8
            # 0x401205: shl %cl,%edx  # 1 << (7 - e8)
            d4 = 1 << (7 - e8)  # -0x2c(%rbp)
            
            # 0x401211: movzbl -0x50(%rbp,%rax,1),%eax
            # Obtener byte del buffer en posición e4
            if e4 < len(buffer):
                buffer_byte = buffer[e4]
            else:
                buffer_byte = 0
            
            # 0x401219: and -0x28(%rbp),%eax
            # 0x40121e: setg %cl
            buffer_bit = (buffer_byte & d8) > 0
            
            # 0x401227: mov -0x58(%rbp),%rax  # password
            # 0x40122e: movzbl (%rax),%eax
            if ec < len(password):
                password_byte = ord(password[ec])
            else:
                password_byte = 0
            
            # 0x401234: and -0x2c(%rbp),%eax
            # 0x401239: setg %al
            password_bit = (password_byte & d4) > 0
            
            # 0x40123c: xor %ecx,%eax
            # 0x40123e: test %al,%al
            if buffer_bit != password_bit:  # XOR debe ser 0
                return 1  # Error
            
            # 0x401249: addl $0x1,-0x18(%rbp)
            e8 += 1
            
            # 0x40124d: cmpl $0x8,-0x18(%rbp)
            if e8 == 8:
                e8 = 0  # 0x401253: movl $0x0,-0x18(%rbp)
                ec += 1  # 0x40125a: addl $0x1,-0x14(%rbp)
        
        e4 += 1
        
        # Verificar si terminamos
        if ec >= len(password):
            return 0  # Correcto
    
    return 0

def reverse_check():
    """Reversa la lógica para encontrar el password"""
    
    # Buffer con datos hardcodeados
    buffer = bytearray(27)
    buffer[0:8] = struct.pack('<Q', 0x617b2375f81ea7e1)
    buffer[8:16] = struct.pack('<Q', 0xd269df5b5afc9db9)
    
    # Importante: el tercer valor se almacena en -0x41, no -0x40
    # Esto significa que comienza en el byte 15 (0x50 - 0x41 = 0xF)
    temp = struct.pack('<Q', 0xf467edf4ed1bfed2)
    buffer[15:23] = temp
    
    print(f"Buffer para decodificar: {buffer[:23].hex()}")
    
    # Reconstruir el password
    password = [0] * 27
    
    ec = 0  # índice en password
    e8 = 0  # contador de bits
    e4 = 0  # índice en buffer
    
    while ec < 27 and e4 < 23:  # Solo tenemos 23 bytes de datos
        for e0 in range(8):
            if e8 == 0:
                e8 = 1
            
            d8 = 1 << (7 - e0)
            d4 = 1 << (7 - e8)
            
            # Bit del buffer
            buffer_bit = (buffer[e4] & d8) > 0
            
            # El bit del password debe ser igual al del buffer para que XOR = 0
            if buffer_bit:
                password[ec] |= d4
            
            e8 += 1
            if e8 == 8:
                e8 = 0
                ec += 1
                if ec >= 27:
                    break
        
        e4 += 1
    
    # Convertir a string
    result = ''.join(chr(c) if 32 <= c <= 126 else f'\\x{c:02x}' for c in password[:26])
    return result, bytes(password[:26])

print("=== Reversión exacta del algoritmo ===")
result_str, result_bytes = reverse_check()
print(f"Password decodificado (string): {result_str}")
print(f"Password decodificado (bytes): {result_bytes}")
print(f"Password decodificado (hex): {result_bytes.hex()}")

# Verificar si es ASCII válido
if all(32 <= b <= 126 for b in result_bytes):
    print(f"¡ES ASCII VÁLIDO!: {result_bytes.decode('ascii')}")
else:
    print("Contiene caracteres no-ASCII")

# Probar el password
print("\n=== Verificación ===")
if check_password(result_bytes.decode('ascii', errors='ignore') + '\n') == 0:
    print("¡El password es CORRECTO según nuestra simulación!")
else:
    print("El password NO pasa la verificación")

# Debug: mostrar qué caracteres son problemáticos
print("\n=== Análisis carácter por carácter ===")
for i, b in enumerate(result_bytes):
    if 32 <= b <= 126:
        print(f"Pos {i:2d}: {b:3d} (0x{b:02x}) = '{chr(b)}'")
    else:
        print(f"Pos {i:2d}: {b:3d} (0x{b:02x}) = NO-ASCII")