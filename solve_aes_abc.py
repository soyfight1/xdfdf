#!/usr/bin/env python3

import sys
from typing import Tuple

BLOCK_SIZE = 16
UMAX = 1 << (8 * BLOCK_SIZE)


def parse_header_ppm(data: bytes) -> Tuple[bytes, bytes]:
    # Extract first three lines (PPM P6 header)
    remaining = data
    header_lines = []
    for _ in range(3):
        idx = remaining.index(b"\n")
        header_lines.append(remaining[: idx + 1])
        remaining = remaining[idx + 1 :]
    return b"".join(header_lines), remaining


def int_from_be(block: bytes) -> int:
    return int.from_bytes(block, byteorder="big")


def int_to_be(value: int, size: int = BLOCK_SIZE) -> bytes:
    return (value % UMAX).to_bytes(size, byteorder="big")


def dechain_abc_to_ecb(stream: bytes) -> Tuple[bytes, bytes]:
    # stream = IV || S1 || S2 || ...
    assert len(stream) >= BLOCK_SIZE and (len(stream) - BLOCK_SIZE) % BLOCK_SIZE == 0
    iv = stream[:BLOCK_SIZE]
    chain = stream[BLOCK_SIZE:]
    blocks = [chain[i : i + BLOCK_SIZE] for i in range(0, len(chain), BLOCK_SIZE)]

    prev = int_from_be(iv)
    ecb_blocks = []
    for s in blocks:
        s_int = int_from_be(s)
        c_int = (s_int - prev) % UMAX
        ecb_blocks.append(int_to_be(c_int))
        prev = s_int

    return iv, b"".join(ecb_blocks)


def write_ppm(path: str, header: bytes, body: bytes) -> None:
    with open(path, "wb") as f:
        f.write(header)
        f.write(body)


ASCII_GRADIENT = " .:-=+*#%@"


def ppm_to_ascii(ppm_bytes: bytes, max_cols: int = 120, y_scale_factor: int = 1) -> str:
    # Very simple PPM P6 (binary) reader and ASCII renderer
    header, body = parse_header_ppm(ppm_bytes)
    header_lines = header.splitlines()
    if len(header_lines) < 3:
        raise ValueError("Invalid PPM header")
    # PPM header: magic, width height, maxval
    if header_lines[0] != b"P6":
        raise ValueError("Expected P6 PPM")
    dims = header_lines[1].split()
    width, height = int(dims[0]), int(dims[1])
    maxval = int(header_lines[2])
    if maxval != 255:
        raise ValueError("Unsupported maxval != 255")

    # Convert to grayscale luminance and downsample to max_cols
    import math

    pixels = body
    if len(pixels) < width * height * 3:
        raise ValueError("PPM body too short")
    if len(pixels) > width * height * 3:
        pixels = pixels[: width * height * 3]

    # Determine sampling step
    scale = max(1, width // max_cols)
    out_cols = width // scale
    out_rows = height // max(1, scale * y_scale_factor)
    if out_rows <= 0:
        out_rows = 1

    lines = []
    for row in range(out_rows):
        y = row * scale * 2
        if y >= height:
            break
        line_chars = []
        for col in range(out_cols):
            x = col * scale
            if x >= width:
                break
            # Sample one pixel at (x, y)
            idx = (y * width + x) * 3
            r, g, b = pixels[idx], pixels[idx + 1], pixels[idx + 2]
            # Luminance
            lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
            # Map to gradient
            grad_idx = int((lum / 255.0) * (len(ASCII_GRADIENT) - 1))
            line_chars.append(ASCII_GRADIENT[grad_idx])
        lines.append("".join(line_chars))
    return "\n".join(lines)


def ppm_to_ascii_bw(ppm_bytes: bytes, max_cols: int = 200, threshold: int = 128, y_scale_factor: int = 1) -> str:
    header, body = parse_header_ppm(ppm_bytes)
    header_lines = header.splitlines()
    if len(header_lines) < 3:
        raise ValueError("Invalid PPM header")
    if header_lines[0] != b"P6":
        raise ValueError("Expected P6 PPM")
    dims = header_lines[1].split()
    width, height = int(dims[0]), int(dims[1])
    maxval = int(header_lines[2])
    if maxval != 255:
        raise ValueError("Unsupported maxval != 255")

    pixels = body
    if len(pixels) < width * height * 3:
        raise ValueError("PPM body too short")
    if len(pixels) > width * height * 3:
        pixels = pixels[: width * height * 3]

    scale = max(1, width // max_cols)
    out_cols = width // scale
    out_rows = height // max(1, scale * y_scale_factor)

    lines = []
    for row in range(out_rows):
        y = row * scale * y_scale_factor
        if y >= height:
            break
        line_chars = []
        for col in range(out_cols):
            x = col * scale
            if x >= width:
                break
            idx = (y * width + x) * 3
            r, g, b = pixels[idx], pixels[idx + 1], pixels[idx + 2]
            lum = (299 * r + 587 * g + 114 * b) // 1000
            ch = '#' if lum < threshold else ' '
            line_chars.append(ch)
        lines.append("".join(line_chars).rstrip())
    return "\n".join(lines)


def main():
    enc_path = sys.argv[1] if len(sys.argv) > 1 else "body.enc.ppm"
    out_ppm_path = sys.argv[2] if len(sys.argv) > 2 else "recovered_ecb.ppm"

    with open(enc_path, "rb") as f:
        enc_bytes = f.read()

    header, payload = parse_header_ppm(enc_bytes)
    # Extract dimensions from header
    header_lines = header.splitlines()
    dims = header_lines[1].split()
    width, height = int(dims[0]), int(dims[1])
    pixel_len = width * height * 3

    iv, ecb_body = dechain_abc_to_ecb(payload)
    # Drop AES padding to match PPM pixel length
    ecb_trimmed = ecb_body[:pixel_len]

    # Write ECB-as-image to visualize patterns
    write_ppm(out_ppm_path, header, ecb_trimmed)

    # Also print ASCII previews
    try:
        ascii_art = ppm_to_ascii(header + ecb_trimmed, max_cols=320, y_scale_factor=1)
        print(ascii_art)
        print("\n" + "-" * 80 + "\n")
        ascii_bw = ppm_to_ascii_bw(header + ecb_trimmed, max_cols=240, threshold=140, y_scale_factor=1)
        print(ascii_bw)
    except Exception as e:
        print(f"[!] ASCII preview failed: {e}")
        print(f"[i] Wrote {out_ppm_path}")


if __name__ == "__main__":
    main()

