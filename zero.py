#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

p = remote(HOST, PORT)

# Diálogo
p.recvuntil(b'From Zero to Hero')
p.sendline(b'y')
p.recvuntil(b'Really?')
p.sendline(b'y')

# Leak
p.recvuntil(b'Take this: ')
leak = p.recvline().strip()
print(f"Leak: {leak}")

# Intentar recibir más
try:
    more = p.recv(1024, timeout=2)
    print(f"After leak: {more}")
except:
    print("Nothing after leak")

# Si dice "No? Then why are you even here?" significa que espera otra respuesta
p.sendline(b'yes')

try:
    response = p.recv(1024, timeout=2)
    print(f"After yes: {response}")
except:
    pass

# Probar el menú
p.sendline(b'1')
try:
    response = p.recv(1024, timeout=2)
    print(f"Option 1: {response}")
except:
    pass

p.sendline(b'100')
try:
    response = p.recv(1024, timeout=2)
    print(f"Size: {response}")
except:
    pass

p.sendline(b'AAAA')
try:
    response = p.recv(1024, timeout=2)
    print(f"After data: {response}")
except:
    pass

# Intentar obtener flag directamente
p.sendline(b'cat flag.txt')
try:
    flag = p.recvall(timeout=2)
    if b'pico' in flag:
        print(f"FLAG FOUND: {flag}")
except:
    pass

p.close()