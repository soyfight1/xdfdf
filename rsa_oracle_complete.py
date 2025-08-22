#!/usr/bin/env python3
import socket
import time
import math

def connect_to_oracle():
    """Conecta al oráculo RSA"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('titan.picoctf.net', 55470))
    time.sleep(0.5)
    return s

def get_response(s):
    """Lee respuesta del servidor"""
    return s.recv(4096).decode()

def send_command(s, command):
    """Envía comando y obtiene respuesta"""
    s.send((command + '\n').encode())
    time.sleep(0.5)
    return get_response(s)

print("=" * 70)
print("ATAQUE COMPLETO AL ORÁCULO RSA")
print("=" * 70)

# Leer password cifrado
with open('/workspace/password.enc', 'r') as f:
    password_enc = int(f.read().strip())

print(f"\n[1] Password cifrado: {str(password_enc)[:50]}...")

# PASO 1: Obtener n cifrando múltiples mensajes
print("\n[2] Obteniendo el módulo n...")
s = connect_to_oracle()
initial = get_response(s)

# Cifrar 2 para obtener 2^e mod n
response = send_command(s, 'E')
response = send_command(s, '2')

# Extraer el ciphertext de la respuesta
lines = response.split('\n')
for i, line in enumerate(lines):
    if 'ciphertext' in line:
        # El ciphertext está en la siguiente línea o en la misma
        if 'm ^ e mod n)' in line:
            cipher_2 = int(line.split(')')[-1].strip())
        else:
            cipher_2 = int(lines[i+1].strip())
        break

print(f"  2^e mod n = {str(cipher_2)[:50]}...")
s.close()

# Cifrar 3 para obtener 3^e mod n
s = connect_to_oracle()
get_response(s)
send_command(s, 'E')
response = send_command(s, '3')
lines = response.split('\n')
for i, line in enumerate(lines):
    if 'ciphertext' in line:
        if 'm ^ e mod n)' in line:
            cipher_3 = int(line.split(')')[-1].strip())
        else:
            cipher_3 = int(lines[i+1].strip())
        break

print(f"  3^e mod n = {str(cipher_3)[:50]}...")
s.close()

# Cifrar -1 (o un número grande) para ayudar a encontrar n
s = connect_to_oracle()
get_response(s)
send_command(s, 'E')
response = send_command(s, '4')
lines = response.split('\n')
for i, line in enumerate(lines):
    if 'ciphertext' in line:
        if 'm ^ e mod n)' in line:
            cipher_4 = int(line.split(')')[-1].strip())
        else:
            cipher_4 = int(lines[i+1].strip())
        break
s.close()

# Estimar n usando GCD (no siempre funciona, pero vale la pena intentar)
# n divide a (2^e - cipher_2), (3^e - cipher_3), etc.
# Pero e es típicamente 65537
e = 65537

print(f"\n[3] Calculando n con e = {e}...")

# Para RSA, sabemos que cipher_i = i^e mod n
# Por lo tanto, n divide a (i^e - cipher_i)
# Podemos usar GCD para encontrar n

# Método alternativo: usar el hecho de que conocemos los cifrados
# y tratar de encontrar n mediante factorización o estimación

# PASO 2: Realizar el ataque de maleabilidad
print("\n[4] Ejecutando ataque de maleabilidad RSA...")

# Calcular password_enc * cipher_2 mod n
# Pero necesitamos n primero...

# Método simplificado: enviar directamente password_enc * cipher_2
# y dejar que el servidor maneje el módulo

modified_ciphertext = password_enc * cipher_2

print(f"  Texto cifrado modificado: {str(modified_ciphertext)[:50]}...")

# Enviar el texto cifrado modificado al oráculo
s = connect_to_oracle()
get_response(s)
response = send_command(s, 'D')
response = send_command(s, str(modified_ciphertext))

print(f"\n[5] Respuesta del oráculo al descifrar el texto modificado:")
print(f"  {response[:200]}...")

# Extraer el resultado
if 'decrypted' in response.lower() or 'hex' in response.lower():
    lines = response.split('\n')
    for line in lines:
        if 'hex' in line.lower() or '0x' in line.lower():
            # Extraer el valor hex
            if '0x' in line:
                hex_val = line.split('0x')[1].strip()
            else:
                # Buscar el valor después de 'hex'
                parts = line.split(':')
                if len(parts) > 1:
                    hex_val = parts[1].strip()
                    
    print(f"  Valor hex obtenido: {hex_val}")
    
    # Convertir de hex a entero
    decrypted_value = int(hex_val, 16)
    print(f"  Valor decimal: {decrypted_value}")
    
    # Dividir por 2 para obtener la contraseña original
    password = decrypted_value // 2
    print(f"\n[6] Contraseña recuperada (decimal): {password}")
    
    # Convertir a hex para usar con OpenSSL
    password_hex = hex(password)[2:]
    if len(password_hex) % 2:
        password_hex = '0' + password_hex
    
    print(f"  Contraseña (hex): {password_hex}")
    
    # Guardar la contraseña
    with open('/workspace/password_recovered.txt', 'w') as f:
        f.write(password_hex)
    
    print(f"\n[7] Contraseña guardada en password_recovered.txt")
    print(f"    Ahora usar: openssl enc -aes-256-cbc -d -in secret.enc -pass pass:{password_hex}")

s.close()

print("\n" + "=" * 70)
print("SIGUIENTE PASO:")
print("Ejecutar: ./decrypt_final.sh")
print("=" * 70)