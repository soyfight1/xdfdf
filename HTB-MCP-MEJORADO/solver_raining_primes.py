#!/usr/bin/env python3
import socket
import sys
import math
from fractions import Fraction
from typing import List, Tuple


def recv_until_prompt(s: socket.socket, timeout: float = 3.0) -> str:
    s.settimeout(timeout)
    data = b''
    try:
        while True:
            chunk = s.recv(65536)
            if not chunk:
                break
            data += chunk
            if data.endswith(b'> ') or data.rstrip().endswith(b'>'):
                break
    except Exception:
        pass
    return data.decode(errors='ignore')


def connect(ip: str, port: int) -> socket.socket:
    s = socket.socket()
    s.settimeout(5)
    s.connect((ip, port))
    _ = recv_until_prompt(s)
    return s


def get_prime(s: socket.socket) -> int:
    s.sendall(b'1\n')
    out = recv_until_prompt(s)
    # Expect lines: "It's raining primes!" then the prime
    lines = [ln.strip() for ln in out.splitlines() if ln.strip()]
    # buscar una línea que sea sólo dígitos y suficientemente larga
    candidates = []
    for ln in lines:
        if ln.isdigit() and len(ln) > 100:
            candidates.append(ln)
    if candidates:
        return int(candidates[-1])
    raise RuntimeError(f"No se pudo parsear primo de respuesta: {out!r}")


def get_encrypted_flag(s: socket.socket) -> Tuple[int, int, int]:
    s.sendall(b'3\n')
    out = recv_until_prompt(s)
    # Buscar tupla (n, e, c)
    txt = ''.join(out.splitlines())
    start = txt.find('(')
    end = txt.find(')', start + 1)
    if start == -1 or end == -1:
        raise RuntimeError(f"No se pudo extraer tupla RSA: {out!r}")
    trip = txt[start:end + 1]
    n, e, c = eval(trip, {}, {})
    return int(n), int(e), int(c)


def try_update_with_T(ip: str, port: int, T: int) -> bool:
    """Envía opción 2 con vector [T]*256. Devuelve True si pasa (vuelve al menú), False si el servidor rompe.
    """
    s = socket.socket()
    s.settimeout(6)
    try:
        s.connect((ip, port))
        _ = recv_until_prompt(s)
        s.sendall(b'2\n')
        _ = recv_until_prompt(s)  # espera 'Encrypted key:'
        payload = '[' + ','.join(str(T) for _ in range(256)) + ']\n'
        s.sendall(payload.encode())
        out = recv_until_prompt(s)
        # si volvió a mostrar el menú, pasó
        ok = 'Choose an option:' in out
        s.close()
        return ok
    except Exception:
        try:
            s.close()
        except Exception:
            pass
        return False


def recover_r_via_update_oracle(ip: str, port: int, A_bits: int, R_bits: int) -> int:
    # Bracketing: L pasa, H falla
    L = 1 << (A_bits + R_bits - 1)  # <= 2^A * r mínimo
    H = 1 << (A_bits + R_bits + 1)  # > 2^A * r máximo
    if not try_update_with_T(ip, port, L):
        raise RuntimeError('L no pasó, revisar conexión')
    if try_update_with_T(ip, port, H):
        raise RuntimeError('H pasó inesperadamente, revisar cota')
    lo, hi = L, H
    while hi - lo > 1:
        mid = (lo + hi) // 2
        if try_update_with_T(ip, port, mid):
            lo = mid
        else:
            hi = mid
    Tmax = lo
    r = Tmax >> A_bits
    return r


def continued_fraction(numer: int, denom: int) -> List[int]:
    a = []
    while denom:
        q = numer // denom
        a.append(q)
        numer, denom = denom, numer - q * denom
    return a


def convergents(cf: List[int]) -> List[Tuple[int, int]]:
    conv = []
    p0, q0 = 1, 0
    p1, q1 = cf[0], 1
    conv.append((p1, q1))
    for a in cf[1:]:
        p2 = a * p1 + p0
        q2 = a * q1 + q0
        conv.append((p2, q2))
        p0, q0, p1, q1 = p1, q1, p2, q2
    return conv


def recover_r_from_samples(samples: List[int]) -> int:
    R_vals = []
    m = len(samples)
    for i in range(m):
        for j in range(i + 1, m):
            x = samples[i]
            y = samples[j]
            # CF of x/y
            cf = continued_fraction(x, y)
            conv = convergents(cf)
            # Try a subset of tail convergents (most accurate)
            for p, q in conv[-5:]:
                if p == 0 or q == 0:
                    continue
                # Candidate multiplier (reduced a1 ~ p, a2 ~ q)
                R1 = x // p
                R2 = y // q
                if R1 == 0 or R2 == 0:
                    continue
                # Heuristic: both should be very close
                if abs(R1 - R2) <= 1:
                    R_vals.append(min(R1, R2))
            # Also try limit_denominator heuristic
            frac = Fraction(x, y).limit_denominator(1 << 392)
            p, q = frac.numerator, frac.denominator
            if p != 0 and q != 0:
                R1 = x // p
                R2 = y // q
                if abs(R1 - R2) <= 1:
                    R_vals.append(min(R1, R2))

    if not R_vals:
        raise RuntimeError("No se obtuvieron candidatos de r")

    # gcd across candidates
    r = R_vals[0]
    for v in R_vals[1:]:
        r = math.gcd(r, v)
    return r


def main():
    if len(sys.argv) != 3:
        print("Uso: python3 solver_raining_primes.py <IP> <PORT>")
        sys.exit(1)

    ip = sys.argv[1]
    port = int(sys.argv[2])

    # Recuperar r exactamente con el oráculo de Update
    r = recover_r_via_update_oracle(ip, port, A_bits=384, R_bits=640)
    print(f"[*] r exacto: {r}")

    # Verificar con 3 muestras
    s = connect(ip, port)
    samples = [get_prime(s) for _ in range(3)]
    ok = all((xi % r) < (1 << 256) for xi in samples)
    print(f"[*] validacion residuos<2^256 sobre 3 muestras: {ok}")
    n, e, c = get_encrypted_flag(s)
    print(f"[*] n bits ~{n.bit_length()}, e={e}")
    print(f"[*] n mod r (b1*b2 exacto): {n % r}")


if __name__ == '__main__':
    main()

