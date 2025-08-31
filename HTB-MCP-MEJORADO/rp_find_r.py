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


def try_update(ip: str, port: int, T: int) -> bool:
    s = socket.socket(); s.settimeout(8)
    try:
        s.connect((ip, port))
        recv_prompt(s)
        s.sendall(b'2\n')
        recv_prompt(s)
        payload = '[' + ','.join(str(T) for _ in range(256)) + ']\n'
        s.sendall(payload.encode())
        out = recv_prompt(s)
        s.close()
        return 'Choose an option:' in out
    except Exception:
        try:
            s.close()
        except Exception:
            pass
        return False


def main():
    if len(sys.argv) != 3:
        print('Uso: python3 rp_find_r.py <IP> <PORT>')
        sys.exit(1)
    ip = sys.argv[1]
    port = int(sys.argv[2])

    lo = 1 << (A_BITS + R_BITS - 1)
    hi = 1 << (A_BITS + R_BITS + 1)

    if not try_update(ip, port, lo):
        print('[-] lo no aceptado, abortando')
        sys.exit(1)
    if try_update(ip, port, hi):
        print('[-] hi aceptado, abortando')
        sys.exit(1)

    steps = 0
    while hi - lo > 1:
        mid = (lo + hi) // 2
        ok = try_update(ip, port, mid)
        if ok:
            lo = mid
        else:
            hi = mid
        steps += 1
        if steps % 8 == 0:
            print(f'[*] step={steps}, window_bits={(hi - lo).bit_length()}')
            sys.stdout.flush()

    Tmax = lo
    r = Tmax >> A_BITS
    print(f'[+] r={r}')
    # persist
    with open('r_value.txt', 'w') as f:
        f.write(str(r))


if __name__ == '__main__':
    main()

