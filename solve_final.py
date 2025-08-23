#!/usr/bin/env python3
import socket
import re
import time

def solve_vm():
    """Solve the virtual machine challenge"""
    
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
                print("Need to wait, exiting...")
                break
            
            # Extract input value
            match = re.search(r'input.*?is (\d+)', data)
            if not match:
                print("Could not find input value")
                # Maybe we got the answer wrong
                if "incorrect" in data.lower():
                    print("Previous answer was incorrect")
                break
            
            input_val = int(match.group(1))
            print(f"Input value: {input_val}")
            
            # Based on analysis:
            # - Most common ratio is 2:1 (40 gears of 12t, 13 gears of 24t)
            # - Index difference between red and blue is 118
            # - Most transitions maintain 1:1 ratio (37 times)
            # - Second most common is 0.5 ratio (10 times)
            
            # Let's try multiply by 2 (most common meaningful ratio)
            answer = input_val * 2
            
            print(f"Sending answer: {answer}")
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

# Run solver
solve_vm()