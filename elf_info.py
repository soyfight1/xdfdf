#!/usr/bin/env python3
import sys
import struct


def main() -> int:
    path = '/workspace/sice_cream'
    if len(sys.argv) > 1:
        path = sys.argv[1]
    with open(path, 'rb') as f:
        data = f.read(0x1000)
    if data[:4] != b'\x7fELF':
        print('Not an ELF')
        return 1
    ei_class = data[4]
    ei_data = data[5]
    ei_class_s = {1: 'ELF32', 2: 'ELF64'}.get(ei_class, f'UNKNOWN({ei_class})')
    endian = '<' if ei_data == 1 else '>'
    # e_machine at offset 18 (0x12), 2 bytes
    e_machine = struct.unpack_from(endian + 'H', data, 0x12)[0]
    # Parse program header table: e_phoff (offset 0x1C for 32-bit, 0x20 for 64-bit),
    # e_phentsize (0x2A/0x36), e_phnum (0x2C/0x38)
    if ei_class == 1:
        e_phoff = struct.unpack_from(endian + 'I', data, 0x1C)[0]
        e_phentsize = struct.unpack_from(endian + 'H', data, 0x2A)[0]
        e_phnum = struct.unpack_from(endian + 'H', data, 0x2C)[0]
    else:
        # 64-bit
        with open(path, 'rb') as f:
            data_full = f.read()
        e_phoff = struct.unpack_from(endian + 'Q', data_full, 0x20)[0]
        e_phentsize = struct.unpack_from(endian + 'H', data_full, 0x36)[0]
        e_phnum = struct.unpack_from(endian + 'H', data_full, 0x38)[0]
        data = data_full  # use full for PH parsing

    interp = None
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsize
        if ei_class == 1:
            p_type = struct.unpack_from(endian + 'I', data, off)[0]
            if p_type == 3:  # PT_INTERP
                p_offset = struct.unpack_from(endian + 'I', data, off + 4)
                if isinstance(p_offset, tuple):
                    p_offset = p_offset[0]
                # Read a reasonable chunk for path
                interp_bytes = data[p_offset:p_offset + 256]
                interp = interp_bytes.split(b'\x00', 1)[0].decode('ascii', errors='ignore')
                break
        else:
            p_type = struct.unpack_from(endian + 'I', data, off)[0]
            if p_type == 3:
                p_offset = struct.unpack_from(endian + 'Q', data, off + 8)[0]
                interp_bytes = data[p_offset:p_offset + 512]
                interp = interp_bytes.split(b'\x00', 1)[0].decode('ascii', errors='ignore')
                break

    print(f'class={ei_class_s} e_machine=0x{e_machine:04x} interp={interp}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())

