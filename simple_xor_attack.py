#!/usr/bin/env python3
import socket
import time
import json
import random

def get_trace(plaintext_hex):
    """Get power trace from server"""
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect(('saturn.picoctf.net', 59049))
        s.settimeout(5)
        
        # Read prompt
        s.recv(1024)
        
        # Send plaintext
        s.send((plaintext_hex + '\n').encode())
        
        # Receive trace with larger buffer
        response = b''
        while True:
            chunk = s.recv(8192)
            if not chunk:
                break
            response += chunk
            if b']' in response and b'\n' in response:
                break
        
        s.close()
        
        # Parse response
        response_str = response.decode()
        if 'power measurement result:' in response_str:
            start = response_str.find('[')
            end = response_str.rfind(']') + 1
            if start != -1 and end > start:
                array_str = response_str[start:end]
                return json.loads(array_str)
    except Exception as e:
        print(f"Error: {e}")
    
    return []

def hamming_weight(n):
    """Calculate Hamming weight"""
    return bin(n).count('1')

def correlation(x, y):
    """Calculate correlation"""
    if len(x) != len(y) or len(x) < 2:
        return 0
    
    n = len(x)
    sum_x = sum(x)
    sum_y = sum(y)
    mean_x = sum_x / n
    mean_y = sum_y / n
    
    cov = sum((x[i] - mean_x) * (y[i] - mean_y) for i in range(n))
    std_x = (sum((xi - mean_x)**2 for xi in x) / n) ** 0.5
    std_y = (sum((yi - mean_y)**2 for yi in y) / n) ** 0.5
    
    if std_x == 0 or std_y == 0:
        return 0
    
    return cov / (n * std_x * std_y)

print("=" * 60)
print("SIMPLE XOR-BASED DPA ATTACK")
print("=" * 60)
print("\nHypothesis: Power correlates with HW(plaintext XOR key)")
print("No S-box, just the XOR operation\n")

# Collect traces
num_traces = 100
print(f"[1] Collecting {num_traces} traces...")

plaintexts = []
traces = []

for i in range(num_traces):
    plaintext = [random.randint(0, 255) for _ in range(16)]
    plaintext_hex = ''.join(f'{b:02x}' for b in plaintext)
    
    trace = get_trace(plaintext_hex)
    if trace:
        plaintexts.append(plaintext)
        traces.append(trace)
        
    if (i + 1) % 20 == 0:
        print(f"  Collected {i+1}/{num_traces}")
    
    time.sleep(0.1)

print(f"\nTotal collected: {len(traces)} traces")

if len(traces) < 20:
    print("Not enough traces!")
    exit(1)

# Simple CPA on XOR only
print("\n[2] Performing simple XOR-based CPA...")

recovered_key = []

# For each byte position
for byte_pos in range(16):
    print(f"\nByte {byte_pos}:", end=" ")
    
    best_correlation = 0
    best_key_byte = 0
    
    # Try all key byte values
    for key_guess in range(256):
        # Calculate hypothetical power based on XOR only
        hypothetical_power = []
        
        for i in range(len(plaintexts)):
            # Just XOR, no S-box
            xor_result = plaintexts[i][byte_pos] ^ key_guess
            # Power = Hamming weight of XOR result
            power = hamming_weight(xor_result)
            hypothetical_power.append(power)
        
        # Check correlation at different time points
        # Focus on early part of trace where XOR happens
        for t in range(min(1000, len(traces[0]))):
            # Extract power at time t
            actual_power = [traces[i][t] for i in range(len(traces))]
            
            # Calculate correlation
            corr = abs(correlation(hypothetical_power, actual_power))
            
            if corr > best_correlation:
                best_correlation = corr
                best_key_byte = key_guess
    
    recovered_key.append(best_key_byte)
    print(f"0x{best_key_byte:02x} (corr={best_correlation:.3f})")

# Display result
print("\n" + "=" * 60)
print("RECOVERED KEY (XOR model):")
key_hex = ''.join(f'{b:02x}' for b in recovered_key)
print(f"Hex: {key_hex}")
print(f"Flag: picoCTF{{{key_hex}}}")
print("=" * 60)