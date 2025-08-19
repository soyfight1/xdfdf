#!/usr/bin/env python3
"""
Rompedor de cifrados para CTFs - Análisis y ataques criptográficos
"""

import base64
import binascii
import string
import hashlib
from collections import Counter
import re

class CryptoBreaker:
    def __init__(self):
        self.freq_english = {
            'E': 12.70, 'T': 9.06, 'A': 8.17, 'O': 7.51, 'I': 6.97,
            'N': 6.75, 'S': 6.33, 'H': 6.09, 'R': 5.99, 'D': 4.25,
            'L': 4.03, 'C': 2.78, 'U': 2.76, 'M': 2.41, 'W': 2.36,
            'F': 2.23, 'G': 2.02, 'Y': 1.97, 'P': 1.93, 'B': 1.29,
            'V': 0.98, 'K': 0.77, 'J': 0.15, 'X': 0.15, 'Q': 0.10, 'Z': 0.07
        }
        
    def detect_encoding(self, text):
        """Detecta el tipo de codificación"""
        # Base64
        if re.match(r'^[A-Za-z0-9+/]+=*$', text):
            try:
                base64.b64decode(text)
                return 'base64'
            except:
                pass
        
        # Hex
        if re.match(r'^[0-9a-fA-F]+$', text) and len(text) % 2 == 0:
            return 'hex'
        
        # Binary
        if re.match(r'^[01\s]+$', text.replace(' ', '')):
            return 'binary'
        
        # URL encoded
        if '%' in text:
            return 'url'
        
        # ROT13/Caesar
        if text.isalpha() or (text.replace(' ', '').isalpha()):
            return 'caesar'
        
        return 'unknown'
    
    def decode_base64(self, text):
        """Decodifica base64 con padding automático"""
        try:
            # Agregar padding si falta
            missing_padding = len(text) % 4
            if missing_padding:
                text += '=' * (4 - missing_padding)
            return base64.b64decode(text).decode('utf-8', errors='ignore')
        except:
            return None
    
    def decode_hex(self, text):
        """Decodifica hexadecimal"""
        try:
            return bytes.fromhex(text).decode('utf-8', errors='ignore')
        except:
            return None
    
    def decode_binary(self, text):
        """Decodifica binario"""
        try:
            text = text.replace(' ', '')
            n = int(text, 2)
            return n.to_bytes((n.bit_length() + 7) // 8, 'big').decode('utf-8', errors='ignore')
        except:
            return None
    
    def caesar_brute_force(self, text):
        """Fuerza bruta en cifrado César"""
        results = []
        for shift in range(26):
            decoded = ''
            for char in text:
                if char.isalpha():
                    ascii_offset = 65 if char.isupper() else 97
                    decoded += chr((ord(char) - ascii_offset - shift) % 26 + ascii_offset)
                else:
                    decoded += char
            results.append((shift, decoded))
        return results
    
    def xor_brute_force(self, data, max_key_len=20):
        """Fuerza bruta XOR con claves cortas"""
        if isinstance(data, str):
            data = data.encode()
        
        results = []
        for key_len in range(1, min(max_key_len, len(data))):
            for key in range(256 ** key_len):
                key_bytes = key.to_bytes(key_len, 'big')
                decoded = bytes([data[i] ^ key_bytes[i % key_len] for i in range(len(data))])
                try:
                    text = decoded.decode('utf-8')
                    if all(c in string.printable for c in text):
                        results.append((key_bytes.hex(), text))
                except:
                    pass
        return results
    
    def frequency_analysis(self, text):
        """Análisis de frecuencia para cifrados de sustitución"""
        text = text.upper()
        freq = Counter(c for c in text if c.isalpha())
        total = sum(freq.values())
        
        if total == 0:
            return {}
        
        freq_percent = {char: (count/total)*100 for char, count in freq.items()}
        
        # Intentar mapeo basado en frecuencias
        sorted_cipher = sorted(freq_percent.items(), key=lambda x: x[1], reverse=True)
        sorted_english = sorted(self.freq_english.items(), key=lambda x: x[1], reverse=True)
        
        mapping = {}
        for i, (cipher_char, _) in enumerate(sorted_cipher):
            if i < len(sorted_english):
                mapping[cipher_char] = sorted_english[i][0]
        
        return mapping
    
    def vigenere_crack(self, ciphertext, key_length=None):
        """Intenta romper cifrado Vigenère"""
        if not key_length:
            # Intentar detectar longitud de clave con índice de coincidencia
            key_length = self.find_key_length(ciphertext)
        
        key = ''
        for i in range(key_length):
            # Tomar cada n-ésima letra
            subset = ciphertext[i::key_length]
            # Aplicar análisis de frecuencia a cada subset
            best_shift = self.find_best_shift(subset)
            key += chr(best_shift + ord('A'))
        
        # Decodificar con la clave encontrada
        decoded = self.vigenere_decrypt(ciphertext, key)
        return key, decoded
    
    def find_key_length(self, text, max_len=20):
        """Encuentra longitud probable de clave Vigenère"""
        text = ''.join(c.upper() for c in text if c.isalpha())
        ic_values = []
        
        for key_len in range(1, min(max_len, len(text)//2)):
            ic_sum = 0
            for i in range(key_len):
                subset = text[i::key_len]
                ic_sum += self.index_of_coincidence(subset)
            ic_values.append((key_len, ic_sum / key_len))
        
        # La longitud con IC más alto es probablemente correcta
        return max(ic_values, key=lambda x: x[1])[0]
    
    def index_of_coincidence(self, text):
        """Calcula índice de coincidencia"""
        freq = Counter(text)
        n = len(text)
        if n <= 1:
            return 0
        
        ic = sum(f * (f - 1) for f in freq.values()) / (n * (n - 1))
        return ic
    
    def find_best_shift(self, text):
        """Encuentra el mejor desplazamiento César por chi-cuadrado"""
        text = ''.join(c.upper() for c in text if c.isalpha())
        if not text:
            return 0
        
        best_chi = float('inf')
        best_shift = 0
        
        for shift in range(26):
            shifted = ''.join(chr((ord(c) - ord('A') - shift) % 26 + ord('A')) for c in text)
            chi = self.chi_squared(shifted)
            if chi < best_chi:
                best_chi = chi
                best_shift = shift
        
        return best_shift
    
    def chi_squared(self, text):
        """Calcula chi-cuadrado contra frecuencias del inglés"""
        freq = Counter(text)
        total = len(text)
        chi = 0
        
        for letter in string.ascii_uppercase:
            expected = self.freq_english.get(letter, 0.01) * total / 100
            observed = freq.get(letter, 0)
            chi += (observed - expected) ** 2 / expected
        
        return chi
    
    def vigenere_decrypt(self, ciphertext, key):
        """Decodifica Vigenère con clave conocida"""
        key = key.upper()
        plaintext = ''
        key_index = 0
        
        for char in ciphertext:
            if char.isalpha():
                shift = ord(key[key_index % len(key)]) - ord('A')
                if char.isupper():
                    plaintext += chr((ord(char) - ord('A') - shift) % 26 + ord('A'))
                else:
                    plaintext += chr((ord(char) - ord('a') - shift) % 26 + ord('a'))
                key_index += 1
            else:
                plaintext += char
        
        return plaintext
    
    def auto_decrypt(self, ciphertext):
        """Intenta decodificar automáticamente"""
        print("[*] Analizando cifrado...")
        
        encoding = self.detect_encoding(ciphertext)
        print(f"[+] Tipo detectado: {encoding}")
        
        if encoding == 'base64':
            result = self.decode_base64(ciphertext)
            if result:
                print(f"[+] Base64 decodificado: {result}")
                return result
        
        elif encoding == 'hex':
            result = self.decode_hex(ciphertext)
            if result:
                print(f"[+] Hex decodificado: {result}")
                return result
        
        elif encoding == 'binary':
            result = self.decode_binary(ciphertext)
            if result:
                print(f"[+] Binario decodificado: {result}")
                return result
        
        elif encoding == 'caesar':
            results = self.caesar_brute_force(ciphertext)
            print("[+] Posibles decodificaciones César:")
            for shift, text in results[:5]:
                print(f"  Shift {shift}: {text[:50]}...")
            return results
        
        # Intentar Vigenère si es texto alfabético largo
        if len(ciphertext) > 50 and ciphertext.replace(' ', '').isalpha():
            print("[*] Intentando romper Vigenère...")
            key, decoded = self.vigenere_crack(ciphertext)
            print(f"[+] Clave Vigenère probable: {key}")
            print(f"[+] Texto decodificado: {decoded[:100]}...")
            return decoded
        
        return None

# Instancia global
crypto = CryptoBreaker()