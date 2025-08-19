#!/bin/bash
# Scanner web ultra-rápido para CTFs

TARGET=$1
if [ -z "$TARGET" ]; then
    echo "Uso: $0 <target>"
    exit 1
fi

echo "[*] ESCANEO WEB RÁPIDO: $TARGET"
echo "================================"

# Escaneo de puertos web en paralelo
echo "[*] Escaneando puertos web..."
for port in 80 443 8080 8443 8000 3000 5000 9000; do
    timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null && echo "[+] Puerto $port abierto" &
done
wait

# Enumeración de directorios común
echo -e "\n[*] Enumeración de directorios..."
DIRS="admin login wp-admin administrator phpmyadmin test backup api config .git .env debug console shell cmd upload uploads files documents download downloads database db sql dump temp tmp cache includes inc src lib vendor node_modules bower_components assets static public private secret hidden system cgi-bin scripts"

for dir in $DIRS; do
    for proto in http https; do
        curl -s -o /dev/null -w "%{http_code}" "$proto://$TARGET/$dir" 2>/dev/null | grep -q "200\|301\|302\|401\|403" && echo "[+] Encontrado: $proto://$TARGET/$dir" &
    done
done
wait

# Búsqueda de archivos sensibles
echo -e "\n[*] Buscando archivos sensibles..."
FILES="robots.txt sitemap.xml crossdomain.xml .htaccess .htpasswd web.config config.php wp-config.php configuration.php config.inc.php settings.php database.php db.php .env .git/HEAD .svn/entries .DS_Store Thumbs.db phpinfo.php info.php test.php index.php.bak index.php~ backup.sql dump.sql database.sql db.sql users.sql .bash_history .mysql_history .psql_history id_rsa id_rsa.pub authorized_keys known_hosts passwd shadow"

for file in $FILES; do
    for proto in http https; do
        response=$(curl -s -o /dev/null -w "%{http_code}" "$proto://$TARGET/$file" 2>/dev/null)
        if [ "$response" == "200" ]; then
            echo "[+] ARCHIVO ENCONTRADO: $proto://$TARGET/$file"
        fi &
    done
done
wait

# Detección de tecnologías
echo -e "\n[*] Detectando tecnologías..."
curl -s -I "http://$TARGET" 2>/dev/null | grep -i "server\|x-powered-by\|x-generator" | while read line; do
    echo "[+] $line"
done

echo -e "\n[*] Escaneo completado!"