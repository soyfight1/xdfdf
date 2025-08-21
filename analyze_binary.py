#!/usr/bin/env python3

import subprocess
import re

def analyze_binary():
    print("[*] Analizando zero_to_hero...")
    
    # Obtener todas las funciones
    result = subprocess.run(['objdump', '-d', 'zero_to_hero'], capture_output=True, text=True)
    
    # Buscar patrones importantes
    lines = result.stdout.split('\n')
    
    # Encontrar funciones principales
    functions = {}
    current_func = None
    
    for line in lines:
        # Detectar inicio de función
        if match := re.match(r'^([0-9a-f]+) <(.+?)>:', line):
            addr = match.group(1)
            name = match.group(2)
            if not name.startswith('.'):
                current_func = name
                functions[current_func] = {'addr': addr, 'code': []}
        elif current_func and line.strip():
            functions[current_func]['code'].append(line)
    
    # Buscar llamadas importantes
    print("\n[+] Funciones encontradas:")
    for func, data in functions.items():
        if '@plt' not in func:
            print(f"  - {func} @ 0x{data['addr']}")
    
    # Analizar main
    print("\n[*] Analizando función main...")
    if 'main' in functions or '_start' in functions:
        main_code = functions.get('main', functions.get('_start', {})).get('code', [])
        
        # Buscar llamadas a malloc/free
        malloc_calls = []
        free_calls = []
        system_calls = []
        
        for line in main_code:
            if 'malloc@plt' in line:
                malloc_calls.append(line.strip())
            elif 'free@plt' in line:
                free_calls.append(line.strip())
            elif 'system@plt' in line:
                system_calls.append(line.strip())
        
        print(f"  Llamadas a malloc: {len(malloc_calls)}")
        print(f"  Llamadas a free: {len(free_calls)}")
        print(f"  Llamadas a system: {len(system_calls)}")
    
    # Buscar strings
    print("\n[*] Strings importantes:")
    strings_result = subprocess.run(['strings', 'zero_to_hero'], capture_output=True, text=True)
    for line in strings_result.stdout.split('\n'):
        if any(word in line.lower() for word in ['flag', 'win', 'shell', 'system', 'cat', 'sh']):
            print(f"  - {line}")
    
    # Buscar vulnerabilidades potenciales
    print("\n[*] Vulnerabilidades potenciales:")
    
    # Buscar double free
    if len(free_calls) > len(malloc_calls):
        print("  [!] Posible double free vulnerability")
    
    # Buscar use after free
    for i, line in enumerate(lines):
        if 'free@plt' in line:
            # Ver si hay uso después del free
            for j in range(i+1, min(i+20, len(lines))):
                if 'mov' in lines[j] and 'rdi' in lines[j]:
                    print("  [!] Posible use-after-free")
                    break

if __name__ == "__main__":
    analyze_binary()