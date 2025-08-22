#!/usr/bin/env python3
import socket
import time
import json
import random

def get_trace(plaintext_hex):
    """Get power trace from server"""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('saturn.picoctf.net', 59049))
    s.settimeout(5)
    
    # Read prompt
    s.recv(1024)
    
    # Send plaintext
    s.send((plaintext_hex + '\n').encode())
    
    # Receive trace
    response = b''
    try:
        while True:
            chunk = s.recv(4096)
            if not chunk:
                break
            response += chunk
            if b']' in response:
                break
    except socket.timeout:
        pass
    
    s.close()
    
    # Parse response
    response_str = response.decode()
    if 'power measurement result:' in response_str:
        start = response_str.find('[')
        end = response_str.rfind(']') + 1
        if start != -1 and end > start:
            array_str = response_str[start:end]
            return json.loads(array_str)
    
    return []

def hamming_weight(n):
    """Calculate Hamming weight"""
    return bin(n).count('1')

print("=" * 60)
print("SIMPLE DPA ATTACK")
print("=" * 60)

# Maybe the challenge is simpler - let's try with specific patterns
# to identify the key directly

print("\n[1] Testing with specific patterns...")

# Test 1: All zeros - this XOR key = key
print("\nSending all zeros (reveals key directly in power):")
plaintext_zeros = "00" * 16
trace_zeros = get_trace(plaintext_zeros)
if trace_zeros:
    print(f"  Trace length: {len(trace_zeros)}")
    print(f"  Mean power: {sum(trace_zeros)/len(trace_zeros):.2f}")

# Test 2: All ones - this XOR key = NOT key
print("\nSending all ones (reveals NOT key):")
plaintext_ones = "ff" * 16
trace_ones = get_trace(plaintext_ones)
if trace_ones:
    print(f"  Mean power: {sum(trace_ones)/len(trace_ones):.2f}")

# Test 3: Try to identify patterns
print("\n[2] Looking for patterns in traces...")

# Maybe we can see 16 distinct regions for 16 bytes
if trace_zeros:
    samples_per_byte = len(trace_zeros) // 16
    print(f"Samples per byte (approx): {samples_per_byte}")
    
    # Look at peaks in the trace
    print("\nAnalyzing peaks in zero-plaintext trace:")
    
    # Find local maxima (potential key processing points)
    peaks = []
    for i in range(1, len(trace_zeros)-1):
        if trace_zeros[i] > trace_zeros[i-1] and trace_zeros[i] > trace_zeros[i+1]:
            if trace_zeros[i] > 200:  # Threshold for significant peaks
                peaks.append((i, trace_zeros[i]))
    
    print(f"Found {len(peaks)} significant peaks")
    
    # Show first 16 peaks (might correspond to 16 key bytes)
    if len(peaks) >= 16:
        print("\nFirst 16 peaks (position, value):")
        for i in range(16):
            print(f"  Peak {i}: pos={peaks[i][0]}, val={peaks[i][1]}")

print("\n[3] Trying differential analysis...")

# Collect multiple traces with known differences
traces_by_byte = {}

for byte_pos in range(16):
    print(f"\nAnalyzing byte position {byte_pos}...")
    
    # Create plaintexts that differ only in one byte
    traces_for_byte = []
    
    for val in [0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0xFF]:
        plaintext = [0] * 16
        plaintext[byte_pos] = val
        plaintext_hex = ''.join(f'{b:02x}' for b in plaintext)
        
        trace = get_trace(plaintext_hex)
        if trace:
            traces_for_byte.append((val, trace))
            time.sleep(0.1)
    
    # Analyze differences
    if len(traces_for_byte) >= 2:
        # Compare trace when byte is 0x00 vs 0xFF
        trace_00 = None
        trace_ff = None
        
        for val, trace in traces_for_byte:
            if val == 0x00:
                trace_00 = trace
            elif val == 0xFF:
                trace_ff = trace
        
        if trace_00 and trace_ff:
            # Find positions with maximum difference
            diffs = [abs(trace_ff[i] - trace_00[i]) for i in range(min(len(trace_00), len(trace_ff)))]
            max_diff_pos = diffs.index(max(diffs))
            max_diff_val = max(diffs)
            
            print(f"  Max difference at position {max_diff_pos}: {max_diff_val:.2f}")
            
            # The power difference might reveal the key byte
            # If plaintext=0x00, power ~ HW(key)
            # If plaintext=0xFF, power ~ HW(~key) = 8 - HW(key)
            power_00 = trace_00[max_diff_pos]
            power_ff = trace_ff[max_diff_pos]
            
            # Estimate key byte from power consumption
            # This is simplified - we might need more sophisticated analysis
            estimated_hw = round((power_00 - power_ff + 8) / 2)
            print(f"  Estimated Hamming weight of key byte: {estimated_hw}")

print("\n" + "=" * 60)
print("Analysis complete. Need more sophisticated approach...")
print("=" * 60)