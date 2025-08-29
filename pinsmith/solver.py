import sys
from typing import List

def generate_pins(template: str) -> List[str]:
    n = len(template)
    results = []
    current = ["0"] * n

    def backtrack(idx: int) -> None:
        if idx == n:
            results.append("".join(current))
            return
        if template[idx] != "*":
            d = template[idx]
            # Check no adjacent equal constraint (compare with previous digit)
            if idx == 0 or current[idx-1] != d:
                current[idx] = d
                backtrack(idx + 1)
            return
        # Try all digits 0-9 except equal to previous
        prev = current[idx-1] if idx > 0 else None
        for ch in "0123456789":
            if prev is not None and ch == prev:
                continue
            current[idx] = ch
            backtrack(idx + 1)

    backtrack(0)
    results.sort()
    return results

def main() -> None:
    s = sys.stdin.read().strip().splitlines()[0]
    pins = generate_pins(s)
    sys.stdout.write("\n".join(pins))

if __name__ == "__main__":
    main()
