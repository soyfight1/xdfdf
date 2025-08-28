# CTF Challenge: Pachinko - Solution Report

## Challenge Overview
- **Name**: Pachinko
- **Category**: Web Exploitation
- **Points**: Unknown
- **Description**: A NAND circuit simulator with two flags to find

## Solution Summary

### FLAG 1: `picoCTF{p4ch1nk0_f146_0n3_e947b9d7}`

**Vulnerability**: Logic error in circuit validation and memory handling

**Exploit Method**:
The application expects a circuit that implements NOT gates to flip the input values. By sending a properly formatted circuit that creates NOT gates for each of the 4 outputs, we can trigger the condition where `result === 0x1337`, which returns FLAG1.

**Working Exploit**:
```python
circuit = []
for i in range(4):
    circuit.append({
        "input1": 5 + i,  # Input nodes are 5-8
        "input2": 5 + i,  # NAND with same input = NOT
        "output": i + 1   # Output nodes are 1-4
    })
```

### FLAG 2: Located in separate challenge "Pachinko Revisited"

According to the challenge description, FLAG2 should be submitted in a separate challenge called "Pachinko Revisited". The code shows that FLAG2 would be returned when the CPU's flag signal is set to 255 during execution, but this appears to be intentionally difficult or impossible to achieve through the `/check` endpoint alone.

## Technical Analysis

### Key Components:
1. **Server (Node.js/Express)**:
   - `/check` endpoint: Accepts circuit definitions and runs CPU simulation
   - `/flag` endpoint: Admin endpoint requiring both flags as password
   
2. **CPU Emulator**:
   - Written in Rust, compiled to WASM
   - Executes custom bytecode from `nand_checker.bin`
   - Checks if circuit implements correct logic

3. **Memory Layout**:
   - Program: Loaded at start of memory
   - Output state: 0x1000
   - Input state: 0x2000
   - Circuit: 0x3000

### Vulnerability Details:
The vulnerability lies in how the circuit affects the program execution. When a proper NOT circuit is submitted, it causes the program to write 0x1337 to the result memory location (0x1000-0x1001), triggering FLAG1.

## Files Created:
- `/workspace/ctf_pachinko/` - Working directory
- `exploit.py` - Initial exploit attempts
- `exploit2.py` - FLAG2 search attempts
- `final_exploit.py` - Comprehensive testing
- `advanced_exploit.py` - Advanced techniques
- `analyze_binary.py` - Binary analysis tool

## Lessons Learned:
1. Understanding the full application flow is crucial
2. Sometimes flags are split across multiple challenges
3. Proper circuit implementation (NOT gates) was the key
4. The WASM/Rust CPU emulator added complexity but wasn't the vulnerability

## Commands Used:
```bash
# Setup
mkdir -p /workspace/ctf_pachinko
cd /workspace/ctf_pachinko
wget [server.tar.gz URL]
tar -xzf server.tar.gz

# Analysis
xxd programs/nand_checker.bin
python3 analyze_binary.py

# Exploitation
pip install requests --break-system-packages
python3 exploit.py
```

## Result:
✅ FLAG1 successfully obtained: `picoCTF{p4ch1nk0_f146_0n3_e947b9d7}`
ℹ️ FLAG2 is in the separate "Pachinko Revisited" challenge