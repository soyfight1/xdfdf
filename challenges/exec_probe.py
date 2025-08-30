#!/usr/bin/env python3
import os, socket, time, sys

def recv_all(s, t=0.8):
    s.settimeout(t)
    out=b
    try:
        while True:
            d=s.recv(65535)
            if not d: break
            out+=d
            if len(d)<65535: break
    except Exception:
        pass
    return out

def send(s, line):
    if not line.endswith(n): line+=n
    s.sendall(line.encode()); time.sleep(0.3)
    return recv_all(s, 0.8)

ip=os.environ.get(IP); port=int(os.environ.get(PORT))
mode=sys.argv[1] if len(sys.argv)>1 else plain

if mode==plain:
    with socket.create_connection((ip,port),timeout=5) as s:
        _=recv_all(s,0.3)
        print(send(s,EXEC).decode(utf-8,ignore))
elif mode==auth1:
    with socket.create_connection((ip,port),timeout=5) as s:
        _=recv_all(s,0.3)
        send(s,AUTH
