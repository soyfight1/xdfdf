#!/usr/bin/env python3
import socket
import re
import time

def solve_vm():
    """Solve the virtual machine challenge with divide by 2"""
    
    # Connect to service
    s = socket.socket()
    s.settimeout(10)
    
    try:
        s.connect(('saturn.picoctf.net', 64636))
        print("Connected to service")
        
        # Keep solving until we get the flag
        question_count = 0
        while True:
            # Read prompt
            data = s.recv(4096).decode()
            print(f"\n--- Question {question_count + 1} ---")
            print(f"Received: {data}")
            
            # Check for flag
            if "picoCTF" in data or "flag" in data.lower():
                print(f"\n!!! FLAG FOUND !!!")
                print(data)
                break
            
            # Check for error
            if "wait" in data.lower() and "seconds" in data.lower():
                wait_match = re.search(r'(\d+(?:\.\d+)?)\s*seconds', data)
                if wait_match:
                    wait_time = float(wait_match.group(1))
                    print(f"Need to wait {wait_time} seconds")
                break
            
            # Extract input value
            match = re.search(r'input.*?is (\d+)', data)
            if not match:
                print("Could not find input value")
                if "incorrect" in data.lower():
                    print("Previous answer was incorrect")
                break
            
            input_val = int(match.group(1))
            print(f"Input value: {input_val}")
            
            # Based on analysis:
            # Red axle closest gear: 24 teeth
            # Blue axle closest gear: 12 teeth
            # Ratio: 12/24 = 0.5
            # So we divide by 2
            
            answer = input_val // 2
            
            print(f"Sending answer: {answer} (input / 2)")
            s.send(f"{answer}\n".encode())
            
            question_count += 1
            
            # Small delay to ensure response is ready
            time.sleep(0.2)
            
            # Continue to next question
            if question_count > 20:
                print("Too many questions, something might be wrong")
                break
        
        s.close()
        
    except Exception as e:
        print(f"Error: {e}")
        if s:
            s.close()

# Calculate wait time
print("Checking if we need to wait...")
s = socket.socket()
s.settimeout(5)
try:
    s.connect(('saturn.picoctf.net', 64636))
    data = s.recv(1024).decode()
    if "wait" in data.lower():
        match = re.search(r'(\d+(?:\.\d+)?)\s*seconds', data)
        if match:
            wait_time = float(match.group(1))
            print(f"Need to wait {wait_time} seconds")
            print(f"Waiting {int(wait_time) + 5} seconds to be safe...")
            time.sleep(int(wait_time) + 5)
    s.close()
except:
    pass

# Now solve
print("\nAttempting to solve...")
solve_vm()