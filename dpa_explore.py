#!/usr/bin/env python3
import socket
import time
import json

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
    
    response_str = response.decode().strip()
    
    # Parse the response - format is "power measurement result:  [...]"
    if 'power measurement result:' in response_str:
        # Extract the array part
        start = response_str.find('[')
        end = response_str.rfind(']') + 1
        array_str = response_str[start:end]
        # Parse as JSON array
        trace = json.loads(array_str)
        return trace
    
    return []

def mean(lst):
    return sum(lst) / len(lst) if lst else 0

def hamming_weight(n):
    """Count number of 1 bits"""
    return bin(n).count('1')

print("=" * 60)
print("DPA EXPLORATION - POWER ANALYSIS")
print("=" * 60)

# Connect
s = connect_server()

# Read initial prompt
initial = s.recv(1024).decode()
print("Initial prompt:", initial.strip())

# Test 1: All zeros
print("\n[Test 1] All zeros (0x00 * 16):")
plaintext1 = "00" * 16
trace1 = send_plaintext(s, plaintext1)
print(f"  Trace length: {len(trace1)} samples")
print(f"  Mean power: {mean(trace1):.2f}")
print(f"  Min: {min(trace1)}, Max: {max(trace1)}")
print(f"  First 20 samples: {trace1[:20]}")

# Test 2: All ones
print("\n[Test 2] All ones (0xFF * 16):")
plaintext2 = "ff" * 16
trace2 = send_plaintext(s, plaintext2)
print(f"  Trace length: {len(trace2)} samples")
print(f"  Mean power: {mean(trace2):.2f}")
print(f"  Min: {min(trace2)}, Max: {max(trace2)}")

# Test 3: Single bit difference
print("\n[Test 3] First byte = 0x01, rest zeros:")
plaintext3 = "01" + "00" * 15
trace3 = send_plaintext(s, plaintext3)
print(f"  Mean power: {mean(trace3):.2f}")

# Test 4: Different patterns
print("\n[Test 4] Alternating 0x55 (01010101):")
plaintext4 = "55" * 16
trace4 = send_plaintext(s, plaintext4)
print(f"  Mean power: {mean(trace4):.2f}")

print("\n[Test 5] Alternating 0xAA (10101010):")
plaintext5 = "aa" * 16
trace5 = send_plaintext(s, plaintext5)
print(f"  Mean power: {mean(trace5):.2f}")

s.close()

print("\n" + "=" * 60)
print("ANALYSIS")
print("=" * 60)

# Analyze correlation with Hamming weight
print("\nHamming Weight vs Mean Power:")
print(f"  0x00 (HW=0): {mean(trace1):.2f}")
print(f"  0x01 (HW=1): {mean(trace3):.2f}")
print(f"  0x55 (HW=4): {mean(trace4):.2f}")
print(f"  0xAA (HW=4): {mean(trace5):.2f}")
print(f"  0xFF (HW=8): {mean(trace2):.2f}")

# Check if correlation exists
power_diff = mean(trace2) - mean(trace1)
print(f"\nPower difference (0xFF - 0x00): {power_diff:.2f}")
print(f"Expected: Positive correlation with Hamming weight")

# Analyze trace structure
print(f"\nTrace Structure:")
print(f"  Total samples: {len(trace1)}")
print(f"  Samples per byte (estimate): {len(trace1) // 16:.0f}")
print(f"  This suggests we can identify operations on individual bytes")

# Look for patterns in the trace
print(f"\nLooking for patterns:")
# Check if trace has repeating patterns (for each byte)
segment_size = len(trace1) // 16
if segment_size > 0:
    print(f"  Analyzing segments of size {segment_size}")
    # Compare first and second segments
    seg1 = trace1[:segment_size]
    seg2 = trace1[segment_size:2*segment_size]
    diff = sum(abs(a-b) for a,b in zip(seg1, seg2)) / segment_size
    print(f"  Average difference between segments: {diff:.2f}")

print("\nNext Steps for CPA Attack:")
print("1. Collect many traces (100-1000) with random plaintexts")
print("2. For each key byte hypothesis (0-255):")
print("   - Calculate intermediate value after AddRoundKey + SubBytes")
print("   - Compute Hamming weight of intermediate value")
print("   - Correlate with power trace at relevant time points")
print("3. The correct key byte will show highest correlation")