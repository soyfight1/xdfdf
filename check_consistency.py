#!/usr/bin/env python3
import socket
import time

def query(plaintext_hex):
    """Query server"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('saturn.picoctf.net', 54532))
    time.sleep(0.1)
    s.recv(1024)  # prompt
    s.send((plaintext_hex + '\n').encode())
    time.sleep(0.1)
    response = s.recv(1024).decode()
    s.close()
    
    if 'leakage result:' in response:
        return int(response.split('leakage result:')[1].strip())
    return None

# Test same plaintext multiple times
pt = "00000000000000000000000000000000"
print(f"Testing consistency with plaintext: {pt}")

results = []
for i in range(5):
    leak = query(pt)
    results.append(leak)
    print(f"  Query {i+1}: {leak}")

if len(set(results)) == 1:
    print("✓ Server is consistent!")
else:
    print("✗ Server gives different results!")
    
# Test another plaintext
pt2 = "01000000000000000000000000000000"
print(f"\nTesting with plaintext: {pt2}")

results2 = []
for i in range(5):
    leak = query(pt2)
    results2.append(leak)
    print(f"  Query {i+1}: {leak}")

if len(set(results2)) == 1:
    print("✓ Server is consistent!")
else:
    print("✗ Server gives different results!")