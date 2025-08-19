#!/usr/bin/env python3

import time
import re
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configurar Chrome en modo headless
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

print("="*60)
print("ATAQUE DIFFIE-HELLMAN CON SELENIUM")
print("="*60)

# URLs
main_url = "https://diffie-hellman.crypto.w3challs.com/challenge_diffie_hellman.php"
dhkey_url = "https://diffie-hellman.crypto.w3challs.com/dhkey.php"

# Iniciar driver
print("\n[*] Iniciando navegador...")
driver = webdriver.Chrome(options=chrome_options)
wait = WebDriverWait(driver, 10)

try:
    # Cargar página principal
    print("[*] Cargando challenge...")
    driver.get(main_url)
    time.sleep(2)
    
    # Cambiar al iframe
    print("[*] Accediendo al iframe del intercambio...")
    driver.switch_to.frame("dhkey")
    
    # Obtener el HTML inicial
    html = driver.page_source
    print(f"[*] Estado inicial del iframe:")
    print("-" * 40)
    print(html[:500])
    print("-" * 40)
    
    # Buscar el textarea de Alice
    alice_textarea = driver.find_element(By.NAME, "alice_send_key")
    alice_text = alice_textarea.get_attribute("value")
    print(f"\n[*] Mensaje original de Alice:\n{alice_text[:200]}...")
    
    # Modificar A=1
    print("\n[*] Modificando A=1...")
    modified_alice = re.sub(r'A = "', 'A = 1"', alice_text)
    
    # Limpiar y enviar nuevo valor
    driver.execute_script("arguments[0].value = arguments[1];", alice_textarea, modified_alice)
    
    # Enviar el formulario
    submit_button = driver.find_element(By.XPATH, "//input[@type='submit' and contains(@value, 'Send')]")
    submit_button.click()
    
    print("[*] Mensaje de Alice enviado con A=1")
    time.sleep(3)
    
    # Verificar si Bob responde
    html = driver.page_source
    
    if "bob_send_key" in html:
        print("\n[*] Bob está respondiendo...")
        
        # Buscar el textarea de Bob
        bob_textarea = driver.find_element(By.NAME, "bob_send_key")
        bob_text = bob_textarea.get_attribute("value")
        print(f"[*] Mensaje original de Bob:\n{bob_text[:200]}...")
        
        # Buscar B original
        b_match = re.search(r'B = (\d+)', bob_text)
        if b_match:
            print(f"[*] B original = {b_match.group(1)}")
            
            # Modificar B=1
            modified_bob = re.sub(r'B = \d+', 'B = 1', bob_text)
            print("[*] Modificando B=1...")
            
            # Actualizar y enviar
            driver.execute_script("arguments[0].value = arguments[1];", bob_textarea, modified_bob)
            submit_button = driver.find_element(By.XPATH, "//input[@type='submit' and contains(@value, 'Send')]")
            submit_button.click()
            
            print("[*] Mensaje de Bob enviado con B=1")
            time.sleep(3)
    
    # Verificar si Alice envía el código
    html = driver.page_source
    
    if "alice_send_code" in html:
        print("\n[*] Alice está enviando el código cifrado...")
        
        # Obtener el mensaje con el código
        alice_code_textarea = driver.find_element(By.NAME, "alice_send_code")
        alice_code_text = alice_code_textarea.get_attribute("value")
        
        # Buscar el código cifrado
        code_match = re.search(r'Encrypted code : (\d+)', alice_code_text)
        if code_match:
            encrypted_code = int(code_match.group(1))
            print(f"[*] Código cifrado: {encrypted_code}")
            
            # Con A=1 y B=1, el secreto compartido es 1
            secret = 1
            plaintext_code = encrypted_code ^ secret
            
            print(f"[*] Secreto compartido: {secret}")
            print(f"[*] Código descifrado: {plaintext_code}")
            
            # Verificar la solución
            solution_url = f"https://diffie-hellman.crypto.w3challs.com/solution_diffie_hellman.php?password={plaintext_code}"
            print(f"\n[*] Verificando solución: {solution_url}")
            
            driver.get(solution_url)
            time.sleep(2)
            
            result_html = driver.page_source
            print("\n[*] Resultado:")
            print("-" * 40)
            print(result_html[:1000])
            
            # Buscar la flag
            if "flag" in result_html.lower() or "congratulations" in result_html.lower() or "W3C" in result_html:
                print("\n" + "🔥" * 20)
                print("¡FLAG ENCONTRADA!")
                
                # Intentar extraer el texto de la flag
                flag_patterns = [
                    r'flag[^<>]*:?\s*([^<>\n]+)',
                    r'W3C[^<>\n]+',
                    r'congratulations[^<>]*:?\s*([^<>\n]+)',
                    r'password is[^<>]*:?\s*([^<>\n]+)'
                ]
                
                for pattern in flag_patterns:
                    match = re.search(pattern, result_html, re.IGNORECASE)
                    if match:
                        print(f"FLAG: {match.group(0)}")
                        break
        else:
            print("[!] No se encontró el código cifrado en el mensaje")
            print(f"[*] Contenido del mensaje:\n{alice_code_text}")
    else:
        print("[!] Alice no está enviando el código. Estado actual:")
        print(html)
        
except Exception as e:
    print(f"[!] Error: {e}")
    import traceback
    traceback.print_exc()
    
finally:
    driver.quit()
    print("\n[*] Navegador cerrado")