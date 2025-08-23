#!/usr/bin/env python3
import os
import pty
import subprocess
import time
import select
import sys
import fcntl
import termios
import struct

ART_DIR = "/workspace/work/artifacts"
BIN = os.path.join(ART_DIR, "game")
LOG_PATH = os.path.join(ART_DIR, "pty_capture.log")


def setwinsize(fd, rows, cols):
	winsize = struct.pack("HHHH", rows, cols, 0, 0)
	fcntl.ioctl(fd, termios.TIOCSWINSZ, winsize)


def main():
	if not os.path.exists(BIN):
		print(f"No existe el binario: {BIN}", file=sys.stderr)
		sys.exit(1)

	master_fd, slave_fd = pty.openpty()
	setwinsize(master_fd, 40, 120)
	env = os.environ.copy()
	env.setdefault("TERM", "xterm-256color")
	env.setdefault("LANG", "C")

	proc = subprocess.Popen(
		[BIN],
		stdin=slave_fd,
		stdout=slave_fd,
		stderr=slave_fd,
		cwd=ART_DIR,
		env=env,
	)
	os.close(slave_fd)

	buf = bytearray()
	start = time.time()

	def read_nonblock(timeout=0.05):
		ready, _, _ = select.select([master_fd], [], [], timeout)
		if ready:
			try:
				chunk = os.read(master_fd, 65536)
				if chunk:
					buf.extend(chunk)
			except OSError:
				pass

	# dejar iniciar
	for _ in range(30):
		read_nonblock(0.05)
		time.sleep(0.02)

	# Ayuda y posibles modos
	for k in ["?", "h", "H"]:
		os.write(master_fd, k.encode())
		for _ in range(10):
			read_nonblock(0.05)
			time.sleep(0.01)

	# Intentos de teleport (t/T) y coordenadas en varios órdenes
	attempts = [
		("t", "10 10\n"),
		("t", "20 5\n"),
		("t", "5 20\n"),
		("T", "10 10\n"),
		("T", "5 20\n"),
		("T", "20 5\n"),
		("t", "318 294916\n"),
		("t", "294916 318\n"),
	]
	for key, coords in attempts:
		os.write(master_fd, key.encode())
		for _ in range(5):
			read_nonblock(0.05)
			time.sleep(0.01)
		os.write(master_fd, coords.encode())
		for _ in range(20):
			read_nonblock(0.05)
			time.sleep(0.02)

	# Movimiento básico
	moves = ("w"*10 + "a"*10 + "s"*10 + "d"*10 + ">" + "<")
	for ch in moves:
		os.write(master_fd, ch.encode())
		for _ in range(5):
			read_nonblock(0.03)
			time.sleep(0.01)

	# Capturar 2 segundos adicionales
	deadline = time.time() + 2.0
	while time.time() < deadline:
		read_nonblock(0.05)
		time.sleep(0.01)

	# Salir
	os.write(master_fd, b"Q")
	for _ in range(30):
		read_nonblock(0.03)
		time.sleep(0.01)

	# matar si sigue vivo
	try:
		proc.terminate()
		proc.wait(timeout=1)
	except Exception:
		proc.kill()
		try:
			proc.wait(timeout=1)
		except Exception:
			pass

	with open(LOG_PATH, "wb") as f:
		f.write(buf)

	print(f"Capturados {len(buf)} bytes en {LOG_PATH}")


if __name__ == "__main__":
	main()