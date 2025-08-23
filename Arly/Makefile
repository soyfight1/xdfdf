# Makefile para Arly.exe
# Compilación con MinGW o Visual Studio

CC = cl.exe
CFLAGS = /O2 /MT /W3
LIBS = ws2_32.lib cpr.lib alibabacloud-oss-cpp-sdk.lib
TARGET = Arly.exe

# Para MinGW
GCC = x86_64-w64-mingw32-gcc
GCCFLAGS = -O2 -Wall -static
GCCLIBS = -lws2_32 -lcpr -lalibabacloud-oss-cpp-sdk

# Compilación con Visual Studio
vs: arly_source.c
	$(CC) $(CFLAGS) arly_source.c $(LIBS) /Fe:$(TARGET)

# Compilación con MinGW
mingw: arly_source.c
	$(GCC) $(GCCFLAGS) arly_source.c $(GCCLIBS) -o $(TARGET)

clean:
	del *.obj *.exe

# Para compilar las DLLs auxiliares
dlls:
	$(CC) /LD /MT acproxy.c /Fe:acproxy.dll
	$(CC) /LD /MT cpr_wrapper.c /Fe:cpr.dll
