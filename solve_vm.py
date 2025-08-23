#!/usr/bin/env python3
import socket
import re

def connect_and_get_challenge():
    """Connect to the service and get the challenge"""
    s = socket.socket()
    s.connect(('saturn.picoctf.net', 64636))
    data = s.recv(4096).decode()
    print(f"Received: {data}")
    
    # Extract the input number
    match = re.search(r'input.*?is (\d+)', data)
    if match:
        input_val = int(match.group(1))
        print(f"Input value: {input_val}")
        return s, input_val
    return None, None

def send_answer(sock, answer):
    """Send answer to the service"""
    sock.send(f"{answer}\n".encode())
    response = sock.recv(4096).decode()
    return response

# Based on the gear analysis, let's try some simple ratios first
# The system seems disconnected, so let's try common gear ratios

sock, input_val = connect_and_get_challenge()
if sock and input_val:
    # Try some common gear ratio calculations
    # Most common LEGO gear ratios are:
    # 8:24 = 1:3
    # 12:24 = 1:2
    # 16:24 = 2:3
    # 12:12 = 1:1
    
    # Let's try a simple calculation first
    # If the gears are not connected, maybe it's a simple formula
    
    # Try 1: Same value (no transformation)
    print(f"\nTrying answer: {input_val}")
    response = send_answer(sock, input_val)
    print(f"Response: {response}")
    
    if "Incorrect" in response or "incorrect" in response or "wrong" in response:
        # Try 2: Multiply by 2 (common gear ratio)
        answer = input_val * 2
        print(f"\nTrying answer: {answer}")
        sock2, input_val2 = connect_and_get_challenge()
        if sock2:
            response = send_answer(sock2, answer)
            print(f"Response: {response}")
            sock2.close()
    
    sock.close()

# Since the gears seem disconnected, let me analyze the problem differently
print("\n=== HYPOTHESIS ===")
print("The red and blue axles are isolated from the main gear system.")
print("This might be intentional - perhaps the 'virtual machine' is not about physical gears")
print("but about a mathematical transformation that simulates gear ratios.")
print("\nLet me analyze the gear system more carefully...")