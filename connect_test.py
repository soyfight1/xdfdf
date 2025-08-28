#!/usr/bin/env python3

import socket
import time
import random

def get_random(length, seed_time):
    """Genera un token usando un seed específico"""
    alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    random.seed(seed_time)
    s = ""
    for i in range(length):
        s += random.choice(alphabet)
    return s

def test_token(token):
    """Prueba un token específico"""
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(5)
        sock.connect(('verbal-sleep.picoctf.net', 60195))
        
        # Leer banner
        data = sock.recv(1024).decode()
        print(f"Banner recibido")
        
        # Enviar token
        sock.send((token + "\n").encode())
        print(f"Token enviado: {token}")
        
        # Leer respuesta
        response = sock.recv(2048).decode()
        print(f"Respuesta: {response}")
        
        if "Congratulations" in response:
            # Leer más para obtener la flag
            flag_data = sock.recv(1024).decode()
            print(f"¡FLAG ENCONTRADA!: {flag_data}")
            sock.close()
            return True
        
        sock.close()
        return False
        
    except Exception as e:
        print(f"Error: {e}")
        return False

# Generar token basado en el tiempo actual
current_time_ms = int(time.time() * 1000)

print("=== Probando tokens basados en tiempo actual ===")
print(f"Tiempo actual en ms: {current_time_ms}\n")

# Probar con diferentes offsets
for offset_seconds in range(-5, 6):  # ±5 segundos
    seed_time = current_time_ms + (offset_seconds * 1000)
    token = get_random(20, seed_time)
    
    print(f"\n--- Probando con offset {offset_seconds} segundos ---")
    print(f"Seed: {seed_time}")
    print(f"Token: {token}")
    
    if test_token(token):
        print("¡¡¡TOKEN CORRECTO ENCONTRADO!!!")
        break
    
    time.sleep(0.5)  # Pequeña pausa entre intentos