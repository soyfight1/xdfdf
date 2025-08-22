#!/usr/bin/env python3
import base64

def caesar_decode(text, shift):
    """Decodifica Caesar cipher"""
    result = ""
    for char in text:
        if char.isalpha():
            if char.isupper():
                result += chr((ord(char) - ord('A') - shift) % 26 + ord('A'))
            else:
                result += chr((ord(char) - ord('a') - shift) % 26 + ord('a'))
        else:
            result += char
    return result

# Leer el archivo
with open('/workspace/enc_flag', 'r') as f:
    content = f.read().strip()

print("=" * 70)
print("DECODIFICACIÓN COMPLETA - interencdec")
print("=" * 70)

# PASO 1: Primera decodificación Base64
print("\n[PASO 1] Archivo original:")
print(f"  {content}")

decoded1 = base64.b64decode(content).decode('utf-8').strip()
print(f"\n[PASO 2] Primera decodificación Base64:")
print(f"  {decoded1}")

# PASO 2: Extraer contenido Base64 del literal Python
if decoded1.startswith("b'"):
    base64_content = decoded1[2:]
    if base64_content.endswith("'"):
        base64_content = base64_content[:-1]
    
    print(f"\n[PASO 3] Base64 extraído:")
    print(f"  {base64_content}")
    
    # PASO 3: Segunda decodificación Base64
    decoded2 = base64.b64decode(base64_content).decode('utf-8')
    print(f"\n[PASO 4] Segunda decodificación Base64:")
    print(f"  {decoded2}")
    
    # PASO 4: Aplicar Caesar/ROT para obtener picoCTF
    print(f"\n[PASO 5] Probando diferentes desplazamientos Caesar:")
    print("-" * 50)
    
    for shift in range(1, 26):
        result = caesar_decode(decoded2, shift)
        if result.startswith('picoCTF'):
            print(f"  Shift {shift:2d}: {result} ✅ ¡ENCONTRADO!")
            print("\n" + "=" * 70)
            print("🏆 DECODIFICACIÓN EXITOSA")
            print(f"🏁 BANDERA: {result}")
            print("=" * 70)
            print("\nProceso completo:")
            print("1. Base64 decode del archivo")
            print("2. Extraer contenido del literal Python b'...'")
            print("3. Base64 decode del contenido extraído")
            print(f"4. Caesar cipher con shift -{shift}")
            break
        else:
            # Solo mostrar los primeros para no saturar
            if shift <= 10:
                print(f"  Shift {shift:2d}: {result[:30]}...")

# Verificación adicional
print("\n" + "=" * 70)
print("VERIFICACIÓN")
print("=" * 70)

# Análisis del texto antes del Caesar
print(f"\nTexto antes de Caesar: {decoded2}")
print(f"Comparación:")
print(f"  wpjvJAM vs picoCTF")
print(f"  w->p: shift de {(ord('w') - ord('p')) % 26}")
print(f"  p->i: shift de {(ord('p') - ord('i')) % 26}")
print(f"  j->c: shift de {(ord('j') - ord('c')) % 26}")

# El shift correcto es 7
final_flag = caesar_decode(decoded2, 7)
print(f"\nBandera final con shift 7: {final_flag}")