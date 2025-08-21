#!/usr/bin/env python3

# El binario hace lo siguiente:
# 1. Lee 26 bytes de flag.txt
# 2. Escribe esos bytes en mystery.png con transformaciones:
#    - Bytes 0-5: directos
#    - Bytes 6-14: suma 5
#    - Byte 15: resta 3
#    - Bytes 16-25: directos

# Pero la imagen que tenemos ya fue procesada por el servidor
# Así que mystery.png ya tiene la bandera insertada en algún lugar

# Primero, veamos si hay algo inusual en la imagen
with open('mystery.png', 'rb') as f:
    data = f.read()

# La cabecera PNG normal es: 89 50 4E 47 0D 0A 1A 0A
png_header = b'\x89PNG\r\n\x1a\n'

print("Cabecera PNG esperada:", png_header.hex())
print("Cabecera actual:      ", data[:8].hex())

if data[:8] == png_header:
    print("La cabecera PNG está intacta")
    print("\nBuscando anomalías o datos insertados...")
    
    # El binario escribe con fputc, que sobrescribe bytes
    # Pero si la imagen sigue siendo válida, los datos deben estar en otro lugar
    
    # Busquemos el string "picoCTF" o patrones similares
    import re
    
    # Buscar picoCTF directamente
    if b'picoCTF' in data:
        idx = data.index(b'picoCTF')
        print(f"Encontrado 'picoCTF' en offset {idx}")
        print(f"Contexto: {data[idx:idx+50]}")
    
    # Buscar patrones que podrían ser picoCTF codificado
    # p=0x70, i=0x69, c=0x63, o=0x6F, C=0x43, T=0x54, F=0x46, {=0x7B
    
    # Si los bytes 6-14 tienen +5, busquemos esos valores
    # picoCTF{ normal sería: 70 69 63 6F 43 54 46 7B
    # con +5 en algunos bytes: 70 69 63 6F 43 54 46+5=4B 7B+5=80 ...
    
    # Intentemos buscar después del header IHDR
    ihdr_end = data.find(b'IHDR')
    if ihdr_end != -1:
        print(f"\nIHDR encontrado en offset {ihdr_end}")
        # El chunk IHDR tiene 13 bytes de datos después del tipo
        # Veamos qué hay después
        offset = ihdr_end + 4 + 13 + 4  # IHDR + datos + CRC
        print(f"Datos después de IHDR (offset {offset}):")
        print(data[offset:offset+50].hex())