#!/usr/bin/env python3

def extract_flag():
    with open('encoded.bmp', 'rb') as f:
        data = f.read()
    
    # Skip first 2000 bytes (0x7d0)
    offset = 2000
    
    # Extract 50 characters, 8 bits each
    flag = []
    for char_idx in range(50):
        char_bits = 0
        for bit_idx in range(8):
            # Get the byte from the image
            byte_pos = offset + char_idx * 8 + bit_idx
            img_byte = data[byte_pos]
            
            # Extract LSB
            bit = img_byte & 1
            
            # Add bit to character (shift left and add)
            char_bits |= (bit << bit_idx)
        
        # Add 5 to get original character (reverse of sub 5)
        char_bits += 5
        flag.append(chr(char_bits))
    
    return ''.join(flag)

if __name__ == "__main__":
    flag = extract_flag()
    print(f"Flag encontrada: {flag}")
    
    # Verificar formato picoCTF
    if flag.startswith("picoCTF{") and flag.endswith("}"):
        print("✓ Flag válida!")
    else:
        print("⚠ La flag no tiene el formato esperado")