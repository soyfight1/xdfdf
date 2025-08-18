#!/bin/bash

# ENUMERACIÓN ULTRARRÁPIDA
TARGET=$1

if [ -z "$TARGET" ]; then
    echo "Uso: $0 <target>"
    exit 1
fi

echo "[*] ENUMERACIÓN RÁPIDA DE $TARGET"
echo "================================"

# Escaneo paralelo masivo
(
    # Puertos TCP
    echo "[+] Escaneando TCP..."
    masscan -p1-65535 $TARGET --rate=10000 -oL /tmp/masscan.txt 2>/dev/null &
    
    # DNS
    echo "[+] Enumeración DNS..."
    host $TARGET 2>/dev/null
    nslookup $TARGET 2>/dev/null
    dig $TARGET ANY 2>/dev/null &
    
    # Web fingerprinting si hay puerto 80/443
    echo "[+] Fingerprinting web..."
    curl -I http://$TARGET 2>/dev/null &
    curl -I https://$TARGET 2>/dev/null &
    
    # Búsqueda de subdominios
    echo "[+] Buscando subdominios..."
    for sub in www mail ftp admin portal api dev test staging prod; do
        host $sub.$TARGET 2>/dev/null | grep "has address" &
    done
    
    wait
) 

# Parsear resultados de masscan
if [ -f /tmp/masscan.txt ]; then
    echo ""
    echo "[!] PUERTOS ABIERTOS:"
    grep "open" /tmp/masscan.txt | awk '{print $3}' | sort -n | uniq
fi

echo ""
echo "[✓] Enumeración completada"