#!/usr/bin/env python3
import base64
import binascii
import re

def multi_decode(data):
    """Decodifica múltiples capas de codificación"""
    print(f"\n🔍 Iniciando decodificación...")
    print(f"Entrada original: {data}")
    
    iterations = []
    current = data.strip()
    
    for i in range(10):
        print(f"\n--- Iteración {i+1} ---")
        print(f"Procesando: {current[:80]}{'...' if len(current) > 80 else ''}")
        
        # Verificar si ya tenemos la bandera
        if 'picoCTF{' in current:
            print(f"\n✅ ¡BANDERA ENCONTRADA!")
            return current
        
        # Manejar literal de Python bytes (b'...')
        if current.startswith("b'") and current.endswith("'"):
            current = current[2:-1]
            print(f"→ Removido literal Python bytes: {current[:80]}{'...' if len(current) > 80 else ''}")
            iterations.append(f"Removed Python bytes literal")
            continue
        
        # Manejar comillas simples
        if current.startswith("'") and current.endswith("'"):
            current = current[1:-1]
            print(f"→ Removidas comillas: {current[:80]}{'...' if len(current) > 80 else ''}")
            iterations.append(f"Removed quotes")
            continue
        
        # Intentar Base64
        if current.endswith('==') or current.endswith('='):
            try:
                decoded = base64.b64decode(current).decode('utf-8', errors='ignore')
                print(f"→ Decodificado Base64: {decoded[:80]}{'...' if len(decoded) > 80 else ''}")
                current = decoded
                iterations.append("Base64 decode")
                continue
            except:
                pass
        
        # Si no hay cambios, salir
        break
    
    return current

# Leer archivo original
with open('/workspace/enc_flag', 'r') as f:
    content = f.read().strip()

# Primera decodificación Base64
print("=" * 70)
print("PASO 1: Decodificar el archivo original")
print(f"Contenido: {content}")

try:
    step1 = base64.b64decode(content).decode('utf-8')
    print(f"→ Resultado: {step1}")
except Exception as e:
    print(f"Error: {e}")
    step1 = content

# Procesar el resultado
print("\n" + "=" * 70)
print("PASO 2: Procesar el resultado")

# Si tiene formato b'...', extraer el contenido
if step1.startswith("b'") and step1.endswith("'"):
    step2 = step1[2:-1]
    print(f"Extrayendo contenido de literal bytes: {step2}")
else:
    step2 = step1

# Decodificar Base64 nuevamente
print("\n" + "=" * 70)
print("PASO 3: Decodificar Base64 del contenido extraído")
print(f"Intentando decodificar: {step2}")

try:
    final = base64.b64decode(step2).decode('utf-8')
    print(f"→ Resultado: {final}")
    
    if 'picoCTF{' in final:
        print(f"\n{'='*70}")
        print(f"🎯 ¡BANDERA ENCONTRADA!")
        print(f"🏁 FLAG: {final}")
    else:
        print(f"\nNo es la bandera aún, contenido: {final}")
except Exception as e:
    print(f"Error al decodificar: {e}")
    
    # Intentar interpretarlo como hexadecimal
    print("\nIntentando como hexadecimal...")
    try:
        hex_decoded = bytes.fromhex(step2).decode('utf-8')
        print(f"→ Decodificado hex: {hex_decoded}")
        if 'picoCTF{' in hex_decoded:
            print(f"\n🎯 ¡BANDERA ENCONTRADA!")
            print(f"🏁 FLAG: {hex_decoded}")
    except:
        print("No es hexadecimal")

print("\n" + "=" * 70)
print("ANÁLISIS COMPLETO:")
print(f"1. Archivo original (Base64): {content[:50]}...")
print(f"2. Primera decodificación: {step1[:50]}...")
print(f"3. Contenido extraído: {step2[:50]}...")
print("\nIntentando decodificación final directa...")

# Intento directo con el contenido extraído
if step2 and step2 != step1:
    try:
        # Decodificar Base64
        final_attempt = base64.b64decode(step2)
        print(f"Decodificado como bytes: {final_attempt}")
        
        # Intentar como texto
        try:
            as_text = final_attempt.decode('utf-8')
            print(f"Como texto UTF-8: {as_text}")
            if 'picoCTF{' in as_text:
                print(f"\n🏆 BANDERA FINAL: {as_text}")
        except:
            # Intentar como ASCII
            try:
                as_ascii = final_attempt.decode('ascii')
                print(f"Como texto ASCII: {as_ascii}")
                if 'picoCTF{' in as_ascii:
                    print(f"\n🏆 BANDERA FINAL: {as_ascii}")
            except:
                print(f"Bytes raw: {final_attempt}")
    except Exception as e:
        print(f"Error en intento final: {e}")