import socket
import sys

HOST = "saturn.picoctf.net"
PORT = 59049

def main() -> None:
    try:
        with socket.create_connection((HOST, PORT), timeout=10) as sock:
            sock.settimeout(2.0)
            data_chunks = []
            try:
                while True:
                    chunk = sock.recv(4096)
                    if not chunk:
                        break
                    data_chunks.append(chunk)
                    if len(b"".join(data_chunks)) > 1_000_000:
                        break
            except socket.timeout:
                pass

            banner = b"".join(data_chunks)
            sys.stdout.write("--- Received banner ---\n")
            try:
                sys.stdout.write(banner.decode(errors="replace"))
            except Exception:
                sys.stdout.write(repr(banner))
            sys.stdout.write("\n--- End banner ---\n")
            sys.stdout.flush()

            # Try sending a newline to see if it prompts again
            try:
                sock.sendall(b"\n")
                try:
                    resp = sock.recv(8192)
                except socket.timeout:
                    resp = b""
                if resp:
                    sys.stdout.write("--- Response to newline ---\n")
                    sys.stdout.write(resp.decode(errors="replace"))
                    sys.stdout.write("\n--- End response ---\n")
            except Exception as e:
                sys.stderr.write(f"Send error: {e}\n")
    except Exception as e:
        sys.stderr.write(f"Connection error: {e}\n")

if __name__ == "__main__":
    main()