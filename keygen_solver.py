#!/usr/bin/env python3
import hashlib

# El programa espera una entrada y genera una flag basada en ella
# La flag tiene el formato: picoCTF{br1ng_y0ur_0wn_k3y_XXXXXXXX}

def generate_key(user_input):
    # El programa usa MD5 del input
    md5_hash = hashlib.md5(user_input.encode()).hexdigest()
    # Toma los primeros 8 caracteres del hash
    key_suffix = md5_hash[:8]
    return f"picoCTF{{br1ng_y0ur_0wn_k3y_{key_suffix}}}"

# Intentar con diferentes entradas
test_inputs = [
    "FRASER",
    "MORTON", 
    "COOPER",
    "ANDERSON",
    "247d8a57"  # Este podría ser el hash directo
]

for inp in test_inputs:
    key = generate_key(inp)
    print(f"Input: {inp} -> Key: {key}")
    
# También verificar si 247d8a57 es parte de un hash MD5 conocido
target = "247d8a57"
print(f"
Buscando entrada que produzca {target}...")

# Probar con nombres comunes
names = ["SMITH", "JOHNSON", "WILLIAMS", "BROWN", "JONES", "MILLER", "DAVIS", "GARCIA", "RODRIGUEZ", "WILSON"]
for name in names:
    md5 = hashlib.md5(name.encode()).hexdigest()
    if md5.startswith(target):
        print(f"Encontrado: {name} -> {md5}")
