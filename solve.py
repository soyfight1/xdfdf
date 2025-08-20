#!/usr/bin/env python3

# Texto cifrado
cipher = "picoCTF{w1{1wq84fb<1>49}"

# Convertir a lista para modificar
flag = list(cipher)

# Los primeros 8 caracteres están sin modificar (picoCTF{)
# Caracteres 8-22 necesitan ser revertidos
for i in range(8, 23):
    if i % 2 == 0:  # Índice par - se le sumó 5, ahora restamos 5
        flag[i] = chr(ord(flag[i]) - 5)
    else:  # Índice impar - se le restó 2, ahora sumamos 2
        flag[i] = chr(ord(flag[i]) + 2)

# Carácter 23 sin modificar

print("FLAG ENCONTRADA:", ''.join(flag))