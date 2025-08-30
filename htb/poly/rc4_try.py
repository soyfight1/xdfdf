import re
from Crypto.Cipher import ARC4, AES
pt=open('flag_dec.bin','rb').read()
keys=[b'aswqx4d', b'hackthebox', b'Poly', b'poly', b'Insane', b'POLY', b'aswqx4dPoly', b'aswqx4dInsane']
for k in keys:
    c=ARC4.new(k)
    dec=c.decrypt(pt)
    m=re.search(rb'HTB\{[^}]+\}',dec)
    if m:
        print('RC4',k,m.group(0)); raise SystemExit
print('none')
