#!/usr/bin/env python3

def asm3(arg1, arg2, arg3):
    """
    Simula la función asm3 con los argumentos dados
    arg1 = 0xba6c5a02 @ [ebp+0x8]
    arg2 = 0xd101e3dd @ [ebp+0xc]
    arg3 = 0xbb86a173 @ [ebp+0x10]
    """
    
    # Convertir a bytes para acceso individual
    arg1_bytes = arg1.to_bytes(4, 'little')
    arg2_bytes = arg2.to_bytes(4, 'little')
    arg3_bytes = arg3.to_bytes(4, 'little')
    
    # Stack layout (little-endian):
    # [ebp+0x8]:  arg1_bytes[0], arg1_bytes[1], arg1_bytes[2], arg1_bytes[3]
    # [ebp+0xc]:  arg2_bytes[0], arg2_bytes[1], arg2_bytes[2], arg2_bytes[3]
    # [ebp+0x10]: arg3_bytes[0], arg3_bytes[1], arg3_bytes[2], arg3_bytes[3]
    
    print(f"[*] arg1 = 0x{arg1:08x} -> bytes: {' '.join(f'{b:02x}' for b in arg1_bytes)}")
    print(f"[*] arg2 = 0x{arg2:08x} -> bytes: {' '.join(f'{b:02x}' for b in arg2_bytes)}")
    print(f"[*] arg3 = 0x{arg3:08x} -> bytes: {' '.join(f'{b:02x}' for b in arg3_bytes)}")
    print()
    
    # xor eax, eax -> eax = 0
    eax = 0
    print(f"[+3] xor eax,eax -> eax = 0x{eax:08x}")
    
    # mov ah, BYTE PTR [ebp+0xb] -> ah = arg1_bytes[3] (byte más significativo de arg1)
    ah = arg1_bytes[3]
    eax = (eax & 0xFFFF00FF) | (ah << 8)
    print(f"[+5] mov ah,[ebp+0xb] -> ah = 0x{ah:02x}, eax = 0x{eax:08x}")
    
    # shl ax, 0x10 -> shift left ax by 16 bits (ax = 0 después del shift)
    ax = eax & 0xFFFF
    ax = (ax << 16) & 0xFFFF  # Solo mantenemos los 16 bits bajos
    eax = (eax & 0xFFFF0000) | ax
    print(f"[+8] shl ax,0x10 -> ax = 0x{ax:04x}, eax = 0x{eax:08x}")
    
    # sub al, BYTE PTR [ebp+0xd] -> al = al - arg2_bytes[1]
    al = eax & 0xFF
    sub_val = arg2_bytes[1]
    al = (al - sub_val) & 0xFF
    eax = (eax & 0xFFFFFF00) | al
    print(f"[+12] sub al,[ebp+0xd] -> al = al - 0x{sub_val:02x} = 0x{al:02x}, eax = 0x{eax:08x}")
    
    # add ah, BYTE PTR [ebp+0xc] -> ah = ah + arg2_bytes[0]
    ah = (eax >> 8) & 0xFF
    add_val = arg2_bytes[0]
    ah = (ah + add_val) & 0xFF
    eax = (eax & 0xFFFF00FF) | (ah << 8)
    print(f"[+15] add ah,[ebp+0xc] -> ah = ah + 0x{add_val:02x} = 0x{ah:02x}, eax = 0x{eax:08x}")
    
    # xor ax, WORD PTR [ebp+0x12] -> ax = ax XOR (arg3_bytes[2:4] como word)
    ax = eax & 0xFFFF
    # [ebp+0x12] es arg3 + 2 bytes = arg3_bytes[2] y arg3_bytes[3]
    xor_val = arg3_bytes[2] | (arg3_bytes[3] << 8)
    ax = ax ^ xor_val
    eax = (eax & 0xFFFF0000) | ax
    print(f"[+18] xor ax,[ebp+0x12] -> ax = 0x{(eax & 0xFFFF):04x} XOR 0x{xor_val:04x} = 0x{ax:04x}, eax = 0x{eax:08x}")
    
    print(f"\n[!] RESULTADO FINAL: 0x{ax:04x}")
    return ax

# Ejecutar con los valores dados
result = asm3(0xba6c5a02, 0xd101e3dd, 0xbb86a173)
print(f"\n{'='*50}")
print(f"RESPUESTA: 0x{result:04x}")
print(f"{'='*50}")