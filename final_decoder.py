#!/usr/bin/env python3
import base64

# Leer el archivo
with open('/workspace/enc_flag', 'r') as f:
    content = f.read().strip()

print("=" * 70)
print("DECODIFICACIÓN PASO A PASO")
print("=" * 70)

# PASO 1: Decodificar el Base64 inicial
print("\n1. Contenido original del archivo:")
print(f"   {content}")

decoded1 = base64.b64decode(content).decode('utf-8')
print(f"\n2. Primera decodificación Base64:")
print(f"   {decoded1}")

# PASO 2: El resultado es un string que representa un literal de Python
# Necesitamos extraer el contenido real de Base64
if decoded1.startswith("b'") and decoded1.endswith("'"):
    # Extraer el contenido entre b' y '
    base64_content = decoded1[2:-1]
    print(f"\n3. Contenido Base64 extraído (sin b' y '):")
    print(f"   {base64_content}")
    
    # PASO 3: Decodificar este Base64
    final_decoded = base64.b64decode(base64_content).decode('utf-8')
    print(f"\n4. Decodificación final:")
    print(f"   {final_decoded}")
    
    if 'picoCTF{' in final_decoded:
        print("\n" + "=" * 70)
        print("🎯 ¡BANDERA ENCONTRADA!")
        print(f"🏁 FLAG: {final_decoded}")
        print("=" * 70)
    else:
        # Tal vez necesite más decodificación
        print("\n5. No encontré picoCTF, intentando más decodificaciones...")
        
        # Verificar si el resultado es otro Base64
        if final_decoded.endswith('=') or all(c in 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=' for c in final_decoded.strip()):
            try:
                another_decode = base64.b64decode(final_decoded).decode('utf-8')
                print(f"   Otra capa Base64 decodificada: {another_decode}")
                if 'picoCTF{' in another_decode:
                    print("\n" + "=" * 70)
                    print("🎯 ¡BANDERA ENCONTRADA!")
                    print(f"🏁 FLAG: {another_decode}")
                    print("=" * 70)
            except:
                pass

# Método alternativo: manejo manual
print("\n" + "=" * 70)
print("MÉTODO ALTERNATIVO - Extracción manual")
print("=" * 70)

# Decodificar primera capa
first_decode = base64.b64decode(content)
print(f"\n1. Primera decodificación (bytes): {first_decode}")

# Convertir a string y limpiar
as_string = first_decode.decode('utf-8').strip()
print(f"\n2. Como string: {as_string}")

# Si empieza con b' y termina con ', es un literal de Python
if as_string.startswith("b'"):
    # Extraer solo el contenido Base64
    clean_base64 = as_string[2:]  # Quitar b'
    if clean_base64.endswith("'"):
        clean_base64 = clean_base64[:-1]  # Quitar ' final
    
    print(f"\n3. Base64 limpio: {clean_base64}")
    
    # Decodificar
    try:
        final = base64.b64decode(clean_base64).decode('utf-8')
        print(f"\n4. Resultado final: {final}")
        
        if 'picoCTF{' in final:
            print("\n" + "=" * 70)
            print("🏆 ¡ÉXITO!")
            print(f"🏁 BANDERA: {final}")
            print("=" * 70)
    except Exception as e:
        print(f"Error al decodificar: {e}")