#!/usr/bin/env python3
import re
from typing import Tuple


def parse_params(path: str) -> Tuple[int, int, int]:
	with open(path, "r") as f:
		data = f.read()
	# Extract N as everything between 'N:' and the following 'e:' line
	n_match = re.search(r"N:\s*([0-9 \t\r\n]+?)\n\s*e:\s*([0-9]+)", data)
	if not n_match:
		raise ValueError("Could not parse N/e block")
	n_str = re.sub(r"\s+", "", n_match.group(1))
	N = int(n_str)
	e = int(n_match.group(2))
	# Extract c as everything after 'ciphertext (c):'
	c_match = re.search(r"ciphertext\s*\(c\):\s*([0-9 \t\r\n]+)\s*\Z", data)
	if not c_match:
		raise ValueError("Could not parse c")
	c_str = re.sub(r"\s+", "", c_match.group(1))
	c = int(c_str)
	return N, e, c


def integer_cuberoot(n: int) -> Tuple[int, bool]:
	"""Return (r, exact) where r = floor(cuberoot(n)). exact=True iff r**3 == n.
	Uses binary search with exponential bound finding.
	"""
	if n < 0:
		raise ValueError("n must be non-negative")
	if n < 8:
		for r in range(0, 3):
			if r ** 3 == n:
				return r, True
		return int(round(n ** (1/3))), False
	low = 0
	high = 1
	while high ** 3 <= n:
		low = high
		high <<= 1
	while low + 1 < high:
		mid = (low + high) // 2
		m3 = mid ** 3
		if m3 == n:
			return mid, True
		if m3 < n:
			low = mid
		else:
			high = mid
	return low, low ** 3 == n


def main() -> None:
	N, e, c = parse_params("/workspace/work/mini-rsa/ciphertext")
	assert e == 3, f"Expected e=3, got e={e}"
	found = None
	for max_k in (1000, 10000, 100000, 1000000):
		for k in range(1, max_k + 1):
			val = c + k * N
			root, exact = integer_cuberoot(val)
			if exact and root ** 3 == val:
				m = root
				if pow(m, e, N) == c % N:
					found = (k, m)
					break
		if found:
			break
	if not found:
		raise RuntimeError("Failed to find k such that c + k*N is a perfect cube within bounds")
	k, m = found
	m_bytes_len = (m.bit_length() + 7) // 8
	m_bytes = m.to_bytes(m_bytes_len, byteorder="big")
	flag_match = re.search(rb"picoCTF\{[^}]+\}", m_bytes)
	print(f"k={k}")
	if flag_match:
		flag = flag_match.group(0).decode("ascii", errors="ignore")
		print(flag)
	else:
		print("no_flag_found")
		print(m_bytes.hex())


if __name__ == "__main__":
	main()