#!/bin/bash

echo "========================================="
echo "PROBANDO DIFERENTES OPCIONES DE DESCIFRADO"
echo "========================================="

# Opciones de contraseña
passwords=(
    "9cd7db59691"
    "09cd7db59691"
    "139afb6b2d22"
    "0139afb6b2d22"
)

echo -e "\nProbando con openssl enc -pass pass:..."
for pass in "${passwords[@]}"; do
    echo -e "\n--- Contraseña: $pass ---"
    openssl enc -aes-256-cbc -d -in /workspace/secret.enc -pass pass:$pass 2>&1 | head -5
    if [ $? -eq 0 ]; then
        echo "✓ Posible éxito"
    fi
done

echo -e "\n========================================="
echo "Probando con clave hexadecimal directa..."
echo "========================================="

# Probar como clave directa con diferentes IVs
keys=(
    "9cd7db5969100000000000000000000000000000000000000000000000000000"
    "09cd7db596910000000000000000000000000000000000000000000000000000"
    "139afb6b2d220000000000000000000000000000000000000000000000000000"
)

ivs=(
    "00000000000000000000000000000000"
    "0102030405060708090a0b0c0d0e0f10"
)

for key in "${keys[@]}"; do
    for iv in "${ivs[@]}"; do
        echo -e "\n--- Key: ${key:0:20}... IV: ${iv:0:16}... ---"
        result=$(openssl enc -aes-256-cbc -d -in /workspace/secret.enc -K $key -iv $iv 2>&1)
        if [[ $result == *"picoCTF"* ]]; then
            echo "🏁 ¡BANDERA ENCONTRADA!"
            echo "$result"
            exit 0
        elif [ $? -eq 0 ]; then
            echo "Descifrado exitoso pero sin bandera"
            echo "$result" | head -2
        fi
    done
done

echo -e "\n========================================="
echo "Probando interpretación ASCII de la contraseña..."
echo "========================================="

# Convertir hex a ASCII y usar como contraseña
echo -n "9cd7db59691" | xxd -r -p > /tmp/pass.bin 2>/dev/null
if [ -s /tmp/pass.bin ]; then
    openssl enc -aes-256-cbc -d -in /workspace/secret.enc -pass file:/tmp/pass.bin 2>&1 | head -5
fi

echo -e "\nFin de las pruebas"