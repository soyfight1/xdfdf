#!/usr/bin/env python3

# Analizar el binario nand_checker.bin para entender su lógica
with open('server/programs/nand_checker.bin', 'rb') as f:
    data = f.read()

print("=== Analyzing nand_checker.bin ===")
print(f"Size: {len(data)} bytes")
print("\nHex dump:")

# Imprimir en formato más legible
for i in range(0, len(data), 16):
    hex_bytes = ' '.join(f'{b:02x}' for b in data[i:i+16])
    ascii_repr = ''.join(chr(b) if 32 <= b < 127 else '.' for b in data[i:i+16])
    print(f"{i:04x}: {hex_bytes:<48} {ascii_repr}")

print("\n=== Interpreting as 16-bit words ===")
# Interpretar como palabras de 16 bits (little-endian)
import struct

words = []
for i in range(0, len(data), 2):
    if i + 1 < len(data):
        word = struct.unpack('<H', data[i:i+2])[0]
        words.append(word)
        print(f"{i//2:03d}: 0x{word:04x} ({word:5d})", end="  ")
        if (i//2 + 1) % 4 == 0:
            print()

print("\n\n=== Looking for patterns ===")

# Buscar valores específicos
target_values = [0x1337, 0x3333, 0xffff, 0x1000, 0x2000, 0x3000]
for target in target_values:
    positions = [i for i, w in enumerate(words) if w == target]
    if positions:
        print(f"Found 0x{target:04x} at word positions: {positions}")

# Buscar instrucciones que podrían ser relevantes
print("\n=== Possible instructions or data ===")

# Los primeros bytes parecen ser pares de valores
for i in range(0, min(len(words), 20), 2):
    if i + 1 < len(words):
        print(f"Pair {i//2}: 0x{words[i]:04x}, 0x{words[i+1]:04x}")

print("\n=== Key observations ===")
print("1. The value 0x3333 appears in the binary (wrong answer code)")
print("2. The value 0xffff appears (could be related to flag trigger)")
print("3. Pattern suggests pairs of values, possibly instructions")
print("4. Need to understand the CPU instruction format to decode properly")