#!/usr/bin/env python3
import re
import sys


def read_text(path: str) -> str:
    with open(path, 'r', encoding='utf-8', errors='ignore') as f:
        return f.read()


def extract_ints_from_labeled_blob(blob: str, label: str, next_label: str | None) -> int:
    start_idx = blob.find(label + ':')
    if start_idx == -1:
        raise ValueError(f'label {label} not found')
    end_idx = len(blob) if next_label is None else blob.find(next_label + ':', start_idx + len(label) + 1)
    if end_idx == -1:
        end_idx = len(blob)
    section = blob[start_idx:end_idx]
    digits = re.sub(r'[^0-9]', '', section)
    if not digits:
        raise ValueError(f'no digits found for {label}')
    return int(digits, 10)


def int_to_bytes(n: int) -> bytes:
    if n == 0:
        return b'\x00'
    length = (n.bit_length() + 7) // 8
    return n.to_bytes(length, 'big')


def main() -> int:
    path = '/workspace/rsa_session.txt'
    if len(sys.argv) > 1:
        path = sys.argv[1]
    blob = read_text(path)
    c = extract_ints_from_labeled_blob(blob, 'c', 'n')
    n = extract_ints_from_labeled_blob(blob, 'n', 'e')
    e = extract_ints_from_labeled_blob(blob, 'e', None)
    m = pow(c, e, n)
    m_bytes = int_to_bytes(m)
    try:
        m_text = m_bytes.decode('utf-8', errors='ignore')
    except Exception:
        m_text = ''
    # Print best effort: ASCII text and hex fallback if needed
    if 'picoCTF{' in m_text:
        start = m_text.find('picoCTF{')
        end = m_text.find('}', start)
        if end != -1:
            print(m_text[start:end+1])
            return 0
    # If not found plainly, print whole decoded text for manual check
    print(m_text)
    return 0


if __name__ == '__main__':
    raise SystemExit(main())

