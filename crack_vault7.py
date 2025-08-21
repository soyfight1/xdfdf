#!/usr/bin/env python3

def crack_vault7():
    """
    Invierte el proceso de passwordToIntArray para obtener la contraseña original
    """
    
    # Los valores esperados del array de enteros
    target_ints = [
        1096770097,  # x[0]
        1952395366,  # x[1]
        1600270708,  # x[2]
        1601398833,  # x[3]
        1716808014,  # x[4]
        1734291511,  # x[5]
        960049251,   # x[6]
        1681089078   # x[7]
    ]
    
    print("[*] Valores objetivo encontrados:")
    for i, val in enumerate(target_ints):
        print(f"    x[{i}] = {val} (0x{val:08x})")
    
    print("\n[*] Invirtiendo el proceso de bit shifting...")
    
    password = ""
    
    for i, int_val in enumerate(target_ints):
        # Cada entero contiene 4 bytes empacados
        # Extraemos cada byte usando bit shifting y masking
        
        # byte 0: bits 24-31 (más significativos)
        byte0 = (int_val >> 24) & 0xFF
        
        # byte 1: bits 16-23
        byte1 = (int_val >> 16) & 0xFF
        
        # byte 2: bits 8-15
        byte2 = (int_val >> 8) & 0xFF
        
        # byte 3: bits 0-7 (menos significativos)
        byte3 = int_val & 0xFF
        
        # Convertir bytes a caracteres ASCII
        char0 = chr(byte0)
        char1 = chr(byte1)
        char2 = chr(byte2)
        char3 = chr(byte3)
        
        chunk = char0 + char1 + char2 + char3
        password += chunk
        
        print(f"    int[{i}] = 0x{int_val:08x} -> bytes: [{byte0:02x}, {byte1:02x}, {byte2:02x}, {byte3:02x}] -> '{chunk}'")
    
    print(f"\n[+] Contraseña decodificada: {password}")
    print(f"\n{'='*60}")
    print(f"[!] FLAG COMPLETA: picoCTF{{{password}}}")
    print(f"{'='*60}")
    
    # Verificación rápida
    print("\n[*] Verificando longitud: ", end="")
    if len(password) == 32:
        print("✓ 32 caracteres")
    else:
        print(f"✗ {len(password)} caracteres (esperados 32)")
    
    return f"picoCTF{{{password}}}"

# Ejecutar el crack
flag = crack_vault7()
print(f"\n🏆 RESPUESTA FINAL: {flag}")