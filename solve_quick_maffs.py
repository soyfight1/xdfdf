#!/usr/bin/env python3
import ast
import itertools
import math
import os
import re
import sys
from typing import List, Tuple, Optional, Iterable

try:
    from sympy import Matrix, symbols, Poly, ZZ, gcd as poly_gcd
except Exception as ex:
    print("[!] Missing sympy: please install in venv: pip install sympy")
    raise
try:
    from fpylll import IntegerMatrix, LLL as FLLL
except Exception:
    FLLL = None


def read_data(path: str) -> Tuple[int, List[int], int]:
    s = open(path, 'r').read()
    s_clean = re.sub(r"\s+", "", s)
    N, cts, hint = ast.literal_eval('[' + s_clean + ']')
    return N, cts, hint


def gen_primes(limit: int) -> List[int]:
    sieve = [True] * (limit + 1)
    sieve[0] = sieve[1] = False
    for i in range(2, int(limit ** 0.5) + 1):
        if sieve[i]:
            step = i
            start = i * i
            sieve[start:limit + 1:step] = [False] * (((limit - start) // step) + 1)
    return [i for i in range(2, limit + 1) if sieve[i]]


def build_lattice_univariate(N: int, c: int, e: int, X: int, m: int, t: int):
    # Build lattice for univariate Coppersmith (Howgrave-Graham)
    # f(x) = x^e - c
    # Rows: x^j f(x)^i N^{m-1-i} for i=0..m-1, j=0..e-1 and x^j f(x)^m for j=0..t-1
    # Degree bound
    d = e
    deg = m * d + t

    def poly_mul(a: List[int], b: List[int]) -> List[int]:
        res = [0] * (len(a) + len(b) - 1)
        # schoolbook
        for i, av in enumerate(a):
            if av == 0:
                continue
            for j, bv in enumerate(b):
                if bv == 0:
                    continue
                res[i + j] += av * bv
        return res

    # f(x) coefficients
    f = [0] * (d + 1)
    f[0] = -c
    f[d] = 1

    # Precompute f^i
    f_pows: List[List[int]] = [[1]]
    for _ in range(1, m + 1):
        f_pows.append(poly_mul(f_pows[-1], f))

    rows: List[List[int]] = []
    # i = 0..m-1
    for i in range(m):
        fi = f_pows[i]
        for j in range(d):
            poly = [0] * j + fi[:]  # x^j * f^i
            mult = pow(N, m - 1 - i)
            poly = [coeff * mult for coeff in poly]
            # truncate/extend to deg
            if len(poly) < deg:
                poly += [0] * (deg - len(poly))
            else:
                poly = poly[:deg]
            rows.append(poly)

    # extra rows from f^m * x^j
    fm = f_pows[m]
    for j in range(t):
        poly = [0] * j + fm[:]
        if len(poly) < deg:
            poly += [0] * (deg - len(poly))
        else:
            poly = poly[:deg]
        rows.append(poly)

    # column scaling by X^k
    scale = [pow(X, k) for k in range(deg)]
    B = []
    for r in rows:
        B.append([r[k] * scale[k] for k in range(deg)])

    return B, scale, deg


def small_roots_univariate(N: int, c: int, e: int, X: int, m: Optional[int] = None, t: int = 1,
                           take: int = 10) -> List[int]:
    # Keep m small to avoid huge bases; empirical works for our sizes
    if m is None:
        m = 2 if e <= 19 else 3

    B, scale, deg = build_lattice_univariate(N, c, e, X, m, t)
    # Reduce with fpylll if available, else SymPy
    if FLLL is not None:
        im = IntegerMatrix.from_matrix(B)
        FLLL.Reduction(im).LLL()
        reduced_rows = [list(im[i]) for i in range(im.nrows)]
    else:
        M = Matrix(B)
        M = M.lll()
        reduced_rows = [[int(M[r, k]) for k in range(M.cols)] for r in range(M.rows)]

    x = symbols('x')
    polys = []
    for r in range(min(take, len(reduced_rows))):
        vec = [int(reduced_rows[r][k] // scale[k]) for k in range(deg)]
        # trim trailing zeros
        while vec and vec[-1] == 0:
            vec.pop()
        if not vec:
            continue
        H = Poly(sum(ZZ(vec[k]) * (x ** k) for k in range(len(vec))), x, domain=ZZ)
        if H.total_degree() <= 0:
            continue
        polys.append(H)

    roots: List[int] = []
    # try gcd of pairs to get likely factor
    for i in range(len(polys)):
        for j in range(i + 1, len(polys)):
            try:
                g = poly_gcd(polys[i], polys[j])
            except Exception:
                continue
            if g.is_zero or g.total_degree() <= 0:
                continue
            # factor over ZZ
            try:
                fac_list = g.factor_list()[1]
            except Exception:
                fac_list = [(g, 1)]
            for fac_poly, _exp in fac_list:
                if fac_poly.degree() <= 0:
                    continue
                # Attempt numeric roots
                try:
                    for rnum in fac_poly.nroots(n=fac_poly.degree(), nmax=50):
                        if not rnum.is_real:
                            continue
                        rv = int(round(float(rnum)))
                        if 0 <= rv < X:
                            # validate
                            if pow(rv, e, N) == c:
                                roots.append(rv)
                except Exception:
                    # fallback: try small integer grid in [0, X) up to a limit
                    limit = min(X, 1 << 16)
                    for rv in range(0, limit):
                        if fac_poly.eval(rv) == 0 and pow(rv, e, N) == c:
                            roots.append(rv)

    # dedup
    roots = sorted(set(roots))
    return roots


def inv_mod(a: int, m: int) -> Optional[int]:
    try:
        return pow(a, -1, m)
    except ValueError:
        return None


def primes_in_range(lo: int, hi: int) -> List[int]:
    # simple sieve up to hi, then filter >= lo
    sieve = [True] * (hi + 1)
    sieve[0] = sieve[1] = False
    for i in range(2, int(hi ** 0.5) + 1):
        if sieve[i]:
            sieve[i * i: hi + 1: i] = [False] * (((hi - i * i) // i) + 1)
    return [i for i in range(max(2, lo), hi + 1) if sieve[i]]


def find_e_via_residues(N: int, cts: List[int], hint: int) -> Optional[int]:
    # Use small prime moduli r, compute e^{-1} mod (r-1), recover m_i mod r from c_i and test sum constraint
    e_candidates = [p for p in gen_primes(1024) if p >= 3]
    # Use a few small primes r (include 65537) and others in 50k..90k
    r_list = [65537] + primes_in_range(50000, 90000)[:24]
    Hmods = [hint % r for r in r_list]
    # Pre-reduce cts mod r
    cmods = [[c % r for r in r_list] for c in cts]
    valid_es = []
    for e in e_candidates:
        ok_all = True
        for idx_r, r in enumerate(r_list):
            inv = inv_mod(e, r - 1)
            if inv is None:
                continue  # skip this r for this e
            # reconstruct residues of m_i mod r
            m0 = pow(cmods[0][idx_r], inv, r)
            m1 = pow(cmods[1][idx_r], inv, r)
            m2 = pow(cmods[2][idx_r], inv, r)
            if (m0 + m1 + m2) % r != Hmods[idx_r]:
                ok_all = False
                break
        if ok_all:
            valid_es.append(e)
    if not valid_es:
        return None
    if len(valid_es) > 1:
        # further discriminate by adding more r if needed
        return valid_es[0]
    return valid_es[0]


def crt_pair(a1: int, m1: int, a2: int, m2: int) -> Tuple[int, int]:
    # Solve x ≡ a1 mod m1, x ≡ a2 mod m2 where gcd(m1,m2)=1
    # Returns (x mod M, M)
    g = math.gcd(m1, m2)
    if g != 1:
        raise ValueError('Moduli not coprime')
    t = ((a2 - a1) % m2) * pow(m1 % m2, -1, m2) % m2
    x = a1 + m1 * t
    M = m1 * m2
    return x % M, M


def reconstruct_messages_via_crt(e: int, N: int, cts: List[int], hint: int) -> Optional[List[int]]:
    # Build enough residue moduli so that product exceeds hint
    target_bits = hint.bit_length() + 8
    r_list = [65537] + primes_in_range(50000, 200000)
    residues = [[None, None, None], []]  # not actually used; we'll maintain per message lists
    # per-message residues and moduli
    rems: List[List[int]] = [[], [], []]
    mods: List[List[int]] = [[], [], []]
    acc_mod_bits = 0
    for r in r_list:
        inv = inv_mod(e, r - 1)
        if inv is None:
            continue
        mrs = [pow(c % r, inv, r) for c in cts]
        # check sum constraint
        if (sum(mrs) - (hint % r)) % r != 0:
            continue
        for i in range(3):
            rems[i].append(mrs[i])
            mods[i].append(r)
        acc_mod_bits += r.bit_length()
        if acc_mod_bits >= target_bits:
            break
    if acc_mod_bits < target_bits:
        return None
    # CRT per message
    ms: List[int] = []
    for i in range(3):
        a, m = rems[i][0], mods[i][0]
        for j in range(1, len(rems[i])):
            a, m = crt_pair(a, m, rems[i][j], mods[i][j])
        ms.append(a)
    # Validate
    if all(pow(ms[i], e, N) == cts[i] for i in range(3)) and sum(ms) == hint:
        return ms
    # If not valid, try adding more moduli to disambiguate
    for r in r_list[len(mods[0]):]:
        inv = inv_mod(e, r - 1)
        if inv is None:
            continue
        mrs = [pow(c % r, inv, r) for c in cts]
        if (sum(mrs) - (hint % r)) % r != 0:
            continue
        for i in range(3):
            a, m = crt_pair(ms[i], m, mrs[i], r)
            ms[i] = a
        if all(pow(ms[i], e, N) == cts[i] for i in range(3)) and sum(ms) == hint:
            return ms
    return None


def attempt_solve(N: int, cts: List[int], hint: int) -> Optional[Tuple[int, List[int]]]:
    # Try a shortlist of e values to keep lattice sizes reasonable
    e_list = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
    for e in e_list:
        # Set X to be slightly below N^{1/e} to satisfy Coppersmith bound
        X_bits = max(16, (N.bit_length() // e) - 8)
        X = 1 << min(512, X_bits)
        candidates: List[List[int]] = []
        ok = True
        for ci in cts:
            roots = small_roots_univariate(N, ci, e, X, m=None, t=1, take=12)
            candidates.append(roots)
            if len(roots) == 0:
                ok = False
                break
        if not ok:
            print(f"[e={e}] no roots for at least one ciphertext")
            continue
        # Combine to satisfy sum (try all permutations)
        for order in itertools.permutations(range(3)):
            cands = [candidates[i] for i in order]
            for m1 in cands[0]:
                for m2 in cands[1]:
                    m3 = hint - m1 - m2
                    if m3 < 0 or m3 >= X:
                        continue
                    if m3 in cands[2]:
                        if pow(m1, e, N) == cts[order[0]] and pow(m2, e, N) == cts[order[1]] and pow(m3, e, N) == cts[order[2]]:
                            sol: List[Optional[int]] = [None, None, None]
                            sol[order[0]] = m1
                            sol[order[1]] = m2
                            sol[order[2]] = m3
                            return e, sol  # type: ignore
        print(f"[e={e}] roots found but no combination matching the sum")
    return None


def main():
    N, cts, hint = read_data('/workspace/quick_maffs/output.txt')
    print('[*] N bits:', N.bit_length())
    print('[*] Num ciphertexts:', len(cts))
    print('[*] hint bits:', hint.bit_length())

    # First, identify e using small prime residues
    e = find_e_via_residues(N, cts, hint)
    if not e:
        print('[!] Failed to deduce e via residues')
        # Fallback to LLL method
        sol = attempt_solve(N, cts, hint)
        if not sol:
            print('[!] No solution found with current parameters')
            sys.exit(1)
        e, ms = sol
    else:
        print('[+] Deduced e =', e)
        ms = reconstruct_messages_via_crt(e, N, cts, hint)
        if not ms:
            print('[!] Failed to reconstruct messages via CRT')
            sys.exit(1)
        print('[+] Reconstructed m bitlengths =', [m.bit_length() for m in ms])

    print('[+] Found e =', e)
    print('[+] m bitlengths =', [m.bit_length() for m in ms])
    parts = [int(m).to_bytes((m.bit_length() + 7) // 8, 'big') for m in ms]
    assembled = b''.join(parts)
    print('[+] Assembled bytes:', assembled)
    try:
        print('[+] Assembled ascii:', assembled.decode())
    except Exception:
        pass


if __name__ == '__main__':
    main()

