#!/usr/bin/env python3
import socket
import time

def check_service():
    """Check if service is available"""
    
    for port in [64636, 50366, 52935]:  # Try different ports that might be used
        print(f"\nTrying port {port}...")
        s = socket.socket()
        s.settimeout(5)
        
        try:
            s.connect(('saturn.picoctf.net', port))
            print(f"Connected to port {port}!")
            
            # Try to receive data
            data = s.recv(4096).decode()
            print(f"Received: {data[:200]}...")
            
            s.close()
            return True
            
        except socket.timeout:
            print(f"Port {port}: Connection timed out")
        except ConnectionRefusedError:
            print(f"Port {port}: Connection refused")
        except Exception as e:
            print(f"Port {port}: Error - {e}")
        
        if s:
            s.close()
    
    return False

# Check service
if check_service():
    print("\nService is available!")
else:
    print("\nService appears to be down or instance expired.")
    print("The instance was marked as RUNNING with 13:46 remaining at the start.")
    print("It may have expired. You would need to start a new instance.")