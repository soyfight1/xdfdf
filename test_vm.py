#!/usr/bin/env python3
import socket
import re
import time

def interact_with_service():
    """Interact with the service"""
    s = socket.socket()
    s.settimeout(5)
    
    try:
        s.connect(('saturn.picoctf.net', 64636))
        print("Connected to service")
        
        # Read initial prompt
        data = s.recv(4096).decode()
        print(f"Received: {data}")
        
        # Extract input value
        match = re.search(r'input.*?is (\d+)', data)
        if not match:
            print("Could not find input value")
            return
        
        input_val = int(match.group(1))
        print(f"Input value: {input_val}")
        
        # Based on the disconnected gears, maybe it's a simple calculation
        # Let's think: if gears are not connected, maybe we need to calculate
        # based on the number of teeth or positions
        
        # Common gear ratios in LEGO:
        # 8:24 = 1:3
        # 12:24 = 1:2
        # 8:12 = 2:3
        # 16:24 = 2:3
        
        # Let me try a specific calculation based on the analysis
        # The system has many 12-tooth and 24-tooth gears
        # Most common ratio is 2:1 or 1:2
        
        answer = input_val * 2
        print(f"Trying answer: {answer}")
        
        s.send(f"{answer}\n".encode())
        time.sleep(0.5)
        
        response = s.recv(4096).decode()
        print(f"Response: {response}")
        
        if "incorrect" in response.lower():
            print("Wrong answer, trying different ratio...")
            
            # Try another connection
            s.close()
            s = socket.socket()
            s.connect(('saturn.picoctf.net', 64636))
            data = s.recv(4096).decode()
            match = re.search(r'input.*?is (\d+)', data)
            if match:
                input_val = int(match.group(1))
                
                # Try division by 2
                answer = input_val // 2
                print(f"New input: {input_val}, trying: {answer}")
                s.send(f"{answer}\n".encode())
                response = s.recv(4096).decode()
                print(f"Response: {response}")
        
        s.close()
        
    except Exception as e:
        print(f"Error: {e}")
        if s:
            s.close()

# Run the test
interact_with_service()

print("\n=== HYPOTHESIS ===")
print("Since the gears are disconnected, maybe the problem is asking")
print("for a specific mathematical transformation that represents")
print("the 'virtual' connection between red and blue axles.")
print("\nLet me check if there's a pattern in the numbers...")