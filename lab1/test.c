#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

int anyEvenBitTest(int x) {
    return 0;
}

long rotateLeftTest(long x, long n) {
    long shiftedLeft = x << n;
    printf("shiftedLeft 0x%016llX\n", shiftedLeft);
    long negativeN = ~n + 1;
    long shiftedRight = x >> (64 + negativeN);
    printf("shiftedRight 0x%016llX\n", shiftedRight);
    long allOnes = ~0L;
    printf("allOnes 0x%016llX\n", allOnes);
    long shiftedRightMask = (allOnes << n) ;
    printf("Mask 0x%016llX\n", shiftedRightMask);
    shiftedRight = shiftedRightMask ^ shiftedRight;
    printf(" 0x%016llX\n", shiftedRight);
    return shiftedLeft | shiftedRight;


        // maskLeft = (maskLeft << 8) | ((maskRight 8) << 8);
    // maskRight = (maskLeft << 8) | (maskRight >> 8);
    // long swap8Left = ((x & maskLeft) >> 8) & maskRight;
    // long swap8Right = (x & maskRight) << 8;
    // x = swap8Left | swap8Right;

    // printf("MasLeft 0x%016llX\n", maskLeft);
    // printf("MasRight 0x%016llX\n", maskRight);
    // printf("swap16Left 0x%016llX\n", swap16Left);
    // printf("swap16Right 0x%016llX\n", swap16Right);

    
    // printf("mask64Bits1 0x%016llX\n", mask64Bits1);
    // printf("mask64Bits2 0x%016llX\n", mask64Bits2);
    // printf("x 0x%016llX\n", x);
}

int main() {
    printf("0x%016llX\n", rotateLeftTest(0x10000000L, 4L));

    return 0;
}


long bitReverse(long x) {
    long allOnes = ~0L;
    long maskLeft = (allOnes << 32);
    long maskRight = ~maskLeft;
    long swap32Left = ((x & maskLeft) >> 32) & maskRight;
    long swap32Right = (x & maskRight) << 32;
    x = swap32Left | swap32Right;

    maskLeft = (maskLeft << 16) | ((maskRight >> 16) << 16);
    maskRight = (maskLeft << 16) | (maskRight >> 16);
    long swap16Left = ((x & maskLeft) >> 16) & maskRight;
    long swap16Right = (x & maskRight) << 16;
    x = swap16Left | swap16Right;

    long mask16Bits1 = (0xFF << 8);
    long mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    long mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    long mask64Bits2 = (mask64Bits1 >> 8);
    mask64Bits2 = mask64Bits2 ^ (mask64Bits2 << 56);
    long swap8Left = ((x & mask64Bits1) >> 8) & mask64Bits2;
    long swap8Right = (x & mask64Bits2) << 8;
    x = swap8Left | swap8Right;

    long mask8Bits1 = 0xF0;
    mask16Bits1 = (mask8Bits1 << 8) | mask8Bits1;
    mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    mask64Bits2 = (mask64Bits1 >> 4);
    mask64Bits2 = mask64Bits2 ^ (mask64Bits2 << 60);
    long swap4Left = ((x & mask64Bits1) >> 4) & mask64Bits2;
    long swap4Right = (x & mask64Bits2) << 4;
    x = swap4Left | swap4Right;

    mask8Bits1 = 0xCC;
    mask16Bits1 = (mask8Bits1 << 8) | mask8Bits1;
    mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    mask64Bits2 = (mask64Bits1 >> 2);
    mask64Bits2 = mask64Bits2 ^ (mask64Bits2 << 62);
    long swap2Left = ((x & mask64Bits1) >> 2) & mask64Bits2;
    long swap2Right = (x & mask64Bits2) << 2;
    x = swap2Left | swap2Right;

    mask8Bits1 = 0xAA;
    mask16Bits1 = (mask8Bits1 << 8) | mask8Bits1;
    mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    mask64Bits2 = (mask64Bits1 >> 1);
    mask64Bits2 = mask64Bits2 ^ (mask64Bits2 << 63);
    long swap1Left = ((x & mask64Bits1) >> 1) & mask64Bits2;
    long swap1Right = (x & mask64Bits2) << 1;
    x = swap1Left | swap1Right;
    return x;
}

