# LOG - ReadMyCert CTF Challenge

## Timestamp: 2024-08-16

### Iteración 1 - Reconocimiento inicial
- **Acción**: Descarga del archivo CSR desde picoCTF
- **Archivo**: readmycert.csr (997 bytes)
- **SHA256**: 4410a15aaf82bb9f7879816298df33685bd94dbe9e3b6b5e8d99f46483b7abb8

### Iteración 2 - Análisis paralelo (Workers A/B/C)

#### Worker-A (Primario)
- Método: `openssl req -in readmycert.csr -noout -text`
- Resultado: Extraído CN=picoCTF{read_mycert_57f58832}
- Estado: ÉXITO

#### Worker-B (Sombra)
- Método: `openssl req -in readmycert.csr -noout -subject`
- Resultado: subject=CN=picoCTF{read_mycert_57f58832}, name=ctfPlayer
- Estado: ÉXITO

#### Worker-C (Verificador)
- Método: Script Python con decodificación base64 y regex
- Resultado: picoCTF{read_mycert_57f58832}
- Estado: ÉXITO

### Iteración 3 - Verificación adicional
- Método: `openssl asn1parse -in readmycert.csr`
- Confirmación: UTF8STRING:picoCTF{read_mycert_57f58832} en posición 22
- Quórum alcanzado: 4/4 métodos confirman la misma bandera

### Conclusión
- **FLAG VALIDADA**: picoCTF{read_mycert_57f58832}
- **Coherencia**: 100% entre todos los métodos
- **Reproducibilidad**: Confirmada