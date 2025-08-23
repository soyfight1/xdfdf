#!/usr/bin/env python3
import re
import sys

LOG = "/workspace/work/artifacts/pty_capture.log"
OUT = "/workspace/work/artifacts/final_screen.txt"
ROWS, COLS = 40, 120

CSI = re.compile(rb"\x1b\[([0-9;?]*)([A-Za-z])")

def clamp(v, lo, hi):
	return lo if v < lo else hi if v > hi else v


def main():
	try:
		data = open(LOG, 'rb').read()
	except FileNotFoundError:
		print("No log file found", file=sys.stderr)
		sys.exit(1)

	buf = [[" "] * COLS for _ in range(ROWS)]
	row, col = 0, 0
	i = 0
	while i < len(data):
		b = data[i]
		if b == 0x1b and i + 1 < len(data) and data[i+1:i+2] == b"[":
			m = CSI.match(data, i)
			if m:
				params = m.group(1).decode(errors='ignore')
				cmd = m.group(2).decode()
				# Handle a few CSI commands
				if cmd in ("H", "f"):
					# cursor position: row;col
					parts = [p for p in params.split(";") if p and p != "?"]
					r = int(parts[0]) if len(parts) >= 1 else 1
					c = int(parts[1]) if len(parts) >= 2 else 1
					row = clamp(r-1, 0, ROWS-1)
					col = clamp(c-1, 0, COLS-1)
				elif cmd == "J":
					# clear screen (treat 2J as full clear)
					for rr in range(ROWS):
						for cc in range(COLS):
							buf[rr][cc] = " "
				elif cmd == "K":
					# clear to EOL
					for cc in range(col, COLS):
						buf[row][cc] = " "
				elif cmd in ("A","B","C","D"):
					# cursor moves
					val = int(params or "1")
					if cmd == "A":
						row = clamp(row - val, 0, ROWS-1)
					elif cmd == "B":
						row = clamp(row + val, 0, ROWS-1)
					elif cmd == "C":
						col = clamp(col + val, 0, COLS-1)
					elif cmd == "D":
						col = clamp(col - val, 0, COLS-1)
				# ignore other commands (m, r, t, l, h, s, u, etc.)
				i = m.end()
				continue
		# Control chars
		if b == 0x0d:  # CR
			col = 0
			i += 1
			continue
		elif b == 0x0a:  # LF
			row = clamp(row + 1, 0, ROWS-1)
			i += 1
			continue
		elif b == 0x08:  # BS
			col = clamp(col - 1, 0, COLS-1)
			i += 1
			continue
		# Printable
		if 32 <= b <= 126:
			buf[row][col] = chr(b)
			col = clamp(col + 1, 0, COLS-1)
		i += 1

	with open(OUT, 'w') as f:
		for rr in range(ROWS):
			line = ''.join(buf[rr]).rstrip()
			f.write(line + "\n")
	print(f"Escrito buffer final en {OUT}")

if __name__ == '__main__':
	main()