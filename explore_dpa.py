#!/usr/bin/env python3
import socket
import time
import numpy as np

def connect_server():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('saturn.picoctf.net', 59049))
    time.sleep(0.5)
    return s

def send_plaintext(s, plaintext_hex):
    """Send plaintext and get power trace"""
    # Send plaintext
    s.send((plaintext_hex + '\n').encode())
    time.sleep(0.5)
    
    # Receive trace
    response = b''
    while True:
        chunk = s.recv(4096)
        response += chunk
        if b'\n' in chunk or len(chunk) == 0:
            break
    
    return response.decode()

print("=" * 60)
print("DPA EXPLORATION")
print("=" * 60)

# Connect
s = connect_server()

# Read initial prompt
initial = s.recv(1024).decode()
print("Initial prompt:")
print(initial)

# Test with all zeros
print("\n[Test 1] Sending all zeros:")
plaintext1 = "00" * 16  # 16 bytes of 0x00
response1 = send_plaintext(s, plaintext1)
print(f"Response length: {len(response1)} chars")
print(f"First 200 chars: {response1[:200]}")

# Parse the trace
if ',' in response1:
    trace1 = [float(x) for x in response1.strip().split(',')]
    print(f"Trace has {len(trace1)} samples")
    print(f"Min: {min(trace1):.2f}, Max: {max(trace1):.2f}, Mean: {np.mean(trace1):.2f}")
    print(f"First 10 samples: {trace1[:10]}")

# Test with all ones
print("\n[Test 2] Sending all 0xFF:")
plaintext2 = "ff" * 16  # 16 bytes of 0xFF
response2 = send_plaintext(s, plaintext2)
if ',' in response2:
    trace2 = [float(x) for x in response2.strip().split(',')]
    print(f"Trace has {len(trace2)} samples")
    print(f"Min: {min(trace2):.2f}, Max: {max(trace2):.2f}, Mean: {np.mean(trace2):.2f}")

# Test with specific pattern
print("\n[Test 3] Sending 0x01 followed by zeros:")
plaintext3 = "01" + "00" * 15
response3 = send_plaintext(s, plaintext3)
if ',' in response3:
    trace3 = [float(x) for x in response3.strip().split(',')]
    print(f"Trace has {len(trace3)} samples")
    print(f"Min: {min(trace3):.2f}, Max: {max(trace3):.2f}, Mean: {np.mean(trace3):.2f}")

s.close()

print("\n" + "=" * 60)
print("ANALYSIS")
print("=" * 60)

if ',' in response1 and ',' in response2:
    # Compare traces
    print(f"\nDifference in mean power:")
    print(f"  All 0x00: {np.mean(trace1):.2f}")
    print(f"  All 0xFF: {np.mean(trace2):.2f}")
    print(f"  Difference: {np.mean(trace2) - np.mean(trace1):.2f}")
    
    # This difference should correlate with Hamming weight
    # 0x00 has HW=0, 0xFF has HW=8
    print(f"\nHamming weight correlation:")
    print(f"  0x00: HW=0")
    print(f"  0xFF: HW=8")
    print(f"  Expected: Higher power for 0xFF ✓" if np.mean(trace2) > np.mean(trace1) else "  Unexpected result")

print("\nNext steps:")
print("1. Collect many traces with known plaintexts")
print("2. Focus on first round of AES (AddRoundKey + SubBytes)")
print("3. Use CPA to correlate power with Hamming weight of S-box output")
print("4. Recover key byte by byte")