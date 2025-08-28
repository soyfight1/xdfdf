# Solución Completa: Chronohack CTF

## Vulnerabilidad Identificada

El archivo `token_generator.py` contiene una vulnerabilidad crítica en la línea 6:

```python
random.seed(int(time.time() * 1000))  # seeding with current time
```

**Problema**: El generador de números aleatorios usa el timestamp actual en milisegundos como semilla. Esto es predecible y permite regenerar el mismo token si conocemos el momento exacto de generación.

## Cómo Funciona el Exploit

1. **El servidor genera un token** cuando te conectas usando `time.time() * 1000` como semilla
2. **Nosotros podemos generar el mismo token** usando el mismo timestamp
3. **El token tiene 20 caracteres** del alfabeto: `0-9A-Za-z`
4. **Tenemos 50 intentos** para adivinar el token correcto

## Scripts de Solución

### 1. Script Simple (Recomendado)

```python
#!/usr/bin/env python3
import random
import time

def get_random(length, seed_time):
    alphabet = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    random.seed(seed_time)
    s = ""
    for i in range(length):
        s += random.choice(alphabet)
    return s

# Generar token basado en el tiempo actual
current_time_ms = int(time.time() * 1000)

print("Tokens probables:")
for offset in range(-3, 4):  # ±3 segundos
    seed = current_time_ms + (offset * 1000)
    token = get_random(20, seed)
    marker = " <-- PRUEBA ESTE PRIMERO" if offset == 0 else ""
    print(f"Offset {offset:+2}s: {token}{marker}")
```

### 2. Uso Manual

1. **Ejecuta el script** justo antes de conectarte:
   ```bash
   python3 generate_token.py
   ```

2. **Conéctate al servidor**:
   ```bash
   nc verbal-sleep.picoctf.net 60195
   ```

3. **Copia y pega el token** con offset 0 primero

4. Si no funciona, prueba con offset -1, -2, +1, +2

### 3. Script Automático

```bash
#!/bin/bash
# Genera token y lo prueba automáticamente

# Obtener tiempo actual en milisegundos
current_ms=$(date +%s%3N)

# Generar token con Python
token=$(python3 -c "
import random
random.seed($current_ms)
alphabet = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
print(''.join(random.choice(alphabet) for _ in range(20)))
")

echo "Token generado: $token"
echo "$token" | nc verbal-sleep.picoctf.net 60195
```

## Por Qué Funciona

1. **Sincronización de tiempo**: El servidor y nosotros usamos el mismo tiempo Unix
2. **Ventana pequeña**: El token se genera cuando nos conectamos, así que el offset es mínimo
3. **Determinista**: Con la misma semilla, `random` genera la misma secuencia

## Notas Importantes

- **El servidor debe estar activo** (estado: RUNNING)
- **El tiempo debe estar sincronizado** (generalmente lo está en sistemas modernos)
- **Offset típico**: Entre -2 y +2 segundos funciona en la mayoría de casos

## Flag Esperada

Una vez que envíes el token correcto, recibirás:
```
Congratulations! You found the correct token.
picoCTF{[flag_aqui]}
```

## Lección de Seguridad

**NUNCA uses tiempo como semilla para generar tokens de seguridad**. Usa:
- `secrets.token_hex()` en Python
- `/dev/urandom` en sistemas Unix
- Generadores criptográficamente seguros