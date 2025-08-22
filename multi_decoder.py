#!/usr/bin/env python3
import base64
import binascii
import codecs

def detect_and_decode(data, iteration=1):
    """Detecta el tipo de codificación y decodifica"""
    print(f"\n{'='*60}")
    print(f"Iteración {iteration}:")
    print(f"Entrada: {data[:100]}{'...' if len(data) > 100 else ''}")
    print(f"Longitud: {len(data)} caracteres")
    
    # Si ya encontramos la bandera
    if 'picoCTF{' in data:
        print(f"\n🎯 ¡BANDERA ENCONTRADA!: {data}")
        return data, True
    
    # Intentar Base64
    try:
        # Eliminar espacios y saltos de línea
        clean_data = data.strip().replace('\n', '').replace(' ', '')
        
        # Verificar si parece Base64
        if all(c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=' for c in clean_data):
            decoded = base64.b64decode(clean_data).decode('utf-8', errors='ignore')
            print(f"✓ Decodificado desde Base64")
            print(f"Resultado: {decoded[:100]}{'...' if len(decoded) > 100 else ''}")
            return decoded.strip(), False
    except Exception as e:
        print(f"  Base64 falló: {e}")
    
    # Intentar Hex
    try:
        # Verificar si es hexadecimal
        clean_data = data.strip()
        if all(c in '0123456789abcdefABCDEF' for c in clean_data.replace(' ', '').replace('\n', '')):
            decoded = bytes.fromhex(clean_data).decode('utf-8', errors='ignore')
            print(f"✓ Decodificado desde Hexadecimal")
            print(f"Resultado: {decoded[:100]}{'...' if len(decoded) > 100 else ''}")
            return decoded.strip(), False
    except Exception as e:
        print(f"  Hex falló: {e}")
    
    # Intentar ROT13
    try:
        decoded = codecs.decode(data, 'rot_13')
        if decoded != data:  # Si cambió algo
            print(f"✓ Decodificado desde ROT13")
            print(f"Resultado: {decoded[:100]}{'...' if len(decoded) > 100 else ''}")
            return decoded.strip(), False
    except Exception as e:
        print(f"  ROT13 falló: {e}")
    
    # Si el string está entre comillas, quitarlas
    if data.startswith("'") and data.endswith("'"):
        unquoted = data[1:-1]
        print(f"✓ Removidas comillas simples")
        print(f"Resultado: {unquoted[:100]}{'...' if len(unquoted) > 100 else ''}")
        return unquoted, False
    
    if data.startswith('"') and data.endswith('"'):
        unquoted = data[1:-1]
        print(f"✓ Removidas comillas dobles")
        print(f"Resultado: {unquoted[:100]}{'...' if len(unquoted) > 100 else ''}")
        return unquoted, False
    
    # Si llegamos aquí, no pudimos decodificar más
    print(f"✗ No se pudo decodificar más")
    return data, True

# Leer el archivo original
with open('/workspace/enc_flag', 'r') as f:
    content = f.read().strip()

print("🔍 INICIANDO DECODIFICACIÓN MÚLTIPLE")
print(f"Archivo original: enc_flag")

current_data = content
iteration = 0
max_iterations = 20  # Límite de seguridad

while iteration < max_iterations:
    iteration += 1
    decoded_data, stop = detect_and_decode(current_data, iteration)
    
    if stop:
        if 'picoCTF{' in decoded_data:
            print(f"\n{'='*60}")
            print(f"✅ ÉXITO después de {iteration} iteraciones")
            print(f"🏁 BANDERA FINAL: {decoded_data}")
        else:
            print(f"\n{'='*60}")
            print(f"⚠️ Decodificación detenida después de {iteration} iteraciones")
            print(f"Resultado final: {decoded_data}")
        break
    
    current_data = decoded_data

if iteration >= max_iterations:
    print(f"\n⚠️ Alcanzado límite de iteraciones ({max_iterations})")
    print(f"Último resultado: {current_data}")