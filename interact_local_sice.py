#!/usr/bin/env python3
import subprocess
import sys
import time
import re


BIN = ['/workspace/ld-2.23.so', '--library-path', '/workspace', '/workspace/sice_cream']


def run_with_input(lines):
    p = subprocess.Popen(BIN, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    out = ''
    try:
        # Read initial banner
        time.sleep(0.1)
        try:
            chunk = p.stdout.read(1)
            while chunk:
                out += chunk
                if out.endswith('> '):
                    break
                if len(out) > 10000:
                    break
                p.stdout.flush()
                chunk = p.stdout.read(1)
        except Exception:
            pass

        for line in lines:
            if p.poll() is not None:
                break
            p.stdin.write(line + "\n")
            p.stdin.flush()
            # Read until next prompt or exit
            time.sleep(0.05)
            while True:
                if p.poll() is not None:
                    break
                p.stdout.flush()
                c = p.stdout.read(1)
                if not c:
                    break
                out += c
                if out.endswith('> '):
                    break
            # tiny wait
            time.sleep(0.02)
    finally:
        try:
            p.kill()
        except Exception:
            pass
    return out


def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else 'fmt'
    if mode == 'fmt':
        fmt = '%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.'
        # Set normal name first, then choose 3 and provide fmt as new name
        lines = ['tester', '3', fmt, '4']
    elif mode == 'overflow':
        lines = ['A' * 600, '2', '4']
    elif mode == 'seq':
        # Remaining args are the lines to feed (first arg after 'seq' is the name)
        if len(sys.argv) <= 2:
            lines = ['tester', '4']
        else:
            # Support simple macros like A*1000, B*50, PAD:x:32
            raw = sys.argv[2:]
            mac = re.compile(r'^(?:(PAD):(.):([0-9]+)|([A-Za-z])\*([0-9]+))$')
            def expand(tok: str) -> str:
                m = mac.match(tok)
                if not m:
                    return tok
                if m.group(1) == 'PAD':
                    ch = m.group(2)
                    n = int(m.group(3))
                    return ch * n
                ch2 = m.group(4)
                n2 = int(m.group(5))
                return ch2 * n2
            lines = [expand(x) for x in raw]
    else:
        lines = [mode, '2', '4']
    out = run_with_input(lines)
    sys.stdout.write(out)


if __name__ == '__main__':
    main()

