#!/usr/bin/env python3
import socket
import sys

HOST = 'jupiter.challenges.picoctf.org'
PORT = 18243

def main() -> int:
    host = HOST
    port = PORT
    if len(sys.argv) >= 2:
        host = sys.argv[1]
    if len(sys.argv) >= 3:
        port = int(sys.argv[2])

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(3.0)
    s.connect((host, port))
    try:
        while True:
            try:
                data = s.recv(4096)
            except socket.timeout:
                break
            if not data:
                break
            sys.stdout.buffer.write(data)
            sys.stdout.flush()
    finally:
        s.close()
    return 0

if __name__ == '__main__':
    raise SystemExit(main())

