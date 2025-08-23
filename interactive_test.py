#!/usr/bin/env python3
import socket
import re

def test_service():
    """Test the service with different inputs to find pattern"""
    
    # Test multiple times to see if input changes
    results = []
    
    for i in range(5):
        s = socket.socket()
        s.connect(('saturn.picoctf.net', 64636))
        data = s.recv(4096).decode()
        
        # Extract the input number
        match = re.search(r'input.*?is (\d+)', data)
        if match:
            input_val = int(match.group(1))
            
            # Try different answers
            test_answers = [
                input_val,           # Same
                input_val * 2,       # Double
                input_val * 3,       # Triple
                input_val // 2,      # Half
                input_val // 3,      # Third
                int(input_val * 1.5), # 1.5x
                int(input_val * 2.4), # Gear ratio 24:10
                int(input_val * 0.5), # Gear ratio 1:2
                int(input_val * 0.333), # Gear ratio 8:24
            ]
            
            # Test first answer
            s.send(f"{test_answers[0]}\n".encode())
            response = s.recv(4096).decode()
            
            print(f"Test {i+1}:")
            print(f"  Input: {input_val}")
            print(f"  Sent: {test_answers[0]}")
            print(f"  Response: {response.strip()}")
            
            results.append((input_val, response))
            
            # Check if we got more prompts or an error
            if "incorrect" in response.lower() or "wrong" in response.lower():
                print("  Status: WRONG")
            elif "correct" in response.lower() or "flag" in response.lower() or "pico" in response.lower():
                print("  Status: CORRECT!")
                print(f"  FLAG FOUND: {response}")
                return
            elif "input" in response.lower():
                print("  Status: Got another question")
                # Extract new input
                match2 = re.search(r'input.*?is (\d+)', response)
                if match2:
                    input2 = int(match2.group(1))
                    print(f"  New input: {input2}")
            else:
                print("  Status: Unknown response")
        
        s.close()
    
    # Analyze patterns
    print("\n=== PATTERN ANALYSIS ===")
    for inp, resp in results:
        print(f"Input {inp}: Response pattern: {resp[:50]}...")

test_service()