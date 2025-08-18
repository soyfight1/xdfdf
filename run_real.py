#!/usr/bin/env python3
import subprocess
import time
import os

# Cambiar al directorio del ejecutable
os.chdir('/workspace')

# Ejecutar DOS instancias
print('Ejecutando primera instancia...')
p1 = subprocess.Popen(['wine', 'debugme.exe'], 
                      stdout=subprocess.PIPE, 
                      stderr=subprocess.PIPE,
                      stdin=subprocess.PIPE)

time.sleep(2)

print('Ejecutando segunda instancia...')
p2 = subprocess.Popen(['wine', 'debugme.exe'],
                      stdout=subprocess.PIPE,
                      stderr=subprocess.PIPE,
                      stdin=subprocess.PIPE)

time.sleep(3)

# Intentar capturar output
out1, err1 = p1.communicate(timeout=5)
out2, err2 = p2.communicate(timeout=5)

print('Output 1:', out1)
print('Output 2:', out2)
