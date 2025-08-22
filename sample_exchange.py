import socket
import sys

HOST = "saturn.picoctf.net"
PORT = 59049
PLAINTEXT_HEX = "00" * 16

def main() -> None:
    try:
        with socket.create_connection((HOST, PORT), timeout=10) as sock:
            sock.settimeout(5.0)
            # read prompt
            banner = b""
            try:
                banner = sock.recv(4096)
            except socket.timeout:
                pass
            sys.stdout.write((banner or b"").decode(errors="replace"))
            # send plaintext
            sock.sendall(PLAINTEXT_HEX.encode() + b"\n")
            # read response until timeout or close
            chunks = []
            while True:
                try:
                    chunk = sock.recv(4096)
                except socket.timeout:
                    break
                if not chunk:
                    break
                chunks.append(chunk)
            resp = b"".join(chunks)
            sys.stdout.write(resp.decode(errors="replace"))
    except Exception as e:
        sys.stderr.write(f"Error: {e}\n")

if __name__ == "__main__":
    main()