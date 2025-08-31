#!/usr/bin/env python3
import socket
import sys

A_BITS = 384
R_BITS = 640


def recv_prompt(s: socket.socket, timeout: float = 4.0) -> str:
    s.settimeout(timeout)
    out = b''
    try:
        while True:
            c = s.recv(65536)
            if not c:
                break
            out += c
            if out.endswith(b'> ') or out.rstrip().endswith(b'>'):
                break
    except Exception:
        pass
    return out.decode(errors='ignore')


def connect(ip: str, port: int) -> socket.socket:
    s = socket.socket()
    s.settimeout(6)
    s.connect((ip, port))
    recv_prompt(s)
    return s


def update_accept(s: socket.socket, T: int) -> bool:
    try:
        s.sendall(b'2\n')
        recv_prompt(s)  # 'Encrypted key:'
        payload = '[' + ','.join(str(T) for _ in range(256)) + ']\n'
        s.sendall(payload.encode())
        out = recv_prompt(s)
        return 'Choose an option:' in out
    except Exception:
        return False


def main():
    if len(sys.argv) != 3:
        print('Uso: python3 rp_binsearch_persist.py <IP> <PORT>')
        sys.exit(1)
    ip = sys.argv[1]
    port = int(sys.argv[2])

    s = connect(ip, port)
    # Bracketing
    lo = 1 << (A_BITS + R_BITS - 1)  # guaranteed accept
    hi = 1 << (A_BITS + R_BITS + 1)  # guaranteed reject
    # Quick sanity
    if not update_accept(s, lo):
        print('[-] Sanity check failed: lo not accepted')
        sys.exit(1)
    if update_accept(s, hi):
        print('[-] Sanity check failed: hi accepted')
        sys.exit(1)

    steps = 0
    while hi - lo > 1:
        mid = (lo + hi) // 2
        ok = update_accept(s, mid)
        if ok:
            lo = mid
        else:
            hi = mid
        steps += 1
        if steps % 16 == 0:
            print(f'[*] Progress: step {steps}, window bits ~{(hi - lo).bit_length()}')
    Tmax = lo
    r = Tmax >> A_BITS
    print(f'[+] r recovered: {r}')


if __name__ == '__main__':
    main()

