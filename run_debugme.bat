
@echo off
echo Ejecutando primera instancia...
start debugme.exe
timeout /t 1
echo Ejecutando segunda instancia...
start debugme.exe
echo.
echo Ahora presiona Check en cualquiera de las ventanas!
pause
