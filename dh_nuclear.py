#!/usr/bin/env python3

import subprocess
import time
import re

print("💀💀💀 ATAQUE NUCLEAR - PLAN B 💀💀💀")

# Si no podemos automatizar el navegador, vamos a usar phantomjs o puppeteer
print("\n[*] Instalando herramientas de guerra...")

# Instalar puppeteer
subprocess.run(["npm", "install", "puppeteer", "--yes"], capture_output=True)

# Script para puppeteer
puppeteer_script = """
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  const page = await browser.newPage();
  
  console.log('[*] Navegando al challenge...');
  await page.goto('https://diffie-hellman.crypto.w3challs.com/challenge_diffie_hellman.php');
  
  // Esperar que cargue el iframe
  await page.waitForTimeout(2000);
  
  // Acceder al iframe
  const frame = page.frames().find(f => f.name() === 'dhkey');
  
  if (frame) {
    console.log('[*] Iframe encontrado');
    
    // Modificar A=1
    await frame.evaluate(() => {
      const textarea = document.querySelector('textarea[name="alice_send_key"]');
      if (textarea) {
        let text = textarea.value;
        text = text.replace('A = "', 'A = 1"');
        textarea.value = text;
      }
    });
    
    // Enviar formulario de Alice
    await frame.click('input[type="submit"]');
    console.log('[*] A=1 enviado');
    
    await page.waitForTimeout(3000);
    
    // Buscar respuesta de Bob
    const bobTextarea = await frame.$('textarea[name="bob_send_key"]');
    if (bobTextarea) {
      console.log('[*] Bob respondió');
      
      // Modificar B=1
      await frame.evaluate(() => {
        const textarea = document.querySelector('textarea[name="bob_send_key"]');
        if (textarea) {
          let text = textarea.value;
          text = text.replace(/B = \\d+/, 'B = 1');
          textarea.value = text;
        }
      });
      
      // Enviar formulario de Bob
      await frame.click('input[type="submit"]');
      console.log('[*] B=1 enviado');
      
      await page.waitForTimeout(3000);
      
      // Buscar código cifrado
      const content = await frame.content();
      const match = content.match(/Encrypted code\\s*:\\s*(\\d+)/);
      
      if (match) {
        const encrypted = parseInt(match[1]);
        const decrypted = encrypted ^ 1;
        
        console.log('[!] Código cifrado:', encrypted);
        console.log('[!] Código descifrado:', decrypted);
        
        // Verificar solución
        await page.goto(`https://diffie-hellman.crypto.w3challs.com/solution_diffie_hellman.php?password=${decrypted}`);
        const result = await page.content();
        
        console.log('[*] Resultado:', result.substring(0, 500));
        
        // Buscar flag
        const flagMatch = result.match(/flag[^:]*:\\s*([^<>\\s]+)/i) || 
                         result.match(/W3C{[^}]+}/);
        
        if (flagMatch) {
          console.log('\\n🔥🔥🔥 FLAG ENCONTRADA: ' + flagMatch[0] + ' 🔥🔥🔥');
        }
      }
    }
  }
  
  await browser.close();
})();
"""

# Guardar script
with open('/workspace/puppet.js', 'w') as f:
    f.write(puppeteer_script)

print("[*] Ejecutando Puppeteer...")
result = subprocess.run(["node", "/workspace/puppet.js"], capture_output=True, text=True)
print(result.stdout)
if result.stderr:
    print("Errores:", result.stderr)

# Si puppeteer falla, intentar con selenium y un driver real
if "FLAG" not in result.stdout:
    print("\n[*] Puppeteer falló. Intentando con playwright...")
    
    # Instalar playwright
    subprocess.run(["pip", "install", "playwright", "--break-system-packages", "-q"], capture_output=True)
    subprocess.run(["playwright", "install", "chromium"], capture_output=True)
    
    playwright_script = """
import asyncio
from playwright.async_api import async_playwright

async def main():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page()
        
        print('[*] Navegando...')
        await page.goto('https://diffie-hellman.crypto.w3challs.com/challenge_diffie_hellman.php')
        
        # Esperar iframe
        await page.wait_for_timeout(2000)
        
        # Obtener iframe
        frame = page.frame(name='dhkey')
        
        if frame:
            print('[*] Iframe encontrado')
            
            # Modificar A=1
            await frame.fill('textarea[name="alice_send_key"]', '''[ --------- w3challs-Sniffer 1.4.7 --------- ]

Message from Alice to Bob on 1970/01/01 01:00:00

"Hey Bob, if I don't receive your B in about thirty seconds maximum, I'll consider this channel unsafe

A = 1"''')
            
            # Enviar
            await frame.click('input[type="submit"]')
            print('[*] A=1 enviado')
            
            await page.wait_for_timeout(3000)
            
            # Buscar Bob
            bob_textarea = await frame.query_selector('textarea[name="bob_send_key"]')
            if bob_textarea:
                print('[*] Bob respondió')
                
                # Obtener contenido
                bob_content = await bob_textarea.get_attribute('value')
                
                # Modificar B=1
                import re
                bob_modified = re.sub(r'B = \\d+', 'B = 1', bob_content)
                await frame.fill('textarea[name="bob_send_key"]', bob_modified)
                
                # Enviar
                await frame.click('input[type="submit"]')
                print('[*] B=1 enviado')
                
                await page.wait_for_timeout(3000)
                
                # Buscar código
                content = await frame.content()
                match = re.search(r'Encrypted code\\s*:\\s*(\\d+)', content)
                
                if match:
                    encrypted = int(match.group(1))
                    decrypted = encrypted ^ 1
                    
                    print(f'[!] Cifrado: {encrypted}')
                    print(f'[!] Descifrado: {decrypted}')
                    
                    # Verificar
                    await page.goto(f'https://diffie-hellman.crypto.w3challs.com/solution_diffie_hellman.php?password={decrypted}')
                    result = await page.content()
                    
                    # Buscar flag
                    flag_match = re.search(r'flag[^:]*:\\s*([^<>\\s]+)', result, re.I)
                    if flag_match:
                        print(f'\\n🔥 FLAG: {flag_match.group(0)} 🔥')
        
        await browser.close()

asyncio.run(main())
"""
    
    with open('/workspace/play.py', 'w') as f:
        f.write(playwright_script)
    
    print("[*] Ejecutando Playwright...")
    result = subprocess.run(["python3", "/workspace/play.py"], capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print("Errores:", result.stderr)