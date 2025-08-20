#!/usr/bin/env python3
import sympy

c = 3221397397487855538588354709079710034218446856924322201685962988373085999106520297445522472336372753730772681525922861947526687540676821038333864986323966287455711878766822591421154377412655244628649253874902523821091747156358907843124893818623641515650890879090175231228840303675414272576398501493258255342613890070669765615090568770005
n = 4295553506113769011052357450124625246952765493813029090755387165255909933702052664412292122457694680989705203382331408448025878071309408111447336427437111873017546532346071843472775668445631858526567625943244860875295053951101636120121112190517652042968016250556803718641361649884078969821967555032542017665588212971423495677042823686981024786
e = 65537

print("Factorizando n con sympy.factorint()...")
factors_dict = sympy.factorint(n)
print(f"Factores encontrados: {factors_dict}")

# Extraer lista de factores (con repeticiones)
factors = []
for prime, count in factors_dict.items():
    factors.extend([prime] * count)

print(f"\nTotal de factores: {len(factors)}")
print(f"Factores: {factors[:10]}...")  # Mostrar primeros 10

# Calcular phi(n) correctamente para factores repetidos
phi = n
for prime, count in factors_dict.items():
    phi = phi // prime * (prime - 1)

print(f"\nphi(n) calculado")

# Calcular d = e^-1 mod phi(n)
d = pow(e, -1, phi)
print(f"d = {d}")

# Descifrar
m = pow(c, d, n)
print(f"\nMensaje descifrado (decimal): {m}")

# Convertir a texto
hex_str = hex(m)[2:]
print(f"Hex: {hex_str}")

# Intentar diferentes decodificaciones
try:
    # Método 1: directo
    if len(hex_str) % 2:
        hex_str = '0' + hex_str
    message = bytes.fromhex(hex_str).decode('ascii')
    print(f"\nFLAG: {message}")
except Exception as e:
    print(f"Error método 1: {e}")
    
try:
    # Método 2: big endian
    message = m.to_bytes((m.bit_length() + 7) // 8, 'big').decode('ascii', errors='ignore')
    print(f"\nFLAG (big endian): {message}")
except Exception as e:
    print(f"Error método 2: {e}")

try:
    # Método 3: little endian
    message = m.to_bytes((m.bit_length() + 7) // 8, 'little').decode('ascii', errors='ignore')
    print(f"\nFLAG (little endian): {message}")
except Exception as e:
    print(f"Error método 3: {e}")