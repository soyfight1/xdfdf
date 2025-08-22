#!/usr/bin/env python3
import socket
import time

Sbox = (
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
    0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16,
)

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

print("=" * 60)
print("POWER ANALYSIS ATTACK - SYSTEMATIC")
print("=" * 60)

recovered_key = []

for byte_pos in range(16):
    print(f"\n[Byte {byte_pos}]")
    
    # Use enough test values to uniquely identify the key byte
    # We need log2(256) = 8 bits of information minimum
    test_values = list(range(256))  # Test all possible values
    
    # Get leak for each test value
    leaks = {}
    for val in test_values[:20]:  # Start with first 20 to save time
        pt = [0x00] * 16
        pt[byte_pos] = val
        pt_hex = ''.join(f'{b:02x}' for b in pt)
        
        leak = query(pt_hex)
        if leak is not None:
            leaks[val] = leak
            print(f"  pt[{byte_pos}]={val:02x} → leak={leak}")
    
    # Find key byte that matches all observations
    candidates = []
    
    for key_byte in range(256):
        matches_all = True
        
        # Check if this key byte is consistent with all observations
        base_val = 0x00
        if base_val in leaks:
            base_leak = leaks[base_val]
            base_lsb = Sbox[base_val ^ key_byte] & 0x01
            
            for val, leak in leaks.items():
                if val != base_val:
                    expected_lsb = Sbox[val ^ key_byte] & 0x01
                    expected_diff = expected_lsb - base_lsb
                    actual_diff = leak - base_leak
                    
                    if expected_diff != actual_diff:
                        matches_all = False
                        break
            
            if matches_all:
                candidates.append(key_byte)
    
    print(f"  Found {len(candidates)} candidates")
    
    # If still multiple candidates, test more values
    if len(candidates) > 1 and len(candidates) < 50:
        print(f"  Testing more values to narrow down...")
        
        # Test specific values that might help disambiguate
        for val in [0x55, 0xAA, 0xF0, 0x0F, 0x33, 0xCC]:
            if val not in leaks:
                pt = [0x00] * 16
                pt[byte_pos] = val
                pt_hex = ''.join(f'{b:02x}' for b in pt)
                
                leak = query(pt_hex)
                if leak is not None:
                    leaks[val] = leak
                    print(f"    pt[{byte_pos}]={val:02x} → leak={leak}")
        
        # Re-filter candidates
        new_candidates = []
        base_leak = leaks[0x00]
        
        for key_byte in candidates:
            matches_all = True
            base_lsb = Sbox[0x00 ^ key_byte] & 0x01
            
            for val, leak in leaks.items():
                expected_lsb = Sbox[val ^ key_byte] & 0x01
                expected_diff = expected_lsb - base_lsb
                actual_diff = leak - base_leak
                
                if expected_diff != actual_diff:
                    matches_all = False
                    break
            
            if matches_all:
                new_candidates.append(key_byte)
        
        candidates = new_candidates
        print(f"  Narrowed to {len(candidates)} candidates")
    
    if len(candidates) == 1:
        recovered_key.append(candidates[0])
        print(f"  ✓ Unique solution: {candidates[0]:02x}")
    elif len(candidates) > 0:
        # Take the first one or try to use some heuristic
        recovered_key.append(candidates[0])
        print(f"  → Multiple candidates, using: {candidates[0]:02x}")
        print(f"     All candidates: {[f'{c:02x}' for c in candidates[:10]]}")
    else:
        recovered_key.append(0x00)
        print(f"  ✗ No candidates found, using 0x00")

print("\n" + "=" * 60)
print("RECOVERED KEY:")
key_hex = ''.join(f'{b:02x}' for b in recovered_key)
print(f"Hex: {key_hex}")
print(f"Flag: picoCTF{{{key_hex}}}")
print("=" * 60)