#!/usr/bin/env python3
import sys
import struct
from typing import List, Optional, Tuple


def read_file_bytes(path: str) -> bytes:
    with open(path, 'rb') as f:
        return f.read()


def get_bmp_pixel_data_offset(data: bytes) -> int:
    # BMP header: bytes 0-1 = 'BM', bytes 10-13 = pixel array offset (little-endian uint32)
    if len(data) < 14:
        return 0
    if not (data[0:2] == b'BM'):
        # Not a BMP; fallback to 0
        return 0
    return struct.unpack_from('<I', data, 10)[0]


def extract_lsb_bits(byte_data: bytes, start: int = 0) -> List[int]:
    return [(b & 1) for b in byte_data[start:]]


def bits_to_bytes(bits: List[int], msb_first: bool, bit_shift: int) -> bytes:
    # Apply bit alignment shift by discarding leading bits
    usable = bits[bit_shift:]
    nbytes = len(usable) // 8
    out = bytearray(nbytes)
    if msb_first:
        for i in range(nbytes):
            byte_val = 0
            base = i * 8
            # bit 7..0
            for j in range(8):
                byte_val |= (usable[base + j] & 1) << (7 - j)
            out[i] = byte_val
    else:
        for i in range(nbytes):
            byte_val = 0
            base = i * 8
            for j in range(8):
                byte_val |= (usable[base + j] & 1) << j
            out[i] = byte_val
    return bytes(out)


def find_flag_in_bytes(data: bytes) -> Optional[Tuple[int, int, bytes]]:
    # Search for picoCTF{...}
    start_token = b"picoCTF{"
    pos = data.find(start_token)
    if pos == -1:
        return None
    # Find closing brace after pos
    end = data.find(b'}', pos + len(start_token))
    if end == -1:
        # If no closing brace, try a reasonable cap
        end = min(len(data) - 1, pos + 200)
    return pos, end, data[pos:end + 1]


def try_simple_shifts(bits: List[int]) -> Optional[str]:
    # Try 8 alignments and both bit orders
    for msb_first in (True, False):
        for shift in range(8):
            candidate = bits_to_bytes(bits, msb_first=msb_first, bit_shift=shift)
            found = find_flag_in_bytes(candidate)
            if found:
                _, _, flag_bytes = found
                try:
                    return flag_bytes.decode('ascii', errors='ignore')
                except Exception:
                    return flag_bytes.decode('latin1', errors='ignore')
    return None


def try_caesar_shifts(bits: List[int]) -> Optional[str]:
    # If the bytes are shifted (e.g., +k or -k), try small range
    for msb_first in (True, False):
        for shift in range(8):
            raw = bits_to_bytes(bits, msb_first=msb_first, bit_shift=shift)
            for k in range(-8, 9):
                shifted = bytes(((b + k) & 0xFF) for b in raw)
                found = find_flag_in_bytes(shifted)
                if found:
                    _, _, flag_bytes = found
                    try:
                        return flag_bytes.decode('ascii', errors='ignore')
                    except Exception:
                        return flag_bytes.decode('latin1', errors='ignore')
    return None


def main() -> int:
    path = 'encoded.bmp'
    if len(sys.argv) > 1:
        path = sys.argv[1]
    data = read_file_bytes(path)
    pixel_offset = get_bmp_pixel_data_offset(data)
    # Extract LSBs from pixel data onward
    bits = extract_lsb_bits(data, start=pixel_offset)

    # First pass: direct
    flag = try_simple_shifts(bits)
    if flag:
        print(flag)
        return 0

    # Second pass: small Caesar shifts
    flag = try_caesar_shifts(bits)
    if flag:
        print(flag)
        return 0

    print('FLAG_NOT_FOUND')
    return 1


if __name__ == '__main__':
    raise SystemExit(main())

