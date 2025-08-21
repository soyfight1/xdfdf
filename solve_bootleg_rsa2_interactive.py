#!/usr/bin/env python3
import re
import socket
import sys
from typing import Tuple


HOST = 'jupiter.challenges.picoctf.org'
PORT = 18243


def recv_until(sock: socket.socket, predicate, timeout: float = 5.0) -> bytes:
    sock.settimeout(timeout)
    buf = bytearray()
    while True:
        try:
            chunk = sock.recv(4096)
        except socket.timeout:
            break
        if not chunk:
            break
        buf += chunk
        if predicate(bytes(buf)):
            break
    return bytes(buf)


def parse_params(blob: str) -> Tuple[int, int, int]:
    def extract(label: str, next_label: str | None) -> int:
        start = blob.find(label + ':')
        if start == -1:
            raise ValueError(f"missing label {label}")
        end = len(blob) if next_label is None else blob.find(next_label + ':', start + len(label) + 1)
        if end == -1:
            end = len(blob)
        section = blob[start:end]
        digits = re.sub(r'[^0-9]', '', section)
        if not digits:
            raise ValueError(f"no digits for {label}")
        return int(digits, 10)

    c = extract('c', 'n')
    n = extract('n', 'e')
    e = extract('e', None)
    return c, n, e


def int_to_bytes(n: int) -> bytes:
    if n == 0:
        return b"\x00"
    return n.to_bytes((n.bit_length() + 7) // 8, 'big')


def main() -> int:
    host = HOST
    port = PORT
    if len(sys.argv) > 1:
        host = sys.argv[1]
    if len(sys.argv) > 2:
        port = int(sys.argv[2])

    s = socket.create_connection((host, port), timeout=5.0)
    try:
        # Read until we have e: present (all params)
        data = recv_until(s, lambda b: b.find(b'\ne:') != -1 or b.find(b'\ne:\n') != -1, timeout=3.0)
        text = data.decode('utf-8', errors='ignore')
        c, n, e = parse_params(text)
        m = pow(c, e, n)

        # Send m as decimal with newline
        s.sendall(str(m).encode('ascii') + b"\n")

        # Read the rest, look for picoCTF
        rest = recv_until(s, lambda b: b.find(b'picoCTF{') != -1, timeout=5.0)
        out = (data + rest).decode('utf-8', errors='ignore')
        if 'picoCTF{' in out:
            start = out.find('picoCTF{')
            end = out.find('}', start)
            if end != -1:
                print(out[start:end+1])
                return 0
        # Fallback print everything
        print(out)
        return 0
    finally:
        s.close()


if __name__ == '__main__':
    raise SystemExit(main())

