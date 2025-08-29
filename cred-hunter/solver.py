import sys
import re

def is_valid_email(candidate: str) -> bool:
    if candidate.count("@") != 1:
        return False
    local_part, domain_part = candidate.split("@", 1)
    if not re.fullmatch(r"[a-z]{2,}", local_part or ""):
        return False
    if not re.fullmatch(r"[A-Za-z0-9.-]+\.[A-Za-z]{2,}", domain_part or ""):
        return False
    return True

def extract_first_name_from_email(email: str) -> str:
    local_part = email.split("@", 1)[0]
    return local_part[:-1]

def main() -> None:
    lines = sys.stdin.read().splitlines()
    if not lines:
        return
    try:
        n = int(lines[0].strip())
        strings = lines[1:1 + n]
    except Exception:
        strings = lines
    emails = {}
    passwords = []
    for s in strings:
        if is_valid_email(s):
            first_name = extract_first_name_from_email(s)
            if first_name:
                emails[s] = first_name
        else:
            passwords.append(s)
    pairs = []
    for email, first_name in emails.items():
        for pwd in passwords:
            if first_name and first_name in pwd:
                pairs.append((email, pwd))
    pairs.sort(key=lambda t: (t[0], t[1]))
    for e, p in pairs:
        print(f"{e} {p}")

if __name__ == "__main__":
    main()
