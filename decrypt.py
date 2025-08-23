import hashlib
import re

def unpad(data):
    """Remove PKCS7 padding"""
    padding_length = data[-1]
    return data[:-padding_length]

def xor_bytes(a, b):
    """XOR two byte strings"""
    return bytes(x ^ y for x, y in zip(a, b))

def decrypt(ciphertext, key):
    """Decrypt the ciphertext using the same algorithm as encrypt"""
    # Get SHA256 hash of the key
    key_hash = hashlib.sha256(key).digest()
    
    # Decrypt block by block
    block_size = 16
    plaintext = b''
    
    for i in range(0, len(ciphertext), block_size):
        block = ciphertext[i:i + block_size]
        plain_block = xor_bytes(block, key_hash)
        plaintext += plain_block
    
    # Remove padding
    plaintext = unpad(plaintext)
    
    # Convert to string
    return plaintext.decode('utf-8')

def extract_flag(decrypted_text):
    """Extract the flag from the decrypted text"""
    # The flag should be in the format picoCTF{...}
    flag_pattern = r'picoCTF\{[^}]+\}'
    match = re.search(flag_pattern, decrypted_text)
    if match:
        return match.group(0)
    return None

# Read the encrypted file
with open('/workspace/enc_flag', 'r') as f:
    content = f.read()

# Extract the key from the file
key_match = re.search(r"Key: b'([^']+)'", content)
if key_match:
    key_str = key_match.group(1)
    # Convert the escaped string to bytes
    key = eval(f"b'{key_str}'")
    print(f"Key extracted: {key.hex()}")
else:
    print("Could not extract key")
    exit(1)

# Extract the encrypted blockchain
enc_match = re.search(r'Encrypted Blockchain: b"([^"]+)"', content)
if enc_match:
    enc_str = enc_match.group(1)
    # Convert the escaped string to bytes
    encrypted_blockchain = eval(f'b"{enc_str}"')
    print(f"Encrypted blockchain length: {len(encrypted_blockchain)} bytes")
else:
    print("Could not extract encrypted blockchain")
    exit(1)

# Decrypt the blockchain
decrypted = decrypt(encrypted_blockchain, key)
print(f"\nDecrypted text:\n{decrypted}")

# Extract the flag
flag = extract_flag(decrypted)
if flag:
    print(f"\n🎉 FLAG FOUND: {flag}")
else:
    print("\nNo flag found in decrypted text")
    print("\nLet's analyze the structure:")
    print(f"Length: {len(decrypted)}")
    # The blockchain string should be hashes separated by '-'
    # And the flag is inserted in the middle
    # Let's look for patterns
    parts = decrypted.split('-')
    print(f"Number of parts when split by '-': {len(parts)}")
    
    # The flag might be between the hashes
    for i, part in enumerate(parts):
        if 'picoCTF' in part or len(part) != 64:  # SHA256 hashes are 64 chars
            print(f"Part {i}: {part}")