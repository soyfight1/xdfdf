import base64, sys
path = sys.argv[1] if len(sys.argv) > 1 else "pwn_khp_protocol/challenge/users.keys"
for line in open(path, "r", encoding="utf-8").read().splitlines():
    line = line.strip()
    if not line:
        continue
    if line.endswith(";"):
        line = line[:-1]
    if " " not in line:
        print("SKIP:", line)
        continue
    left, b64 = line.rsplit(" ", 1)
    try:
        dec = base64.b64decode(b64 + "==")
    except Exception:
        dec = b"(decode_error)"
    print(f"{left} -> {dec!r}")
