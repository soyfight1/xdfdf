#!/usr/bin/env python3
import socket
import time
import json

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
print("DIRECT TRACE ANALYSIS")
print("=" * 60)

# Get trace with all zeros - this should reveal key processing
print("\n[1] Sending all zeros (plaintext XOR key = key):")
trace_zeros = get_trace("00" * 16)

if trace_zeros:
    print(f"Trace length: {len(trace_zeros)}")
    
    # Look for 16 distinct peaks/regions
    # Each byte of the key might be processed separately
    samples_per_byte = len(trace_zeros) // 16
    print(f"Samples per byte (approx): {samples_per_byte}")
    
    # Analyze each region
    print("\n[2] Analyzing regions for each byte:")
    
    key_bytes = []
    
    for byte_idx in range(16):
        # Get the region for this byte
        start = byte_idx * samples_per_byte
        end = start + samples_per_byte
        region = trace_zeros[start:end]
        
        # Find the peak in this region
        peak_value = max(region)
        peak_index = region.index(peak_value)
        
        print(f"\nByte {byte_idx}:")
        print(f"  Region: [{start}:{end}]")
        print(f"  Peak value: {peak_value}")
        print(f"  Peak at local index: {peak_index}")
        
        # Maybe the peak value correlates with Hamming weight?
        # Let's try to map it
        # Typical range might be 0-8 for Hamming weight
        # Let's see if we can estimate the key byte
        
        # Simple linear mapping (this is a guess)
        # Assuming power scales linearly with Hamming weight
        # And noise adds variation
        
        # Get average power in this region
        avg_power = sum(region) / len(region)
        print(f"  Average power: {avg_power:.2f}")
        
        # Try to estimate Hamming weight from peak
        # This is very rough - we need calibration
        estimated_hw = round((peak_value - 100) / 30)  # Very rough estimate
        estimated_hw = max(0, min(8, estimated_hw))  # Clamp to valid range
        print(f"  Estimated HW from peak: {estimated_hw}")

# Now let's try with all ones to calibrate
print("\n" + "=" * 60)
print("[3] Sending all ones (plaintext XOR key = NOT key):")
trace_ones = get_trace("ff" * 16)

if trace_ones:
    print(f"Trace length: {len(trace_ones)}")
    
    # Compare with zeros trace
    print("\n[4] Comparing traces to extract key:")
    
    recovered_key = []
    
    for byte_idx in range(16):
        start = byte_idx * samples_per_byte
        end = start + samples_per_byte
        
        region_zeros = trace_zeros[start:end]
        region_ones = trace_ones[start:end]
        
        # When plaintext = 0x00, intermediate = key
        # When plaintext = 0xFF, intermediate = ~key
        
        # Power should correlate with Hamming weight
        # HW(key) + HW(~key) = 8 always
        
        avg_power_zeros = sum(region_zeros) / len(region_zeros)
        avg_power_ones = sum(region_ones) / len(region_ones)
        
        print(f"\nByte {byte_idx}:")
        print(f"  Avg power (p=0x00): {avg_power_zeros:.2f}")
        print(f"  Avg power (p=0xFF): {avg_power_ones:.2f}")
        print(f"  Difference: {avg_power_zeros - avg_power_ones:.2f}")
        
        # The difference might tell us about the key
        # If key has more 1s, power_zeros > power_ones
        # If key has more 0s, power_ones > power_zeros
        
        # Try to estimate the Hamming weight
        # Assuming linear relationship
        power_diff = avg_power_zeros - avg_power_ones
        estimated_hw = round(4 + power_diff / 10)  # Very rough
        estimated_hw = max(0, min(8, estimated_hw))
        
        print(f"  Estimated HW of key byte: {estimated_hw}")
        
        # We can't determine exact byte from just HW
        # But this gives us constraints

print("\n" + "=" * 60)
print("Note: Need more sophisticated analysis to recover exact key bytes")
print("Hamming weight alone doesn't uniquely identify bytes")
print("=" * 60)