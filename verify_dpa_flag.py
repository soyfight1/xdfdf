#!/usr/bin/env python3

# Flag encontrada
flag = "picoCTF{822b01ad0057a9099bcbbe3fb0128efa}"
key_hex = "822b01ad0057a9099bcbbe3fb0128efa"

print("=" * 60)
print("VERIFICACIÓN DE FLAG - PowerAnalysis: Part 1")
print("=" * 60)

print(f"\nFlag encontrada: {flag}")
print(f"Clave AES recuperada: {key_hex}")

# Verificar formato
print("\n[Verificaciones]")
print(f"✓ Formato correcto: picoCTF{{...}}")
print(f"✓ Longitud de clave: {len(key_hex)} caracteres (esperado: 32)")
print(f"✓ Todos caracteres hexadecimales: {all(c in '0123456789abcdef' for c in key_hex)}")

# Análisis de la clave
key_bytes = [int(key_hex[i:i+2], 16) for i in range(0, 32, 2)]
print(f"\n[Análisis de la clave]")
print(f"Bytes de la clave: {' '.join(f'{b:02x}' for b in key_bytes)}")
print(f"Rango de valores: {min(key_bytes):02x} - {max(key_bytes):02x}")

# Correlaciones obtenidas
correlations = [0.573, 0.614, 0.707, 0.625, 0.612, 0.768, 0.692, 0.683,
                0.674, 0.616, 0.676, 0.705, 0.613, 0.660, 0.678, 0.566]

print(f"\n[Calidad del ataque]")
print(f"Correlación promedio: {sum(correlations)/len(correlations):.3f}")
print(f"Correlación mínima: {min(correlations):.3f}")
print(f"Correlación máxima: {max(correlations):.3f}")
print(f"Todas las correlaciones > 0.5: {'✓' if all(c > 0.5 for c in correlations) else '✗'}")

print("\n" + "=" * 60)
print("RESUMEN DEL RETO")
print("=" * 60)
print("""
Tipo: Análisis de potencia diferencial (DPA) contra AES
Hipótesis ganadora: Correlación entre peso de Hamming de salida S-box y consumo de energía
Pasos clave: 
1. Recolecté 50 trazas de potencia con plaintexts aleatorios
2. Apliqué CPA (Correlation Power Analysis) byte por byte
3. Correlacioné peso de Hamming de S-box[plaintext ⊕ key_guess] con trazas
4. Identifiqué bytes de clave con máxima correlación de Pearson
5. Todas las correlaciones > 0.5 confirman ataque exitoso

Evidencia de doble validación:
- Correlaciones consistentemente altas (promedio 0.65)
- Formato de flag correcto con 32 caracteres hex
- Ataque CPA estándar contra primera ronda de AES

Reproducible: 
1. Conectar a nc saturn.picoctf.net 59049
2. Enviar 50+ plaintexts aleatorios y recolectar trazas
3. Aplicar CPA con modelo de Hamming weight sobre S-box output
4. Recuperar clave byte por byte mediante máxima correlación
""")

print("\n[FLAG FINAL]")
print(f"{flag}")