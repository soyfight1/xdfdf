
import re
from pathlib import Path

def parse_cells(text: str):
    cell_re = re.compile(r"c1zB0vasN,([A-Z]\d+),\"(.*?)\",\"\"", re.M | re.S)
    vals = {}
    for m in cell_re.finditer(text):
        cell = m.group(1)
        formula = m.group(2)
        vals[cell] = formula
    return vals

def split_args(inside: str):
    parts = []
    cur = []
    level = 0
    in_str = False
    i = 0
    L = len(inside)
    while i < L:
        ch = inside[i]
        if ch == '"':
            # manejar comillas dobles escapadas ""
            if in_str and i + 1 < L and inside[i+1] == '"':
                cur.append('"')
                i += 2
                continue
            in_str = not in_str
            cur.append(ch)
            i += 1
            continue
        if not in_str:
            if ch == '(':
                level += 1
            elif ch == ')':
                if level > 0:
                    level -= 1
        if ch == ',' and not in_str and level == 0:
            parts.append(''.join(cur))
            cur = []
            i += 1
            continue
        cur.append(ch)
        i += 1
    if cur:
        parts.append(''.join(cur))
    return [p.strip() for p in parts]

def is_cell_ref(tok: str) -> bool:
    return re.fullmatch(r'[A-Z]\d+', tok) is not None

def unquote(tok: str) -> str:
    if tok.startswith('"') and tok.endswith('"'):
        return tok[1:-1].replace('""','"')
    return tok

def resolve_token(tok: str, vals, depth=0):
    if depth > 5000 or tok is None:
        return ''
    tok = tok.strip()
    if tok == '':
        return ''
    # literales
    if tok.startswith('"') and tok.endswith('"'):
        return unquote(tok)
    # referencias
    if is_cell_ref(tok):
        inner = vals.get(tok)
        if inner is None:
            return ''
        return resolve_token(inner, vals, depth+1)
    up = tok.upper()
    # CONCATENATE
    if up.startswith('CONCATENATE(') and tok.endswith(')'):
        inside = tok[tok.find('(')+1:-1]
        return ''.join(resolve_token(p, vals, depth+1) for p in split_args(inside))
    # IF(cond,a,b) -> tomar b por defecto
    if up.startswith('IF(') and tok.endswith(')'):
        inside = tok[tok.find('(')+1:-1]
        parts = split_args(inside)
        if len(parts) >= 3:
            return resolve_token(parts[2], vals, depth+1)
        return ''
    # CHAR(n)
    if up.startswith('CHAR(') and tok.endswith(')'):
        inside = tok[tok.find('(')+1:-1].strip()
        try:
            n = int(resolve_token(inside, vals, depth+1))
            return chr(n)
        except Exception:
            return ''
    # VALUE(n)
    if up.startswith('VALUE(') and tok.endswith(')'):
        inside = tok[tok.find('(')+1:-1].strip()
        v = resolve_token(inside, vals, depth+1)
        return v
    # LEFT(text,n)
    if up.startswith('LEFT(') and tok.endswith(')'):
        a,b = split_args(tok[tok.find('(')+1:-1])[:2]
        s = resolve_token(a, vals, depth+1)
        try:
            n = int(resolve_token(b, vals, depth+1))
        except Exception:
            n = 0
        return s[:n]
    # RIGHT(text,n)
    if up.startswith('RIGHT(') and tok.endswith(')'):
        a,b = split_args(tok[tok.find('(')+1:-1])[:2]
        s = resolve_token(a, vals, depth+1)
        try:
            n = int(resolve_token(b, vals, depth+1))
        except Exception:
            n = 0
        return s[-n:]
    # MID(text,start,num)
    if up.startswith('MID(') and tok.endswith(')'):
        a,b,c = split_args(tok[tok.find('(')+1:-1])[:3]
        s = resolve_token(a, vals, depth+1)
        try:
            start = int(resolve_token(b, vals, depth+1))
            num = int(resolve_token(c, vals, depth+1))
        except Exception:
            return ''
        return s[start-1:start-1+num]
    # SUBSTITUTE(text,old,new)
    if up.startswith('SUBSTITUTE(') and tok.endswith(')'):
        a,b,c = split_args(tok[tok.find('(')+1:-1])[:3]
        s = resolve_token(a, vals, depth+1)
        old = resolve_token(b, vals, depth+1)
        new = resolve_token(c, vals, depth+1)
        return s.replace(old, new)
    return tok

if __name__ == '__main__':
    text = Path('/workspace/work/artifacts/oBfsC4t10n2_vba.txt').read_text(errors='ignore')
    vals = parse_cells(text)
    target = 'CONCATENATE(G1332,D8,D513,K390)'
    print(resolve_token(target, vals))
