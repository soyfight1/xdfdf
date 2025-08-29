from PIL import Image
from pathlib import Path
import sys

paths = [
    Path('/workspace/jigsaw/apk_decoded/assets/flutter_assets/assets/images/appIcon.png'),
    Path('/workspace/jigsaw/apk_decoded/assets/flutter_assets/assets/images/app_icon.png'),
    Path('/workspace/jigsaw/apk_decoded/assets/flutter_assets/assets/images/laughing.png'),
]

strategies = []
# Single-channel bit planes
for ch in range(4):
    for bit in (0,1,2,3):
        strategies.append(('single', ch, bit))
# RGBA combined for bit0..3
for bit in (0,1,2,3):
    strategies.append(('rgba', None, bit))
# ARGB combined
for bit in (0,1,2,3):
    strategies.append(('argb', None, bit))

name_map = {0:'R',1:'G',2:'B',3:'A'}

def bits_to_bytes(bits):
    out = bytearray()
    cur = 0
    cnt = 0
    for b in bits:
        cur = (cur << 1) | (b & 1)
        cnt += 1
        if cnt == 8:
            out.append(cur)
            cur = 0
            cnt = 0
    if cnt:
        out.append(cur << (8-cnt))
    return bytes(out)

for p in paths:
    if not p.exists():
        print(f'[skip] {p} not found')
        continue
    im = Image.open(p).convert('RGBA')
    px = im.load()
    w,h = im.size
    print(f'[img] {p.name} {w}x{h}')
    for kind, ch, bit in strategies:
        bits = []
        if kind == 'single':
            for y in range(h):
                for x in range(w):
                    r,g,b,a = px[x,y]
                    val = (r,g,b,a)[ch]
                    bits.append((val >> bit) & 1)
        elif kind == 'rgba':
            for y in range(h):
                for x in range(w):
                    r,g,b,a = px[x,y]
                    bits.extend([(r>>bit)&1, (g>>bit)&1, (b>>bit)&1, (a>>bit)&1])
        elif kind == 'argb':
            for y in range(h):
                for x in range(w):
                    r,g,b,a = px[x,y]
                    bits.extend([(a>>bit)&1, (r>>bit)&1, (g>>bit)&1, (b>>bit)&1])
        data = bits_to_bytes(bits)
        idx = data.find(b'HTB{')
        if idx != -1:
            print(f'[hit] {p.name} kind={kind} ch={name_map.get(ch,-)} bit={bit} offset={idx}')
            snippet = data[idx:idx+200]
            try:
                print(snippet.decode('utf-8','replace'))
            except Exception:
                print(snippet[:120])
            sys.exit(0)
print('[done] no HTB{ found via simple LSB strategies')
