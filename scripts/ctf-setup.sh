#!/bin/bash

# CTF ULTIMATE SETUP SCRIPT - VELOCIDAD MÁXIMA
set -e

echo "[*] INICIANDO CONFIGURACIÓN DE ARSENAL CTF..."

# Actualizar sistema
echo "[+] Actualizando repositorios..."
apt-get update -qq 2>/dev/null || sudo apt-get update -qq

# Instalar herramientas esenciales en paralelo
echo "[+] Instalando herramientas base..."
(
    # Herramientas de red y reconocimiento
    apt-get install -y nmap masscan netcat-openbsd socat tcpdump wireshark tshark dnsutils whois curl wget git python3 python3-pip ruby perl golang nodejs npm php &
    
    # Herramientas de análisis
    apt-get install -y binutils gdb strace ltrace file strings hexdump xxd radare2 &
    
    # Herramientas de fuerza bruta y cracking
    apt-get install -y john hashcat hydra medusa &
    
    # Herramientas web
    apt-get install -y nikto dirb gobuster wfuzz sqlmap &
    
    # Utilidades
    apt-get install -y tmux vim nano htop net-tools openssh-client smbclient ftp telnet &
    
    wait
) 2>/dev/null || (
    sudo apt-get install -y nmap masscan netcat-openbsd socat tcpdump dnsutils whois curl wget git python3 python3-pip ruby perl golang nodejs npm php binutils gdb strace ltrace file strings hexdump xxd john hydra tmux vim nano htop net-tools openssh-client smbclient ftp telnet 2>/dev/null
)

# Instalar herramientas Python
echo "[+] Instalando herramientas Python..."
pip3 install --upgrade pip 2>/dev/null || sudo pip3 install --upgrade pip
pip3 install pwntools requests beautifulsoup4 paramiko scapy impacket pycryptodome pillow numpy matplotlib 2>/dev/null || sudo pip3 install pwntools requests beautifulsoup4 paramiko scapy impacket pycryptodome pillow numpy matplotlib

# Clonar repositorios útiles
echo "[+] Clonando herramientas adicionales..."
cd /workspace/tools

# SecLists para wordlists
[ ! -d "SecLists" ] && git clone --depth 1 https://github.com/danielmiessler/SecLists.git &

# LinPEAS/WinPEAS para escalación de privilegios
[ ! -d "PEASS-ng" ] && git clone --depth 1 https://github.com/carlospolop/PEASS-ng.git &

# Metasploit (si no está instalado)
if ! command -v msfconsole &> /dev/null; then
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall 2>/dev/null &
fi

wait

echo "[+] Creando scripts de automatización..."
cd /workspace/scripts

# Script de reconocimiento rápido
cat > recon.sh << 'EOF'
#!/bin/bash
TARGET=$1
echo "[*] Reconocimiento rápido de $TARGET"
echo "[+] Escaneo de puertos..."
nmap -sS -sV -sC -p- -T4 --min-rate=1000 -oA /workspace/results/nmap_$TARGET $TARGET &
masscan -p1-65535 $TARGET --rate=1000 -oL /workspace/results/masscan_$TARGET.txt &
echo "[+] Enumeración web..."
gobuster dir -u http://$TARGET -w /workspace/tools/SecLists/Discovery/Web-Content/common.txt -t 50 -o /workspace/results/gobuster_$TARGET.txt &
nikto -h $TARGET -o /workspace/results/nikto_$TARGET.txt &
wait
echo "[!] Reconocimiento completado. Resultados en /workspace/results/"
EOF

chmod +x recon.sh

# Script de explotación web
cat > webpwn.sh << 'EOF'
#!/bin/bash
URL=$1
echo "[*] Análisis web de $URL"
sqlmap -u "$URL" --batch --random-agent --level=5 --risk=3 --threads=10 &
wfuzz -c -z file,/workspace/tools/SecLists/Discovery/Web-Content/raft-large-directories.txt --hc 404 "$URL/FUZZ" &
wait
EOF

chmod +x webpwn.sh

# Script de fuerza bruta
cat > brute.sh << 'EOF'
#!/bin/bash
SERVICE=$1
TARGET=$2
hydra -L /workspace/tools/SecLists/Usernames/top-usernames-shortlist.txt -P /workspace/tools/SecLists/Passwords/Common-Credentials/10-million-password-list-top-10000.txt $TARGET $SERVICE -t 64 -V
EOF

chmod +x brute.sh

echo "[✓] ARSENAL CTF CONFIGURADO Y LISTO PARA BATALLA"
echo ""
echo "Herramientas disponibles:"
echo "  - Reconocimiento: nmap, masscan, gobuster, nikto"
echo "  - Explotación: metasploit, sqlmap, hydra"
echo "  - Análisis: gdb, radare2, pwntools"
echo "  - Scripts custom: recon.sh, webpwn.sh, brute.sh"
echo ""
echo "¡LISTO PARA DESTRUIR LA COMPETENCIA!"