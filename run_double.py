#!/usr/bin/env python3
import subprocess
import time

# Ejecutar DOS instancias del programa
print('Ejecutando primera instancia...')
p1 = subprocess.Popen(['wine', 'debugme.exe'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

time.sleep(0.5)

print('Ejecutando segunda instancia...')
p2 = subprocess.Popen(['wine', 'debugme.exe'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

print('Esperando que se debuggeen mutuamente...')
time.sleep(5)

# El flag debería aparecer en una de las ventanas
print('Check en las ventanas de Wine!')
