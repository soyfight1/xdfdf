#!/bin/bash
# Script para probar tokens automáticamente

echo "Probando tokens contra el servidor..."

while IFS= read -r token; do
    echo "Probando: $token"
    echo "$token" | timeout 2 nc verbal-sleep.picoctf.net 60195 2>/dev/null | grep -q "Congratulations" && {
        echo "¡TOKEN CORRECTO ENCONTRADO!: $token"
        echo "$token" | nc verbal-sleep.picoctf.net 60195
        break
    }
done < /workspace/all_tokens.txt
