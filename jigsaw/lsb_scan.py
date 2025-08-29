from PIL import Image
from pathlib import Path
import string

p = Path('/workspace/jigsaw/apk_decoded/assets/flutter_assets/assets/images/laughing.png')
im = Image.open(p).convert('RGBA')
px = im.load()
w, h = im.size
channels = ['R','G','B','A']
res = []
for ci, cname in enumerate(channels):
    for bit in range(2):
        bits = []
        for y in range(h):
            for x in range(w):
                r,g,b,a = px[x,y]
                val = (r,g,b,a)[ci]
                bits.append((val >> bit) & 1)
        # pack bits into bytes
        out = bytearray()
        for i in range(0, len(bits), 8):
            byte = 0
            for j in range(8):
                if i+j < len(bits):
                    byte = (byte << 1) | bits[i+j]
                else:
                    byte <<= 1
            out.append(byte)
        text = bytes(out)
        # search for HTB{ pattern
        idx = text.find(b'HTB{')
        snippet = text[idx:idx+120] if idx != -1 else b''
        printable = ''.join(chr(c) if chr(c) in string.printable else '.' for c in snippet)
        print(f'Channel={cname} bit={bit} hit={idx}')
        if idx != -1:
            print(printable)
