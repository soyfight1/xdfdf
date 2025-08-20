#!/usr/bin/env python3

import socket
import time

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

def interact():
    s = socket.socket()
    s.connect((HOST, PORT))
    
    # Recibir banner
    data = s.recv(4096)
    print(f"Banner: {data}")
    
    # Probar opciones
    options = [b'1', b'2', b'3', b'4', b'5', b'0', b'help', b'?']
    
    for opt in options:
        print(f"\n[*] Probando opción: {opt}")
        s.send(opt + b'\n')
        time.sleep(0.5)
        
        try:
            response = s.recv(4096)
            print(f"Response: {response}")
            
            if b'flag' in response.lower() or b'pico' in response.lower():
                print(f"[!] FLAG FOUND: {response}")
                break
                
        except socket.timeout:
            print("Timeout")
        except Exception as e:
            print(f"Error: {e}")
            break
    
    s.close()

if __name__ == "__main__":
    interact()