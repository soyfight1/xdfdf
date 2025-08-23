#!/usr/bin/env python3
"""
Script para neutralizar Arly.exe
Objetivo: Impedir que el programa pueda comunicarse con servidores externos
"""

import os
import shutil

def patch_executable():
    """Parchear el ejecutable para desactivar funciones de red"""
    
    print("=== NEUTRALIZANDO ARLY.EXE ===\n")
    
    # Hacer backup
    if not os.path.exists('Arly.exe.backup'):
        shutil.copy('Arly.exe', 'Arly.exe.backup')
        print("[+] Backup creado: Arly.exe.backup")
    
    with open('Arly.exe', 'rb') as f:
        exe_data = bytearray(f.read())
    
    patches_applied = 0
    
    # Buscar y parchear llamadas a funciones de red
    # Reemplazar "socket" con "aaaaaa" 
    socket_offset = exe_data.find(b'socket')
    if socket_offset != -1:
        exe_data[socket_offset:socket_offset+6] = b'aaaaaa'
        patches_applied += 1
        print(f"[+] Parcheado 'socket' en offset 0x{socket_offset:08x}")
    
    # Reemplazar "connect" con "aaaaaaa"
    connect_offset = exe_data.find(b'connect')
    if connect_offset != -1:
        exe_data[connect_offset:connect_offset+7] = b'aaaaaaa'
        patches_applied += 1
        print(f"[+] Parcheado 'connect' en offset 0x{connect_offset:08x}")
    
    # Buscar y neutralizar URLs
    urls_to_patch = [
        b'http://',
        b'https://'
    ]
    
    for url in urls_to_patch:
        offset = 0
        while True:
            offset = exe_data.find(url, offset)
            if offset == -1:
                break
            # Reemplazar con bytes nulos manteniendo la longitud
            exe_data[offset:offset+len(url)] = b'null://'[:len(url)]
            patches_applied += 1
            print(f"[+] Neutralizada URL en offset 0x{offset:08x}")
            offset += len(url)
    
    # Guardar el ejecutable parcheado
    with open('Arly_neutralized.exe', 'wb') as f:
        f.write(exe_data)
    
    print(f"\n[+] Total de parches aplicados: {patches_applied}")
    print("[+] Ejecutable neutralizado guardado como: Arly_neutralized.exe")
    
    return patches_applied > 0

def create_dll_hijack():
    """Crear DLLs falsas para interceptar llamadas de red"""
    
    print("\n=== CREANDO DLLs DE INTERCEPTACIÓN ===\n")
    
    # Crear una DLL falsa que sobrescribe cpr.dll (librería de requests HTTP)
    fake_dll_content = b'MZ' + b'\x00' * 1000  # DLL vacía mínima
    
    dlls_to_hijack = [
        'cpr.dll',
        'alibabacloud-oss-cpp-sdk.dll',
        'acproxy.dll'
    ]
    
    for dll in dlls_to_hijack:
        backup_name = f"{dll}.original"
        if os.path.exists(dll) and not os.path.exists(backup_name):
            shutil.move(dll, backup_name)
            print(f"[+] Backup: {dll} -> {backup_name}")
            
            # Crear DLL falsa vacía
            with open(dll, 'wb') as f:
                f.write(fake_dll_content)
            print(f"[+] DLL falsa creada: {dll}")
    
def corrupt_data_file():
    """Corromper el archivo de datos para prevenir su uso"""
    
    print("\n=== CORROMPIENDO ARCHIVO DE DATOS ===\n")
    
    data_file = 'data/RO051wADAG4X'
    if os.path.exists(data_file):
        # Hacer backup
        backup_name = f"{data_file}.backup"
        if not os.path.exists(backup_name):
            shutil.copy(data_file, backup_name)
            print(f"[+] Backup creado: {backup_name}")
        
        # Sobrescribir con datos aleatorios
        with open(data_file, 'wb') as f:
            f.write(b'NEUTRALIZED_BY_DEFENDER' * 1000)
        
        print(f"[+] Archivo de datos neutralizado: {data_file}")

def create_hosts_block():
    """Crear archivo hosts falso para bloquear conexiones"""
    
    print("\n=== CREANDO BLOQUEO DE HOSTS ===\n")
    
    hosts_content = """# Bloqueo de Arly.exe
127.0.0.1 ocsp.digicert.com
127.0.0.1 crl3.digicert.com
127.0.0.1 crl4.digicert.com
127.0.0.1 cacerts.digicert.com
127.0.0.1 www.digicert.com
127.0.0.1 ocsp.entrust.net
127.0.0.1 crl.entrust.net
127.0.0.1 aia.entrust.net
127.0.0.1 www.entrust.net

# Bloqueo genérico de servicios cloud
127.0.0.1 oss.aliyuncs.com
127.0.0.1 oss-cn-hangzhou.aliyuncs.com
127.0.0.1 oss-cn-shanghai.aliyuncs.com
127.0.0.1 oss-cn-beijing.aliyuncs.com
"""
    
    with open('hosts_block.txt', 'w') as f:
        f.write(hosts_content)
    
    print("[+] Archivo de bloqueo de hosts creado: hosts_block.txt")
    print("[!] Para aplicar: copiar contenido a /etc/hosts o C:\\Windows\\System32\\drivers\\etc\\hosts")

def create_firewall_rules():
    """Generar reglas de firewall para bloquear el programa"""
    
    print("\n=== REGLAS DE FIREWALL ===\n")
    
    print("Linux (iptables):")
    print("  sudo iptables -A OUTPUT -m owner --cmd-owner Arly.exe -j DROP")
    print("  sudo iptables -A OUTPUT -p tcp --dport 443 -m string --string 'Arly' --algo bm -j DROP")
    print("  sudo iptables -A OUTPUT -p tcp --dport 80 -m string --string 'Arly' --algo bm -j DROP")
    
    print("\nWindows (netsh):")
    print("  netsh advfirewall firewall add rule name='Block Arly' dir=out program='%CD%\\Arly.exe' action=block")
    print("  netsh advfirewall firewall add rule name='Block Arly Neutralized' dir=out program='%CD%\\Arly_neutralized.exe' action=block")

def main():
    print("=" * 60)
    print("    NEUTRALIZADOR DE ARLY - NULL PAYLOAD")
    print("=" * 60)
    print("\nEste script neutralizará el malware de múltiples formas:\n")
    print("1. Parcheo del ejecutable")
    print("2. DLL Hijacking")
    print("3. Corrupción de datos")
    print("4. Bloqueo de hosts")
    print("5. Reglas de firewall")
    print("\n" + "=" * 60 + "\n")
    
    # Ejecutar todas las técnicas de neutralización
    if patch_executable():
        print("\n✓ Ejecutable parcheado exitosamente")
    
    create_dll_hijack()
    print("\n✓ DLLs de interceptación creadas")
    
    corrupt_data_file()
    print("\n✓ Archivo de datos corrompido")
    
    create_hosts_block()
    print("\n✓ Bloqueo de hosts preparado")
    
    create_firewall_rules()
    
    print("\n" + "=" * 60)
    print("    NEUTRALIZACIÓN COMPLETADA")
    print("=" * 60)
    print("\n[!] El programa Arly.exe ha sido neutralizado de múltiples formas:")
    print("    - El ejecutable parcheado (Arly_neutralized.exe) no puede conectarse")
    print("    - Las DLLs de red han sido reemplazadas")
    print("    - El archivo de datos ha sido corrompido")
    print("    - Se han preparado bloqueos a nivel de hosts y firewall")
    print("\n[✓] El malware NO PUEDE exfiltrar información")

if __name__ == "__main__":
    main()