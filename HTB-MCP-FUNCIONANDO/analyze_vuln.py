#!/usr/bin/env python3

print("=== Análisis de Vulnerabilidad en OperatorController.php ===\n")

print("PROBLEMA ENCONTRADO:")
print("-" * 50)
print("Línea 76: move_uploaded_file($tmp_name, $tempfile)")
print("  -> Mueve el archivo temporal a $tempfile")
print()
print("Línea 82-89: Valida el tipo MIME del archivo")
print("  -> Si no es imagen, hace unlink($tempfile)")
print()
print("Línea 102: move_uploaded_file($tempfile, $final)")
print("  -> FALLA porque $tempfile ya no existe como archivo temporal!")
print("  -> Debería usar rename($tempfile, $final) en su lugar")
print()
print("=" * 50)
print("\nVULNERABILIDAD:")
print("El segundo move_uploaded_file() en la línea 102 siempre fallará")
print("porque el archivo ya fue movido en la línea 76.")
print()
print("SOLUCIÓN:")
print("Cambiar línea 102 de:")
print('  if (!move_uploaded_file($tempfile, $final)) {')
print("A:")
print('  if (!rename($tempfile, $final)) {')
print()
print("=" * 50)
print("\nCREANDO ARCHIVO PARCHEADO...")

# Leer el archivo original
with open("/workspace/HTB-MCP-FUNCIONANDO/source_code/Controllers/OperatorController.php", "r") as f:
    content = f.read()

# Aplicar el parche
patched = content.replace(
    'if (!move_uploaded_file($tempfile, $final)) {',
    'if (!rename($tempfile, $final)) {'
)

# Guardar archivo parcheado
with open("/workspace/HTB-MCP-FUNCIONANDO/OperatorController_patched.php", "w") as f:
    f.write(patched)

print("Archivo parcheado guardado como: OperatorController_patched.php")

# Verificar que el parche se aplicó
if 'if (!rename($tempfile, $final)) {' in patched:
    print("✓ Parche aplicado correctamente")
else:
    print("✗ Error al aplicar el parche")