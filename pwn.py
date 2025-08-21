#!/usr/bin/env python3
from pwn import *

context.log_level = 'debug'
p = remote('jupiter.challenges.picoctf.org', 9521)

# Recibir todo el welcome
print(p.recvuntil(b'name?'))
p.sendline(b'test')

# Ver menú
print(p.recvuntil(b'>'))

# Intentar buy y ver qué pide
p.sendline(b'1')
response = p.recvuntil(b'?')
print(f"After buy: {response}")

# Si pide "How much?"
if b'How much' in response:
    p.sendline(b'20')
    
    # Ver si pide flavor
    try:
        response2 = p.recvuntil(b'>', timeout=2)
        print(f"After size: {response2}")
        
        if b'flavor' in response2:
            print("[!] Server asks for flavor!")
            # No enviar nada más, ya enviamos size
        else:
            print("[!] Server does NOT ask for flavor!")
    except:
        print("[!] Timeout - server might ask for flavor")
        p.sendline(b'test')  # Enviar algo por si acaso

# Ver estado
print(p.recvuntil(b'>', timeout=2))

p.close()