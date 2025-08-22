#!/usr/bin/env python3
import socket
import time

def connect_to_oracle():
    """Conecta al oráculo RSA"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('titan.picoctf.net', 55470))
    time.sleep(0.5)
    return s

def get_initial_info(s):
    """Obtiene la información inicial del oráculo"""
    # Leer el banner inicial
    data = s.recv(4096).decode()
    print("Banner inicial:")
    print(data)
    return data

def send_command(s, command):
    """Envía un comando al oráculo"""
    s.send((command + '\n').encode())
    time.sleep(0.5)
    response = s.recv(4096).decode()
    return response

# Leer password.enc
with open('/workspace/password.enc', 'r') as f:
    password_enc = int(f.read().strip())

print("=" * 70)
print("ATAQUE AL ORÁCULO RSA")
print("=" * 70)
print(f"\nPassword cifrado: {password_enc}")

# Conectar al oráculo
print("\n[1] Conectando al oráculo...")
s = connect_to_oracle()
initial = get_initial_info(s)

# Analizar el menú
print("\n[2] Analizando opciones del oráculo...")
if 'E)ncrypt' in initial or 'encrypt' in initial.lower():
    print("  - Opción de cifrado disponible")
if 'D)ecrypt' in initial or 'decrypt' in initial.lower():
    print("  - Opción de descifrado disponible")

# Primero necesitamos obtener n y e
print("\n[3] Obteniendo parámetros RSA (n, e)...")
print("    Enviando 'E' para cifrar y obtener información...")

# Enviar E para encrypt
response = send_command(s, 'E')
print(f"Respuesta: {response[:200]}...")

# Enviar un mensaje de prueba para obtener n
test_msg = "2"  # Usaremos 2 para nuestro ataque
response = send_command(s, test_msg)
print(f"Respuesta al cifrar '2': {response[:200]}...")

# Extraer n y e de la respuesta o del comportamiento
# El formato puede variar, intentemos diferentes aproximaciones

s.close()

print("\n[4] Reconectando para el ataque real...")
s = connect_to_oracle()
initial = get_initial_info(s)

print("\n[5] Estrategia de ataque:")
print("    - El oráculo rechaza descifrar password_enc directamente")
print("    - Pero podemos enviar password_enc * 2^e mod n")
print("    - Esto nos dará password * 2")
print("    - Luego dividimos por 2")

# Intentar descifrar directamente (debería fallar)
print("\n[6] Intentando descifrar password_enc directamente (debería fallar)...")
response = send_command(s, 'D')
response = send_command(s, str(password_enc))
print(f"Respuesta: {response}")

if 'password' in response.lower() or 'cannot' in response.lower() or 'forbidden' in response.lower():
    print("    ✓ Como esperado, el oráculo rechaza descifrar la contraseña")

s.close()

print("\n" + "=" * 70)
print("PLAN DE ATAQUE DETALLADO:")
print("=" * 70)
print("""
1. Obtener n del oráculo (cifrando un mensaje conocido)
2. Calcular 2^e mod n (e generalmente es 65537)
3. Calcular: modified = (password_enc * 2^e) mod n
4. Enviar 'modified' al oráculo para descifrar
5. Obtener: password * 2 mod n
6. Si es par, dividir por 2
7. Si es impar, sumar n y dividir por 2
8. Convertir a hex y usar como clave AES para descifrar secret.enc
""")

print("\nNOTA: El script interactivo completo está en rsa_oracle_interactive.py")