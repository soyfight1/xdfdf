#!/usr/bin/env python3
import re
import socket
import sys
from typing import Optional, Tuple


HOST = 'jupiter.challenges.picoctf.org'
PORT = 18243


def recv_some(sock: socket.socket, timeout: float = 3.0) -> bytes:
    sock.settimeout(timeout)
    try:
        data = sock.recv(8192)
        return data
    except socket.timeout:
        return b''


def find_flag(text: str) -> Optional[str]:
    s = text
    if 'picoCTF{' in s:
        start = s.find('picoCTF{')
        end = s.find('}', start)
        if end != -1:
            return s[start:end+1]
    return None


def parse_triple(buf: str, start_idx: int = 0) -> Optional[Tuple[int, int, int, int]]:
    # Returns (c, n, e, end_index_after_e_section)
    i_c = buf.find('c:', start_idx)
    if i_c == -1:
        return None
    i_n = buf.find('n:', i_c + 2)
    if i_n == -1:
        return None
    i_e = buf.find('e:', i_n + 2)
    if i_e == -1:
        return None
    # c section between c: and n:
    c_section = buf[i_c:i_n]
    n_section = buf[i_n:i_e]
    # e section until end of block or next blank line
    # Try to end e section at a double newline or end of buf
    next_blk = buf.find('\n\n', i_e + 2)
    if next_blk == -1:
        next_blk = len(buf)
    e_section = buf[i_e:next_blk]

    def digits(s: str) -> int:
        ds = re.sub(r'[^0-9]', '', s)
        if not ds:
            raise ValueError('no digits')
        return int(ds)

    c = digits(c_section)
    n = digits(n_section)
    e = digits(e_section)
    return c, n, e, next_blk


def main() -> int:
    host = HOST
    port = PORT
    if len(sys.argv) > 1:
        host = sys.argv[1]
    if len(sys.argv) > 2:
        port = int(sys.argv[2])

    sock = socket.create_connection((host, port), timeout=5.0)
    try:
        buf = ''
        cursor = 0
        # Prime with initial data
        buf += recv_some(sock, timeout=3.0).decode('utf-8', errors='ignore')
        # Loop until flag
        for _ in range(30):
            flag = find_flag(buf)
            if flag:
                print(flag)
                return 0
            parsed = parse_triple(buf, start_idx=cursor)
            while parsed is None:
                chunk = recv_some(sock, timeout=3.0)
                if not chunk:
                    break
                buf += chunk.decode('utf-8', errors='ignore')
                flag = find_flag(buf)
                if flag:
                    print(flag)
                    return 0
                parsed = parse_triple(buf, start_idx=cursor)
            if parsed is None:
                break
            c, n, _e_remote, end_idx = parsed
            m = pow(c, 65537, n)
            sock.sendall(str(m).encode('ascii') + b"\n")
            cursor = end_idx
            # Read response for this round
            resp = recv_some(sock, timeout=3.0)
            if resp:
                buf += resp.decode('utf-8', errors='ignore')
            # Quick flag check
            flag = find_flag(buf)
            if flag:
                print(flag)
                return 0
        # Final dump if not found
        print(buf)
        return 1
    finally:
        sock.close()


if __name__ == '__main__':
    raise SystemExit(main())

