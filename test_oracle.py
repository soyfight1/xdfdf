#!/usr/bin/env python3
import socket
import time

def query_server(plaintext_hex):
    """Query server with plaintext"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('saturn.picoctf.net', 54532))
    time.sleep(0.1)
    
    # Receive prompt
    prompt = s.recv(1024).decode()
    print(f"Prompt: {prompt}")
    
    # Send plaintext
    print(f"Sending: {plaintext_hex}")
    s.send((plaintext_hex + '\n').encode())
    time.sleep(0.1)
    
    # Receive response
    response = s.recv(1024).decode()
    s.close()
    
    print(f"Response: {response}")
    
    if 'leakage result:' in response:
        leak = int(response.split('leakage result:')[1].strip())
        return leak
    return None

# Test with all zeros
print("Test 1: All zeros")
leak1 = query_server("00000000000000000000000000000000")
print(f"Leak: {leak1}\n")

# Test with all ones  
print("Test 2: All 0x01")
leak2 = query_server("01010101010101010101010101010101")
print(f"Leak: {leak2}\n")

# Test with all 0xFF
print("Test 3: All 0xFF")
leak3 = query_server("ffffffffffffffffffffffffffffffff")
print(f"Leak: {leak3}\n")

# Test with single bit
print("Test 4: First byte = 0x01, rest zeros")
leak4 = query_server("01000000000000000000000000000000")
print(f"Leak: {leak4}\n")

print(f"\nSummary:")
print(f"All 0x00: {leak1}")
print(f"All 0x01: {leak2}")
print(f"All 0xFF: {leak3}")
print(f"First 0x01: {leak4}")

if leak1 is not None and leak4 is not None:
    print(f"\nDifference when changing first byte from 0x00 to 0x01: {leak4 - leak1}")