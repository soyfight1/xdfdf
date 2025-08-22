#!/usr/bin/env python3
import argparse
import os
import random
import re
import socket
import sys
import time
from typing import List, Optional, Tuple

import numpy as np

HEX32_RE = re.compile(r"\b[0-9a-fA-F]{32}\b")
NUM_RE = re.compile(r"[-+]?\d+(?:\.\d+)?")


def parse_response_for_cipher_and_trace(data: bytes) -> Tuple[Optional[bytes], List[float]]:
    text = data.decode(errors="replace")
    # 1) ciphertext: any 32-hex substring
    m = HEX32_RE.search(text)
    ct_bytes: Optional[bytes] = bytes.fromhex(m.group(0)) if m else None

    # 2) trace: choose the longest numeric sequence of reasonable size
    best_seq: List[float] = []
    # Split by lines, try to extract numbers per line; keep the longest list
    for line in text.splitlines():
        nums = NUM_RE.findall(line)
        if len(nums) > len(best_seq):
            try:
                best_seq = [float(x) for x in nums]
            except Exception:
                continue

    # If no good per-line sequence, try global extract
    if not best_seq:
        nums = NUM_RE.findall(text)
        try:
            best_seq = [float(x) for x in nums]
        except Exception:
            best_seq = []

    return ct_bytes, best_seq


def recv_all_until_timeout(sock: socket.socket, timeout: float = 2.0, max_bytes: int = 2_000_000) -> bytes:
    sock.settimeout(timeout)
    chunks: List[bytes] = []
    total = 0
    while True:
        try:
            chunk = sock.recv(4096)
        except socket.timeout:
            break
        if not chunk:
            break
        chunks.append(chunk)
        total += len(chunk)
        if total >= max_bytes:
            break
    return b"".join(chunks)


def connect_once(host: str, port: int, timeout: float) -> socket.socket:
    sock = socket.create_connection((host, port), timeout=timeout)
    sock.settimeout(timeout)
    return sock


def generate_plaintexts(num: int, seed: Optional[int]) -> List[bytes]:
    rng = random.Random(seed)
    pts: List[bytes] = []
    for _ in range(num):
        pts.append(bytes(rng.getrandbits(8) for _ in range(16)))
    return pts


def collect_traces(host: str, port: int, count: int, timeout: float, delay: float, seed: Optional[int],
                   verbose: bool, retry_forever: bool = False) -> Tuple[np.ndarray, np.ndarray, List[np.ndarray]]:
    pts_list: List[bytes] = generate_plaintexts(count, seed)
    cts_list: List[bytes] = []
    traces_list: List[np.ndarray] = []

    idx = 0
    backoff = 0.5
    while len(traces_list) < count:
        idx += 1
        pt = pts_list[min(len(traces_list), len(pts_list)-1)] if pts_list else bytes(random.getrandbits(8) for _ in range(16))
        try:
            with connect_once(host, port, timeout) as sock:
                _ = recv_all_until_timeout(sock, timeout=1.0)
                sock.sendall(pt.hex().encode() + b"\n")
                resp = recv_all_until_timeout(sock, timeout=timeout)
        except Exception as e:
            if not retry_forever:
                if verbose:
                    print(f"[{len(traces_list)}/{count}] Conexión fallida: {e}")
                # continue trying up to count attempts
                if delay > 0:
                    time.sleep(delay)
                continue
            else:
                if verbose:
                    print(f"[{len(traces_list)}/{count}] Conexión fallida: {e}  (reintentando)")
                time.sleep(backoff)
                backoff = min(backoff * 1.5, 10.0)
                continue

        backoff = 0.5
        ct_bytes, trace_vals = parse_response_for_cipher_and_trace(resp)
        if ct_bytes is None or len(ct_bytes) != 16:
            if verbose:
                print(f"[{len(traces_list)}/{count}] No se pudo extraer ciphertext (resp={resp[:120]!r}...) ")
            if retry_forever:
                time.sleep(0.2)
            continue
        if not trace_vals or len(trace_vals) < 50:
            if verbose:
                print(f"[{len(traces_list)}/{count}] Traza insuficiente (len={len(trace_vals)})")
            if retry_forever:
                time.sleep(0.2)
            continue

        cts_list.append(ct_bytes)
        traces_list.append(np.asarray(trace_vals, dtype=np.float32))

        if verbose:
            print(f"[{len(traces_list)}/{count}] OK  pt={pt.hex()} ct={ct_bytes.hex()} len(trace)={len(trace_vals)}")

        if delay > 0:
            time.sleep(delay)

    min_len = min(t.shape[0] for t in traces_list)
    traces_arr = np.stack([t[:min_len] for t in traces_list], axis=0)
    pts_arr = np.frombuffer(b"".join(pts_list[:len(traces_list)]), dtype=np.uint8).reshape(len(traces_list), 16)
    cts_arr = np.frombuffer(b"".join(cts_list), dtype=np.uint8).reshape(len(cts_list), 16)

    return pts_arr, cts_arr, [traces_arr]


def save_dataset(out_path: str, pts: np.ndarray, cts: np.ndarray, traces_list: List[np.ndarray], meta: dict) -> None:
    traces = traces_list[0]
    np.savez_compressed(out_path, pts=pts, cts=cts, traces=traces, meta=str(meta))


def main() -> None:
    ap = argparse.ArgumentParser(description="Colector de trazas de potencia para AES (picoCTF PowerAnalysis: Part 1)")
    ap.add_argument("--host", default="saturn.picoctf.net", help="Host del servicio remoto")
    ap.add_argument("--port", type=int, default=59049, help="Puerto del servicio remoto")
    ap.add_argument("--count", "-n", type=int, default=2000, help="Número de trazas a capturar")
    ap.add_argument("--timeout", type=float, default=5.0, help="Timeout de socket en segundos")
    ap.add_argument("--delay", type=float, default=0.0, help="Retraso entre capturas (s)")
    ap.add_argument("--seed", type=int, default=None, help="Semilla RNG para reproducibilidad")
    ap.add_argument("--out", default="traces.npz", help="Ruta de salida (.npz)")
    ap.add_argument("--verbose", action="store_true", help="Modo verboso")
    ap.add_argument("--retry-forever", action="store_true", help="Reintentar indefinidamente hasta lograr N trazas")
    args = ap.parse_args()

    print(f"Conectando a {args.host}:{args.port} y capturando {args.count} trazas...")
    pts, cts, traces_list = collect_traces(
        host=args.host,
        port=args.port,
        count=args.count,
        timeout=args.timeout,
        delay=args.delay,
        seed=args.seed,
        verbose=args.verbose,
        retry_forever=args.retry_forever,
    )
    meta = {
        "host": args.host,
        "port": args.port,
        "count": int(pts.shape[0]),
        "timestamp": time.time(),
        "pid": os.getpid(),
    }
    save_dataset(args.out, pts, cts, traces_list, meta)
    print(f"Guardado: {args.out}  (traces={traces_list[0].shape}, pts={pts.shape}, cts={cts.shape})")


if __name__ == "__main__":
    main()