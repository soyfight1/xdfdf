
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
          text = text.replace(/B = \d+/, 'B = 1');
          textarea.value = text;
        }
      });
      
      // Enviar formulario de Bob
      await frame.click('input[type="submit"]');
      console.log('[*] B=1 enviado');
      
      await page.waitForTimeout(3000);
      
      // Buscar código cifrado
      const content = await frame.content();
      const match = content.match(/Encrypted code\s*:\s*(\d+)/);
      
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
        const flagMatch = result.match(/flag[^:]*:\s*([^<>\s]+)/i) || 
                         result.match(/W3C{[^}]+}/);
        
        if (flagMatch) {
          console.log('\n🔥🔥🔥 FLAG ENCONTRADA: ' + flagMatch[0] + ' 🔥🔥🔥');
        }
      }
    }
  }
  
  await browser.close();
})();
