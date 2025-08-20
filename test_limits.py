#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'error'

p = remote(HOST, PORT)

# Dialog
p.recvuntil(b'From Zero to Hero')
p.sendline(b'y')
p.recvuntil(b'Really?')
p.sendline(b'y')

# Leak
p.recvuntil(b'Take this: ')
leak = p.recvline().strip()
print(f"Leak: {leak}")

# Menu
p.recvuntil(b'>')

# Test how many we can allocate
count = 0
while True:
    try:
        p.sendline(b'1')
        response = p.recvuntil(b'length', timeout=1)
        
        if b'too many' in response.lower():
            print(f"Hit limit at {count} allocations")
            print(f"Response: {response}")
            break
            
        p.sendline(b'16')
        p.recvuntil(b'description')
        p.sendline(b'A' * 16)
        p.recvuntil(b'>')
        count += 1
        print(f"Allocated {count}")
        
    except EOFError:
        print(f"Connection closed after {count} allocations")
        break
    except:
        print(f"Error after {count} allocations")
        break

p.close()