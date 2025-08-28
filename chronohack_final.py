#!/usr/bin/env python3
"""
Solución para Chronohack CTF - picoCTF
Explota la vulnerabilidad de usar time.time() como semilla para random
"""

import random
import time
import sys

def get_random(length, seed_time):
    """Replica la función del servidor para generar tokens"""
    alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    random.seed(seed_time)
    s = ""
    for i in range(length):
        s += random.choice(alphabet)
    return s

def main():
    print("="*60)
    print("CHRONOHACK CTF SOLVER")
    print("="*60)
    
    # Obtener el tiempo actual
    current_time = time.time()
    current_time_ms = int(current_time * 1000)
    
    print(f"\nTiempo actual: {time.strftime('%Y-%m-%d %H:%M:%S UTC', time.gmtime())}")
    print(f"Timestamp (ms): {current_time_ms}\n")
    
    print("INSTRUCCIONES:")
    print("-"*60)
    print("1. Abre otra terminal")
    print("2. Ejecuta: nc verbal-sleep.picoctf.net 60195")
    print("3. Cuando te pida el token, usa uno de estos:\n")
    
    print("TOKENS GENERADOS (del más probable al menos probable):")
    print("-"*60)
    
    tokens = []
    
    # Generar tokens para un rango de ±5 segundos
    for offset_ms in range(-5000, 5001, 500):  # cada 500ms
        seed_time = current_time_ms + offset_ms
        token = get_random(20, seed_time)
        offset_sec = offset_ms / 1000
        tokens.append((offset_sec, token))
    
    # Ordenar por probabilidad (más cercano a 0 primero)
    tokens.sort(key=lambda x: abs(x[0]))
    
    # Mostrar los primeros 10 tokens más probables
    for i, (offset, token) in enumerate(tokens[:10]):
        if i == 0:
            print(f">>> {token} <<< (PRUEBA ESTE PRIMERO)")
        else:
            print(f"    {token}     (offset: {offset:+.1f}s)")
    
    print("\n" + "="*60)
    print("CÓMO USAR:")
    print("="*60)
    print("1. Copia el primer token (entre >>>  <<<)")
    print("2. Pégalo cuando el servidor lo pida")
    print("3. Si no funciona, prueba el siguiente")
    print("4. Tienes 50 intentos totales")
    print("\nNOTA: El token correcto depende del momento EXACTO")
    print("      en que el servidor lo genera (cuando te conectas)")
    print("="*60)
    
    # Guardar tokens para uso con script bash
    with open('/workspace/tokens_list.txt', 'w') as f:
        for _, token in tokens[:20]:
            f.write(token + '\n')
    
    print(f"\nTokens guardados en: /workspace/tokens_list.txt")
    print("\nPara probar automáticamente:")
    print("while read t; do echo $t | nc verbal-sleep.picoctf.net 60195 | grep -q 'Congratulations' && echo \"Token: $t\" && break; done < /workspace/tokens_list.txt")

if __name__ == "__main__":
    main()