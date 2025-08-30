#!/usr/bin/env python3
import socket
import sys
from typing import List, Tuple

P = 257  # prime field


def gf(x: int) -> int:
    return x % P


def gf_add(a: int, b: int) -> int:
    return (a + b) % P


def gf_sub(a: int, b: int) -> int:
    return (a - b) % P


def gf_mul(a: int, b: int) -> int:
    return (a * b) % P


def gf_inv(a: int) -> int:
    if a % P == 0:
        raise ZeroDivisionError("no inverse for 0 in GF(257)")
    # Fermat little theorem since P is prime
    return pow(a, P - 2, P)


def gf_div(a: int, b: int) -> int:
    return gf_mul(a, gf_inv(b))


def s_map(x: int) -> int:
    return pow(x % P, 3, P)


def s_inv_map(x: int) -> int:
    # inverse of 3 mod 256 is 171
    return pow(x % P, 171, P)


def mat_identity(n: int) -> List[List[int]]:
    return [[1 if i == j else 0 for j in range(n)] for i in range(n)]


def mat_add(A: List[List[int]], B: List[List[int]]) -> List[List[int]]:
    n, m = len(A), len(A[0])
    return [[gf_add(A[i][j], B[i][j]) for j in range(m)] for i in range(n)]


def mat_sub(A: List[List[int]], B: List[List[int]]) -> List[List[int]]:
    n, m = len(A), len(A[0])
    return [[gf_sub(A[i][j], B[i][j]) for j in range(m)] for i in range(n)]


def mat_scalar_mul(a: int, M: List[List[int]]) -> List[List[int]]:
    n, m = len(M), len(M[0])
    return [[gf_mul(a, M[i][j]) for j in range(m)] for i in range(n)]


def mat_mul(A: List[List[int]], B: List[List[int]]) -> List[List[int]]:
    n, k = len(A), len(A[0])
    k2, m = len(B), len(B[0])
    assert k == k2
    C = [[0] * m for _ in range(n)]
    for i in range(n):
        for t in range(k):
            if A[i][t] % P == 0:
                continue
            a = A[i][t] % P
            for j in range(m):
                C[i][j] = (C[i][j] + a * (B[t][j] % P)) % P
    return C


def mat_inv(A: List[List[int]]) -> List[List[int]]:
    n = len(A)
    # Augment with identity
    M = [[A[i][j] % P for j in range(n)] + [1 if i == j else 0 for j in range(n)] for i in range(n)]
    # Gauss-Jordan
    row = 0
    for col in range(n):
        # find pivot
        pivot = None
        for r in range(row, n):
            if M[r][col] % P != 0:
                pivot = r
                break
        if pivot is None:
            raise ValueError("matrix not invertible (singular)")
        # swap
        if pivot != row:
            M[row], M[pivot] = M[pivot], M[row]
        # normalize row
        inv_p = gf_inv(M[row][col])
        for c in range(2 * n):
            M[row][c] = gf_mul(M[row][c], inv_p)
        # eliminate others
        for r in range(n):
            if r == row:
                continue
            factor = M[r][col] % P
            if factor == 0:
                continue
            for c in range(2 * n):
                M[r][c] = gf_sub(M[r][c], gf_mul(factor, M[row][c]))
        row += 1
        if row == n:
            break
    # extract inverse
    Inv = [row[n:] for row in M]
    return Inv


def ones_4x4() -> List[List[int]]:
    return [[1] * 4 for _ in range(4)]


def parse_block_hex_to_mat(hex_str: str) -> Tuple[List[List[int]], int]:
    """Parsea UNA matriz 4x4 del prefijo de hex_str.
    Devuelve (matriz, chars_consumidos).
    Usa tokens de 2 dígitos y trata '100' como 256 cuando aparece.
    """
    vals = []
    p = 0
    s = hex_str.strip()
    while len(vals) < 16 and p < len(s):
        # tratar '100' específicamente (256)
        if p + 3 <= len(s) and s[p:p + 3].lower() == '100':
            vals.append(256)
            p += 3
            continue
        if p + 2 <= len(s):
            token = s[p:p + 2]
            try:
                v = int(token, 16)
            except ValueError:
                break
            vals.append(v)
            p += 2
        else:
            break
    if len(vals) != 16:
        raise ValueError(f"No se pudieron leer 16 elementos desde el ciphertext: len={len(vals)}")
    # a matriz 4x4 por filas
    M = [[vals[4 * i + j] % P for j in range(4)] for i in range(4)]
    return M, p


def parse_all_blocks(hex_str: str) -> List[List[List[int]]]:
    # limpiar: permitir solo hex y posibles '100'
    s = ''.join(ch for ch in hex_str.strip().lower() if ch in '0123456789abcdef')
    blocks = []
    p = 0
    while p < len(s):
        try:
            M, used = parse_block_hex_to_mat(s[p:])
        except ValueError:
            if blocks:
                break
            raise
        blocks.append(M)
        p += used
        if used == 0:
            break
    return blocks


def recv_all(sock: socket.socket, timeout: float = 2.0) -> str:
    sock.settimeout(timeout)
    out = b''
    try:
        while True:
            chunk = sock.recv(65536)
            if not chunk:
                break
            out += chunk
            # romper solo cuando regrese al prompt
            if out.rstrip().endswith(b">") or out.endswith(b"> "):
                break
    except Exception:
        pass
    return out.decode(errors='ignore')


class NeonClient:
    def __init__(self, ip: str, port: int, timeout: float = 5.0):
        self.ip = ip
        self.port = port
        self.timeout = timeout
        self.s: socket.socket = None  # type: ignore

    def connect(self) -> None:
        self.s = socket.socket()
        self.s.settimeout(self.timeout)
        self.s.connect((self.ip, self.port))
        _ = recv_all(self.s)

    def close(self) -> None:
        try:
            if self.s:
                self.s.close()
        except Exception:
            pass
        self.s = None  # type: ignore

    def encrypt_message(self, msg: str) -> str:
        # opción 1
        self.s.sendall(b"1\n")
        _ = recv_all(self.s)
        self.s.sendall(msg.encode() + b"\n")
        data = recv_all(self.s, timeout=2.0)
        marker = "Ciphertext (hex):"
        idx = data.find(marker)
        if idx == -1:
            raise RuntimeError(f"No se encontró ciphertext en respuesta: {data!r}")
        rest = data[idx + len(marker):]
        line = rest.splitlines()[0].strip()
        return line


    def get_blueprint(self) -> str:
        self.s.sendall(b"2\n")
        data = recv_all(self.s, timeout=2.0)
        marker = "Encrypted configuration (ciphertext, hex):"
        idx = data.find(marker)
        if idx == -1:
            raise RuntimeError(f"No se encontró blueprint en respuesta: {data!r}")
        rest = data[idx + len(marker):]
        line = rest.splitlines()[0].strip()
        return line


def build_A_matrices(client: NeonClient, base_ch: str = 'A', var_ch: str = 'B') -> Tuple[List[List[List[int]]], List[List[int]], int, int]:
    # baseline constant block
    base_msg = base_ch * 16
    ct_base_hex = client.encrypt_message(base_msg)
    Cb, _ = parse_block_hex_to_mat(ct_base_hex)
    sb = s_map(ord(base_ch))
    sv = s_map(ord(var_ch))
    denom = gf_sub(sv, sb)
    if denom == 0:
        raise RuntimeError("s(var) - s(base) == 0, elige otros caracteres")
    denom_inv = gf_inv(denom)
    A = [[None for _ in range(4)] for _ in range(4)]
    for pos in range(16):
        i, j = divmod(pos, 4)
        msg_list = [base_ch] * 16
        msg_list[pos] = var_ch
        ct_hex = client.encrypt_message(''.join(msg_list))
        Ci, _ = parse_block_hex_to_mat(ct_hex)
        # Delta = Ci - Cb
        Delta = mat_sub(Ci, Cb)
        # A_ij = Delta / (sv - sb)
        Aij = mat_scalar_mul(denom_inv, Delta)
        A[i][j] = Aij
    return A, Cb, sb, sv


def factor_KL_from_A(A: List[List[List[int]]]) -> Tuple[List[List[int]], List[List[int]]]:
    # A_ij = K * E_ij * L = k_i * l_j^T (outer product)
    A00 = A[0][0]
    # elegir una columna no nula de A00 para k1'
    col_idx = None
    for t in range(4):
        col = [A00[r][t] % P for r in range(4)]
        if any(col):
            col_idx = t
            k1_prime = col
            break
    if col_idx is None:
        raise RuntimeError("A_00 es nula, inesperado")
    # elegir una fila r0 con k1'[r0] != 0
    r0 = None
    for r in range(4):
        if k1_prime[r] % P != 0:
            r0 = r
            break
    if r0 is None:
        raise RuntimeError("k1' es vector cero, inesperado")
    inv_k1_r0 = gf_inv(k1_prime[r0])

    # calcular filas de L' a partir de A_0j
    Lp_rows = []
    for j in range(4):
        A0j = A[0][j]
        row_vec = [gf_mul(A0j[r0][c], inv_k1_r0) for c in range(4)]  # l_j^T / s
        Lp_rows.append(row_vec)

    # encontrar una columna c0 de l_1' no nula
    c0 = None
    for c in range(4):
        if Lp_rows[0][c] % P != 0:
            c0 = c
            break
    if c0 is None:
        raise RuntimeError("l_1' es vector cero, inesperado")
    inv_l1_c0 = gf_inv(Lp_rows[0][c0])

    # calcular columnas de K' a partir de A_i1
    Kp_cols = []
    for i in range(4):
        Ai1 = A[i][0]
        col_vec = [gf_mul(Ai1[r][c0], inv_l1_c0) for r in range(4)]  # k_i * s
        Kp_cols.append(col_vec)

    # construir matrices K' y L'
    Kp = [[0] * 4 for _ in range(4)]
    for i in range(4):
        for r in range(4):
            Kp[r][i] = Kp_cols[i][r]
    Lp = [list(row) for row in Lp_rows]
    return Kp, Lp


def mat_to_bytes(M: List[List[int]]) -> bytes:
    out = bytearray()
    for i in range(4):
        for j in range(4):
            out.append(M[i][j] % 256)
    return bytes(out)


def bytes_to_mat(b: bytes) -> List[List[int]]:
    assert len(b) == 16
    return [[b[4 * i + j] for j in range(4)] for i in range(4)]


def unpad_pkcs7(data: bytes, block: int = 16) -> bytes:
    if not data or len(data) % block != 0:
        return data
    padlen = data[-1]
    if padlen == 0 or padlen > block:
        return data
    if data[-padlen:] != bytes([padlen]) * padlen:
        return data
    return data[:-padlen]


def decrypt_blocks(Kp: List[List[int]], Lp: List[List[int]], T: List[List[int]], blocks: List[List[List[int]]]) -> bytes:
    Kinv = mat_inv(Kp)
    Linv = mat_inv(Lp)
    plaintext = bytearray()
    for C in blocks:
        # X = K^{-1} * (C - T) * L^{-1}
        X = mat_mul(Kinv, mat_sub(C, T))
        X = mat_mul(X, Linv)
        # aplicar S^{-1} elemento a elemento
        M = [[s_inv_map(X[i][j]) for j in range(4)] for i in range(4)]
        plaintext.extend(mat_to_bytes(M))
    return bytes(plaintext)


def main():
    if len(sys.argv) != 3:
        print("Uso: python3 solver_neon_core.py <IP> <PORT>")
        sys.exit(1)
    ip = sys.argv[1]
    port = int(sys.argv[2])

    client = NeonClient(ip, port, timeout=5.0)
    client.connect()
    # 1) Obtener blueprint
    blueprint_hex = client.get_blueprint()
    print(f"[*] Blueprint CT: {blueprint_hex}")

    # 2) Construir A_ij con consultas de texto
    print("[*] Construyendo matrices A_ij con baseline 'A' y variante 'B'...")
    A, Cb, sb, sv = build_A_matrices(client, 'A', 'B')

    # 3) Factorizar K' y L'
    print("[*] Factorizando K' y L'...")
    Kp, Lp = factor_KL_from_A(A)

    # Ajustar escala global para que Kp E_00 Lp == A_00 exactamente
    # Construir E_00
    E00 = [[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]
    E00[0][0] = 1
    R = mat_mul(mat_mul(Kp, E00), Lp)
    A00 = A[0][0]
    # encontrar una entrada no nula para estimar el factor
    f = None
    for r in range(4):
        for c in range(4):
            if A00[r][c] % P != 0:
                f = gf_div(R[r][c], A00[r][c])
                break
        if f is not None:
            break
    if f is None:
        raise RuntimeError("A_00 es nula por completo, inesperado")
    invf = gf_inv(f)
    # reescala Lp para que coincida exactamente
    Lp = mat_scalar_mul(invf, Lp)

    # 4) Calcular U y T
    U = mat_mul(mat_mul(Kp, ones_4x4()), Lp)
    T = mat_sub(Cb, mat_scalar_mul(sb, U))

    # 5) Descifrar blueprint
    blocks = parse_all_blocks(blueprint_hex)
    pt = decrypt_blocks(Kp, Lp, T, blocks)
    pt = unpad_pkcs7(pt, 16)
    try:
        pt_text = pt.decode(errors='ignore')
    except Exception:
        pt_text = repr(pt)
    print(f"[+] Plaintext blueprint/FLAG: {pt_text}")
    client.close()


if __name__ == "__main__":
    main()

