#!/usr/bin/env python3
"""
Script de reconocimiento ULTRA-RÁPIDO para CTFs
Ejecuta múltiples herramientas en paralelo
"""

import subprocess
import threading
import sys
import os
from concurrent.futures import ThreadPoolExecutor, as_completed
import socket
import requests
import time

class FastRecon:
    def __init__(self, target):
        self.target = target
        self.results = {}
        self.lock = threading.Lock()
        
    def run_command(self, cmd, name):
        """Ejecuta comando y guarda resultado"""
        try:
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
            with self.lock:
                self.results[name] = result.stdout
            print(f"[+] {name} completado")
        except Exception as e:
            print(f"[-] Error en {name}: {e}")
    
    def port_scan(self):
        """Escaneo de puertos ultra-rápido"""
        print(f"[*] Escaneando puertos en {self.target}...")
        open_ports = []
        
        def scan_port(port):
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(0.5)
            result = sock.connect_ex((self.target, port))
            sock.close()
            if result == 0:
                return port
            return None
        
        # Escanear puertos comunes en paralelo
        common_ports = [21, 22, 23, 25, 53, 80, 110, 111, 135, 139, 143, 443, 445, 
                       993, 995, 1723, 3306, 3389, 5900, 8080, 8443, 8000, 9000]
        
        with ThreadPoolExecutor(max_workers=50) as executor:
            futures = [executor.submit(scan_port, port) for port in range(1, 65536)]
            for future in as_completed(futures):
                port = future.result()
                if port:
                    open_ports.append(port)
                    print(f"[+] Puerto {port} abierto")
        
        return open_ports
    
    def web_enum(self):
        """Enumeración web rápida"""
        protocols = ['http', 'https']
        paths = ['/robots.txt', '/.git', '/.env', '/admin', '/login', '/api', 
                '/backup', '/test', '/debug', '/.DS_Store', '/wp-admin']
        
        for proto in protocols:
            for path in paths:
                try:
                    url = f"{proto}://{self.target}{path}"
                    r = requests.get(url, timeout=2, verify=False)
                    if r.status_code != 404:
                        print(f"[+] Encontrado: {url} - Status: {r.status_code}")
                except:
                    pass
    
    def run_all(self):
        """Ejecuta todo en paralelo"""
        print(f"\n[*] INICIANDO RECONOCIMIENTO TOTAL EN: {self.target}\n")
        
        commands = {
            "nmap_fast": f"nmap -sV -sC -T5 -p- {self.target}",
            "nikto": f"nikto -h {self.target} -C all",
            "dirb": f"dirb http://{self.target} -r -z 10",
            "dns_enum": f"dnsrecon -d {self.target}",
            "whois": f"whois {self.target}",
            "traceroute": f"traceroute {self.target}"
        }
        
        threads = []
        
        # Lanzar escaneo de puertos
        t = threading.Thread(target=self.port_scan)
        t.start()
        threads.append(t)
        
        # Lanzar enumeración web
        t = threading.Thread(target=self.web_enum)
        t.start()
        threads.append(t)
        
        # Lanzar comandos
        for name, cmd in commands.items():
            t = threading.Thread(target=self.run_command, args=(cmd, name))
            t.start()
            threads.append(t)
        
        # Esperar a que terminen
        for t in threads:
            t.join()
        
        print("\n[+] RECONOCIMIENTO COMPLETADO!")
        return self.results

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Uso: {sys.argv[0]} <target>")
        sys.exit(1)
    
    target = sys.argv[1]
    recon = FastRecon(target)
    results = recon.run_all()
    
    # Guardar resultados
    with open(f"recon_{target}.txt", "w") as f:
        for name, result in results.items():
            f.write(f"\n{'='*50}\n{name}\n{'='*50}\n{result}\n")
    
    print(f"\n[+] Resultados guardados en recon_{target}.txt")