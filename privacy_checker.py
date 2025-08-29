#!/usr/bin/env python3
"""
Phone Number Privacy Checker
Verifica qué información de tu número es pública
"""

import requests
import json
import time
import hashlib
import urllib.parse
from datetime import datetime

def check_truecaller_format(number):
    """Check Truecaller database format"""
    print("\n" + "=" * 80)
    print("📞 VERIFICACIÓN EN TRUECALLER")
    print("=" * 80)
    
    clean = number.replace("+", "").replace(" ", "")
    
    print(f"\n🔍 Truecaller:")
    print(f"   • Estado: Truecaller requiere cuenta para búsquedas")
    print(f"   • Formato de búsqueda: {clean}")
    print(f"   • URL web: https://www.truecaller.com/search/es/{clean}")
    print(f"   • Nota: Si apareces en Truecaller, otros usuarios pueden ver tu nombre")
    print(f"\n   ⚠️ Para eliminar tu número de Truecaller:")
    print(f"      1. Visita: https://www.truecaller.com/unlisting")
    print(f"      2. Introduce tu número con código de país")
    print(f"      3. Verifica con el código SMS")
    print(f"      4. Tu número será eliminado en 24 horas")
    
    return {"platform": "Truecaller", "url": f"https://www.truecaller.com/search/es/{clean}"}

def check_whocalld_format(number):
    """Check WhoCalld database"""
    print("\n" + "=" * 80)
    print("📱 VERIFICACIÓN EN WHOCALLD")
    print("=" * 80)
    
    clean = number.replace("+34", "").replace(" ", "")
    
    print(f"\n🔍 WhoCalld (España):")
    print(f"   • URL: https://whocalld.com/es/numero/{clean}")
    print(f"   • Base de datos colaborativa de spam")
    print(f"   • Si apareces aquí, podrías estar marcado como spam")
    
    return {"platform": "WhoCalld", "url": f"https://whocalld.com/es/numero/{clean}"}

def check_telefono_spam(number):
    """Check telefono-spam.com"""
    print("\n" + "=" * 80)
    print("🚫 VERIFICACIÓN EN TELEFONO-SPAM.COM")
    print("=" * 80)
    
    clean = number.replace("+34", "").replace(" ", "")
    
    print(f"\n🔍 Telefono-Spam.com:")
    print(f"   • URL: https://telefono-spam.com/34{clean}")
    print(f"   • Base de datos de números reportados como spam")
    print(f"   • Si apareces: tu número ha sido reportado")
    
    return {"platform": "Telefono-Spam", "url": f"https://telefono-spam.com/34{clean}"}

def check_listaspam(number):
    """Check ListaSpam database"""
    print("\n" + "=" * 80)
    print("📋 VERIFICACIÓN EN LISTASPAM")
    print("=" * 80)
    
    clean = number.replace("+34", "").replace(" ", "")
    
    print(f"\n🔍 ListaSpam.com:")
    print(f"   • URL: https://www.listaspam.com/buscar?q={clean}")
    print(f"   • Directorio colaborativo anti-spam español")
    print(f"   • Reportes de usuarios sobre llamadas no deseadas")
    
    return {"platform": "ListaSpam", "url": f"https://www.listaspam.com/buscar?q={clean}"}

def check_responderono(number):
    """Check ResponderóNo database"""
    print("\n" + "=" * 80)
    print("☎️ VERIFICACIÓN EN RESPONDERONO")
    print("=" * 80)
    
    clean = number.replace("+", "").replace(" ", "")
    
    print(f"\n🔍 ResponderóNo.es:")
    print(f"   • URL: https://www.responderono.es/numero-de-telefono/{clean}")
    print(f"   • Base de datos de identificación de llamadas")
    print(f"   • Comentarios y valoraciones de usuarios")
    
    return {"platform": "ResponderóNo", "url": f"https://www.responderono.es/numero-de-telefono/{clean}"}

def check_sync_me(number):
    """Check Sync.ME database"""
    print("\n" + "=" * 80)
    print("🔄 VERIFICACIÓN EN SYNC.ME")
    print("=" * 80)
    
    print(f"\n🔍 Sync.ME:")
    print(f"   • Similar a Truecaller")
    print(f"   • Sincroniza contactos de usuarios")
    print(f"   • Si alguien te tiene guardado, puede aparecer tu nombre")
    print(f"\n   ⚠️ Para eliminar tu número:")
    print(f"      • Visita: https://sync.me/optout/")
    
    return {"platform": "Sync.ME"}

def check_data_breaches(number):
    """Check if number appears in known data breaches"""
    print("\n" + "=" * 80)
    print("🔓 VERIFICACIÓN EN BRECHAS DE DATOS")
    print("=" * 80)
    
    clean = number.replace("+", "").replace(" ", "")
    
    print(f"\n🔍 Brechas de Datos Conocidas:")
    print(f"   • Facebook (2019): 419M números expuestos")
    print(f"   • WhatsApp (2019): 500M números")
    print(f"   • LinkedIn (2021): 700M perfiles")
    print(f"   • Clubhouse (2021): 1.3M usuarios")
    
    print(f"\n   ⚠️ Para verificar si tu número está en brechas:")
    print(f"      • HaveIBeenPwned: https://haveibeenpwned.com/")
    print(f"      • Nota: HIBP principalmente verifica emails, no números")
    
    # Check hash
    phone_hash = hashlib.sha1(clean.encode()).hexdigest().upper()
    print(f"\n   🔐 SHA1 de tu número: {phone_hash[:10]}...")
    print(f"      • Algunos servicios usan este hash para búsquedas")
    
    return {"breaches": "Check manual required"}

def check_google_results(number):
    """Check what Google might show"""
    print("\n" + "=" * 80)
    print("🔍 EXPOSICIÓN EN BUSCADORES")
    print("=" * 80)
    
    formats = [
        number,
        number.replace("+34", "0034"),
        number.replace("+34", ""),
        number.replace("+34", "").replace(" ", ""),
        f'"{number}"',  # Búsqueda exacta
    ]
    
    print(f"\n🔍 Búsquedas recomendadas en Google:")
    for fmt in formats:
        encoded = urllib.parse.quote(fmt)
        print(f"   • https://www.google.com/search?q={encoded}")
    
    print(f"\n   💡 Consejos:")
    print(f"      • Usa comillas para búsqueda exacta")
    print(f"      • Prueba diferentes formatos")
    print(f"      • Revisa las primeras 3 páginas")
    print(f"      • Busca también en DuckDuckGo y Bing")
    
    return {"search_formats": formats}

def check_social_media_exposure(number):
    """Check social media exposure"""
    print("\n" + "=" * 80)
    print("📱 EXPOSICIÓN EN REDES SOCIALES")
    print("=" * 80)
    
    clean = number.replace("+", "").replace(" ", "")
    
    platforms = {
        "Facebook": {
            "search": f"site:facebook.com {number}",
            "privacy": "Configuración > Privacidad > Quién puede buscarte por número",
            "risk": "ALTO si es público"
        },
        "Instagram": {
            "search": "No permite búsqueda directa por número",
            "privacy": "Configuración > Privacidad > Otros pueden encontrarte",
            "risk": "MEDIO si está vinculado"
        },
        "Twitter/X": {
            "search": f"site:twitter.com {number}",
            "privacy": "Configuración > Privacidad > Descubrimiento",
            "risk": "BAJO normalmente"
        },
        "LinkedIn": {
            "search": f"site:linkedin.com {number}",
            "privacy": "Configuración > Visibilidad del perfil",
            "risk": "MEDIO si está en el perfil"
        },
        "TikTok": {
            "search": "Búsqueda por número si está vinculado",
            "privacy": "Configuración > Privacidad > Sugerir tu cuenta",
            "risk": "MEDIO"
        }
    }
    
    print("\n📱 Verificación por plataforma:")
    for platform, info in platforms.items():
        print(f"\n   {platform}:")
        print(f"      • Búsqueda: {info['search']}")
        print(f"      • Privacidad: {info['privacy']}")
        print(f"      • Riesgo: {info['risk']}")
    
    return platforms

def check_spanish_directories(number):
    """Check Spanish phone directories"""
    print("\n" + "=" * 80)
    print("📚 DIRECTORIOS TELEFÓNICOS ESPAÑOLES")
    print("=" * 80)
    
    clean = number.replace("+34", "").replace(" ", "")
    
    print(f"\n📚 Páginas Blancas/Amarillas:")
    print(f"   • URL: https://blancas.paginasamarillas.es")
    print(f"   • Nota: Principalmente números fijos, pero algunos móviles")
    
    print(f"\n📚 Infobel España:")
    print(f"   • URL: https://www.infobel.com/es/spain/")
    print(f"   • Directorio internacional")
    
    print(f"\n📚 11811 (Antiguo servicio de información):")
    print(f"   • URL: https://11811.es")
    print(f"   • Base de datos de empresas y particulares")
    
    print(f"\n⚠️ Lista Robinson (No publicidad):")
    print(f"   • URL: https://www.listarobinson.es")
    print(f"   • Regístrate para evitar llamadas comerciales")
    print(f"   • GRATIS para particulares")
    
    return {"directories": "Manual check required"}

def generate_privacy_report(number, results):
    """Generate privacy report"""
    print("\n" + "=" * 80)
    print("📊 INFORME DE PRIVACIDAD")
    print("=" * 80)
    
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    print(f"\n📅 Fecha del análisis: {timestamp}")
    print(f"📱 Número analizado: {number}")
    
    print(f"\n🔍 SITIOS DONDE VERIFICAR TU NÚMERO:")
    print(f"""
    1. Truecaller: https://www.truecaller.com/search/es/{number.replace('+34', '')}
    2. WhoCalld: https://whocalld.com/es/numero/{number.replace('+34', '')}
    3. ListaSpam: https://www.listaspam.com/buscar?q={number.replace('+34', '')}
    4. ResponderóNo: https://www.responderono.es/numero-de-telefono/{number.replace('+', '')}
    5. Telefono-Spam: https://telefono-spam.com/34{number.replace('+34', '')}
    """)
    
    print(f"\n⚠️ ACCIONES RECOMENDADAS:")
    print(f"""
    ✅ ALTA PRIORIDAD:
    1. Busca tu número en Google con comillas: "{number}"
    2. Verifica Truecaller y solicita eliminación si apareces
    3. Revisa configuración de privacidad en WhatsApp
    4. Regístrate en Lista Robinson
    
    📱 REDES SOCIALES:
    1. Facebook: Desactiva búsqueda por número
    2. Instagram: Desvincula el número si no es necesario
    3. LinkedIn: No muestres el número en el perfil
    4. WhatsApp: Configura privacidad en "Mis contactos"
    
    🛡️ PROTECCIÓN ADICIONAL:
    1. Usa un número virtual para servicios online
    2. No publiques tu número en internet
    3. Ten cuidado con apps que piden acceso a contactos
    4. Considera usar Signal (más privado que WhatsApp)
    """)
    
    print(f"\n🔒 NIVEL DE EXPOSICIÓN ESTIMADO:")
    print(f"   • Si no apareces en los sitios listados: BAJO ✅")
    print(f"   • Si apareces en 1-2 sitios: MEDIO ⚠️")
    print(f"   • Si apareces en 3+ sitios: ALTO ❌")
    
    # Save report
    report_file = f"/workspace/privacy_report_{number.replace('+', '')}.json"
    with open(report_file, 'w', encoding='utf-8') as f:
        json.dump({
            "timestamp": timestamp,
            "number": number,
            "checks_performed": results,
            "recommendations": "See console output"
        }, f, indent=2, ensure_ascii=False)
    
    print(f"\n💾 Informe guardado en: {report_file}")
    
    return report_file

def main():
    number = "+34654161128"
    
    print("🔍 VERIFICADOR DE PRIVACIDAD TELEFÓNICA")
    print("=" * 80)
    print(f"Verificando qué información es pública sobre: {number}")
    print("=" * 80)
    
    results = {}
    
    # Perform all checks
    print("\n⏳ Realizando verificaciones de privacidad...\n")
    
    # 1. Truecaller
    results["truecaller"] = check_truecaller_format(number)
    
    # 2. WhoCalld
    results["whocalld"] = check_whocalld_format(number)
    
    # 3. Telefono-Spam
    results["telefono_spam"] = check_telefono_spam(number)
    
    # 4. ListaSpam
    results["listaspam"] = check_listaspam(number)
    
    # 5. ResponderóNo
    results["responderono"] = check_responderono(number)
    
    # 6. Sync.ME
    results["syncme"] = check_sync_me(number)
    
    # 7. Data breaches
    results["breaches"] = check_data_breaches(number)
    
    # 8. Google results
    results["google"] = check_google_results(number)
    
    # 9. Social media
    results["social_media"] = check_social_media_exposure(number)
    
    # 10. Spanish directories
    results["directories"] = check_spanish_directories(number)
    
    # Generate report
    report_path = generate_privacy_report(number, results)
    
    print("\n" + "=" * 80)
    print("✅ VERIFICACIÓN COMPLETADA")
    print("=" * 80)
    print("\n⚠️ IMPORTANTE: Debes verificar manualmente cada sitio")
    print("   Los resultados reales dependen de si alguien ha reportado tu número")
    
    return results

if __name__ == "__main__":
    results = main()