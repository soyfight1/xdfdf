#!/usr/bin/env python3
import re
import sys


def read_text(path: str) -> str:
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        return f.read()


def extract_int(blob: str, label: str, next_label: str | None) -> int:
    start = blob.find(label + ':')
    if start == -1:
        raise ValueError(f'label {label} not found')
    end = len(blob) if next_label is None else blob.find(next_label + ':', start + len(label) + 1)
    if end == -1:
        end = len(blob)
    section = blob[start:end]
    digits = re.sub(r'[^0-9]', '', section)
    if not digits:
        raise ValueError(f'no digits for {label}')
    return int(digits)


def int_to_bytes(n: int, byteorder: str) -> bytes:
    if n == 0:
        return b'\x00'
    length = (n.bit_length() + 7) // 8
    be = n.to_bytes(length, 'big')
    return be if byteorder == 'big' else be[::-1]


def find_flag(buf: bytes) -> str | None:
    try:
        s = buf.decode('utf-8', errors='ignore')
    except Exception:
        s = ''
    if 'picoCTF{' in s:
        start = s.find('picoCTF{')
        end = s.find('}', start)
        if end != -1:
            return s[start:end+1]
    return None


def main() -> int:
    path = '/workspace/rsa_params.txt'
    if len(sys.argv) > 1:
        path = sys.argv[1]
    blob = read_text(path)
    c = extract_int(blob, 'c', 'n')
    n = extract_int(blob, 'n', 'e')
    e = extract_int(blob, 'e', None)
    m = pow(c, e, n)
    # Try big-endian
    be = int_to_bytes(m, 'big')
    flag = find_flag(be)
    if flag:
        print(flag)
        return 0
    # Try little-endian
    le = int_to_bytes(m, 'little')
    flag = find_flag(le)
    if flag:
        print(flag)
        return 0
    # If still not found, try hex-decoding path: bytes to hex then interpret as ascii
    hx = be.hex()
    # Search picoCTF in hex-ascii view
    try:
        hx_as_bytes = bytes.fromhex(hx)
        flag = find_flag(hx_as_bytes)
        if flag:
            print(flag)
            return 0
    except Exception:
        pass
    # Print preview for debugging
    print(be[:128])
    return 1


if __name__ == '__main__':
    raise SystemExit(main())

