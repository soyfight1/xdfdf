
#include <stdio.h>
#include <string.h>

unsigned char* MD5(const unsigned char *d, unsigned long n, unsigned char *md) {
    // Stub MD5 - solo devuelve algo
    if (md) {
        for(int i = 0; i < 16; i++) {
            md[i] = i;
        }
    }
    return md;
}
