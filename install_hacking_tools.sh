#!/bin/bash
# Script de instalación RÁPIDA de herramientas de hacking

echo "[*] Instalando arsenal completo de pentesting..."

# Instalación en paralelo para máxima velocidad
{
    # Herramientas de red y escaneo
    sudo apt install -y nmap masscan netcat-traditional socat tcpdump wireshark tshark &
    
    # Web hacking
    sudo apt install -y nikto dirb gobuster sqlmap wfuzz curl wget hydra john hashcat &
    
    # Explotación
    sudo apt install -y metasploit-framework exploitdb searchsploit &
    
    # Análisis binario
    sudo apt install -y gdb radare2 binwalk hexedit strace ltrace &
    
    # Python y librerías
    sudo apt install -y python3-pip python3-dev python3-venv &
    
    # Herramientas adicionales
    sudo apt install -y git vim tmux net-tools dnsutils whois &
} 2>/dev/null

wait

# Instalar herramientas Python en paralelo
pip3 install --upgrade pip setuptools wheel &
pip3 install pwntools requests beautifulsoup4 paramiko scapy impacket &
pip3 install cryptography pycryptodome numpy sympy z3-solver &

# Clonar repositorios útiles
mkdir -p /workspace/tools
cd /workspace/tools
{
    git clone https://github.com/danielmiessler/SecLists.git &
    git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git &
    git clone https://github.com/sherlock-project/sherlock.git &
    git clone https://github.com/Gallopsled/pwntools.git &
} 2>/dev/null

wait

echo "[+] Arsenal completo instalado y listo para la batalla!"