#!/usr/bin/env python3
import socket
import time
import json
import random
import statistics

# AES S-box
Sbox = [
    0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
    0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
    0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
    0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
    0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
    0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
    0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
    0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
    0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
    0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
    0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
    0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
    0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
    0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
    0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
    0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
]

def get_trace(plaintext_hex):
    """Get power trace from server"""
    for attempt in range(3):  # Retry up to 3 times
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            s.connect(('saturn.picoctf.net', 59049))
            s.settimeout(5)
            
            # Read prompt
            s.recv(1024)
            
            # Send plaintext
            s.send((plaintext_hex + '\n').encode())
            
            # Receive trace
            response = b''
            while True:
                chunk = s.recv(4096)
                if not chunk:
                    break
                response += chunk
                if b']' in response:
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
        except:
            time.sleep(0.5)
            continue
    
    return []

def hamming_weight(n):
    """Calculate Hamming weight"""
    return bin(n).count('1')

def hamming_distance(a, b):
    """Calculate Hamming distance between two values"""
    return hamming_weight(a ^ b)

def correlation(x, y):
    """Calculate Pearson correlation coefficient"""
    if len(x) != len(y) or len(x) == 0:
        return 0
    
    try:
        # Use statistics module for more robust calculation
        return statistics.correlation(x, y)
    except:
        # Fallback to manual calculation
        n = len(x)
        sum_x = sum(x)
        sum_y = sum(y)
        sum_x2 = sum(xi**2 for xi in x)
        sum_y2 = sum(yi**2 for yi in y)
        sum_xy = sum(xi*yi for xi, yi in zip(x, y))
        
        num = n * sum_xy - sum_x * sum_y
        den_x = n * sum_x2 - sum_x**2
        den_y = n * sum_y2 - sum_y**2
        
        if den_x <= 0 or den_y <= 0:
            return 0
        
        den = (den_x * den_y) ** 0.5
        if den == 0:
            return 0
        
        return num / den

print("=" * 60)
print("IMPROVED DPA ATTACK WITH NOISE HANDLING")
print("=" * 60)

# Collect MORE traces to deal with noise
num_traces = 200  # More traces to average out noise
print(f"\n[1] Collecting {num_traces} power traces...")

plaintexts = []
traces = []

for i in range(num_traces):
    # Generate random plaintext
    plaintext = [random.randint(0, 255) for _ in range(16)]
    plaintext_hex = ''.join(f'{b:02x}' for b in plaintext)
    
    # Get trace
    trace = get_trace(plaintext_hex)
    
    if trace:
        plaintexts.append(plaintext)
        traces.append(trace)
        if (i + 1) % 20 == 0:
            print(f"  Collected {i+1}/{num_traces} traces...")
    
    time.sleep(0.05)  # Small delay

print(f"\nCollected {len(traces)} valid traces")

if len(traces) < 50:
    print("Not enough traces for analysis!")
    exit(1)

# CPA Attack with multiple power models
print("\n[2] Performing CPA attack with multiple models...")

recovered_key = []

for byte_pos in range(16):
    print(f"\n  Attacking byte {byte_pos}...")
    
    best_correlation = 0
    best_key_byte = 0
    best_model = ""
    
    # Try all possible key byte values
    for key_guess in range(256):
        # Try different power models
        
        # Model 1: Hamming weight of S-box output
        hypothetical_power_hw = []
        # Model 2: Hamming distance from input to S-box output
        hypothetical_power_hd = []
        # Model 3: Hamming weight of intermediate XOR
        hypothetical_power_xor = []
        
        for i in range(len(plaintexts)):
            # Intermediate value after AddRoundKey
            intermediate = plaintexts[i][byte_pos] ^ key_guess
            # After S-box
            sbox_output = Sbox[intermediate]
            
            # Different power models
            hypothetical_power_hw.append(hamming_weight(sbox_output))
            hypothetical_power_hd.append(hamming_distance(intermediate, sbox_output))
            hypothetical_power_xor.append(hamming_weight(intermediate))
        
        # Try correlation at different time points
        # Focus on different ranges for different operations
        ranges_to_try = [
            (0, 200, "early"),      # Early in trace
            (100, 400, "mid-early"),
            (200, 600, "mid"),
            (byte_pos * 150, byte_pos * 150 + 200, f"byte_{byte_pos}_region")
        ]
        
        for start, end, range_name in ranges_to_try:
            end = min(end, len(traces[0]))
            if start >= end:
                continue
            
            for t in range(start, end):
                # Extract power values at time t from all traces
                actual_power = [traces[i][t] for i in range(len(traces))]
                
                # Try each model
                for model_power, model_name in [
                    (hypothetical_power_hw, "HW_Sbox"),
                    (hypothetical_power_hd, "HD_Sbox"),
                    (hypothetical_power_xor, "HW_XOR")
                ]:
                    corr = abs(correlation(model_power, actual_power))
                    
                    if corr > best_correlation:
                        best_correlation = corr
                        best_key_byte = key_guess
                        best_model = f"{model_name}@{t}"
    
    recovered_key.append(best_key_byte)
    print(f"    Best key byte: 0x{best_key_byte:02x}")
    print(f"    Correlation: {best_correlation:.3f}")
    print(f"    Model: {best_model}")

# Display recovered key
print("\n" + "=" * 60)
print("RECOVERED KEY:")
key_hex = ''.join(f'{b:02x}' for b in recovered_key)
print(f"Hex: {key_hex}")
print(f"Flag: picoCTF{{{key_hex}}}")
print("=" * 60)