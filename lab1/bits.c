/* 
 * CS:APP Data Lab 
 * 
 * <Siyuan Shen siyuans>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  long Funct(long arg1, long arg2, ...) {
      /* brief description of how your implementation works */
      long var1 = Expr1;
      ...
      long varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. (Long) integer constants 0 through 255 (0xFFL), inclusive. You are
      not allowed to use big constants such as 0xffffffffL.
  3. Function arguments and local variables (no global variables).
  4. Local variables of type int and long
  5. Unary integer operations ! ~
     - Their arguments can have types int or long
     - Note that ! always returns int, even if the argument is long
  6. Binary integer operations & ^ | + << >>
     - Their arguments can have types int or long
  7. Casting from int to long and from long to int
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting other than between int and long.
  7. Use any data type other than int or long.  This implies that you
     cannot use arrays, structs, or unions.
 
  You may assume that your machine:
  1. Uses 2s complement representations for int and long.
  2. Data type int is 32 bits, long is 64.
  3. Performs right shifts arithmetically.
  4. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31 (int) or 63 (long)

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 63
   */
  long pow2plus1(long x) {
     /* exploit ability of shifts to compute powers of 2 */
     /* Note that the 'L' indicates a long constant */
     return (1L << x) + 1L;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 63
   */
  long pow2plus4(long x) {
     /* exploit ability of shifts to compute powers of 2 */
     long result = (1L << x);
     result += 4L;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2012 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* We do support the IEC 559 math functionality, real and complex.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
//1
/* 
 * bitOr - x|y using only ~ and & 
 *   Example: bitOr(6L, 5L) = 7L
 *   Legal ops: ~ &
 *   Max ops: 8
 *   Rating: 1
 */
long bitOr(long x, long y) {
  /* exclude the case with double zeros and give this case 0
   * assign all other cases with 1 
   */
  long noDoubleZero = ~((~x) & (~y));
  return noDoubleZero;
}
/* 
 * specialBits - return bit pattern 0xffffffca3fffffffL
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 3
 *   Rating: 1
 */
long specialBits(void) {
    long allOne = ~0L;
    long bits = 0xD7L << 30;
    return allOne ^ bits;
}
//2
/*
 * isZero - returns 1 if x == 0, and 0 otherwise 
 *   Examples: isZero(5L) = 0L, isZero(0L) = 1L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 2
 *   Rating: 1
 */
long isZero(long x) {
  return !x;
}
/* 
 * anyEvenBit - return 1 if any even-numbered bit in word set to 1
 *   where bits are numbered from 0 (least significant) to 63 (most significant)
 *   Examples anyEvenBit(0xAL) = 0L, anyEvenBit(0xEL) = 1L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 14
 *   Rating: 2
 */
long anyEvenBit(long x) {
  /* first create an 64 bit number with alternating 1 and 0. 
  * 
  */
  long double5 = 0x55L;
  long alternatingBits  = (double5 << 8) + double5;
  alternatingBits = (alternatingBits << 16) + alternatingBits;
  alternatingBits = (alternatingBits << 32) + alternatingBits;
  return (0x1L) ^ (!(alternatingBits & x));
}
/* 
 * negate - return -x 
 *   Example: negate(1L) = -1L.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
long negate(long x) {
  return (~x + 1);
}
/* 
 * leastBitPos - return a mask that marks the position of the
 *               least significant 1 bit. If x == 0, return 0
 *   Example: leastBitPos(96L) = 0x20L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2 
 */
long leastBitPos(long x) {
  long twoComplement = (~ x + 1);
  return twoComplement & x;
}
//3
/* 
 * rotateLeft - Rotate x to the left by n
 *   Can assume that 0 <= n <= 63
 *   Examples:
 *      rotateLeft(0x8765432187654321L,4L) = 0x7654321876543218L
 *   Legal ops: ~ & ^ | + << >> !
 *   Max ops: 25
 *   Rating: 3 
 */
long rotateLeft(long x, long n) {
  long shiftedLeft = x << n;
  long negativeN = ~n + 1;
  // printf("negativeN 0x%016llX\n", negativeN);
  long shiftedRight = x >> (64L + negativeN);
  // printf("shiftedRight 0x%016llX\n", shiftedRight);
  long allOnes = ~0L;
  // printf("allOnes 0x%016llX\n", allOnes);
  long shiftedRightMask = ~(allOnes << n) ;
  // printf("Mask 0x%016llX\n", shiftedRightMask);
  shiftedRight = shiftedRightMask & shiftedRight;
  return shiftedLeft | shiftedRight;
}
/* 
 * dividePower2 - Compute x/(2^n), for 0 <= n <= 62
 *  Round toward zero
 *   Examples: dividePower2(15L,1L) = 7L, dividePower2(-33L,4L) = -2L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
long dividePower2(long x, long n) {
    long sign = x >> 63; // sign will be all 0 if x is positive, all 1 if negative
    long negOne = ~0L;
    long bias = (1L << n) + negOne;
    return (x + (sign & bias)) >> n;
}
/* 
 * isLess - if x < y  then return 1, else return 0 
 *   Example: isLess(4L,5L) = 1L.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
long isLess(long x, long y) {
  long negativeX = ~x + 1;
  long negativeOne = ~0L;
  long differentSign = ~((x ^ y) >> 63);  // same sign 11111  different sign 00000
  long diffPlusOne = y + negativeX + negativeOne;
  long leftMostBit = (diffPlusOne >> 63) & 1L;
  long caseDifferent = (~differentSign) & ((x >> 63) & 1L);
  long caseSame = differentSign & (!leftMostBit);
  return caseSame + caseDifferent;
}
//4
/*
 * isPower2 - returns 1 if x is a power of 2, and 0 otherwise
 *   Examples: isPower2(5L) = 0L, isPower2(8L) = 1L, isPower2(0) = 0L
 *   Note that no negative number is a power of 2.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3
 */
long isPower2(long x) {
  long ifNeg = !((x >> 63) & 1L); // 0 if neg; 1 if pos
  long ifZero = !!x; // if zero: 0; if not zero: 1
  long negOne = ~0L;
  long singleOne = !(x & (x + negOne)); // if singleOne : 1
  return ifZero & ifNeg & singleOne;
}
/*
 * bitReverse - Reverse bits in a 64-bit word
 *   Examples: bitReverse(0x8000000200000000L) = 0x0000000040000001L
 *             bitReverse(0x0000000089ABCDEFL) = 0xF7D3D59100000000L
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 80
 *   Rating: 4
 */
long bitReverse(long x) {
    long swap16Left;
    long swap16Right;
    long mask16Bits1;
    long mask32Bits1;
    long mask64Bits1;
    long mask64Bits2;
    long swap8Left;
    long swap8Right;
    long mask8Bits1;
    long swap4Left;
    long swap4Right;
    long swap2Left;
    long swap2Right;
    long swap1Left;
    long swap1Right;


    long allOnes = ~0L;
    long maskLeft = (allOnes << 32);
    long maskRight = ~maskLeft;
    long swap32Left = ((x & maskLeft) >> 32) & maskRight;
    long swap32Right = (x & maskRight) << 32;
    x = swap32Left | swap32Right;

    maskLeft = (maskLeft << 16) | ((maskRight >> 16) << 16);
    maskRight = ~maskLeft;
    swap16Left = ((x & maskLeft) >> 16) & maskRight;
    swap16Right = (x & maskRight) << 16;
    x = swap16Left | swap16Right;

    mask16Bits1 = (0xFF << 8);
    mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    mask64Bits2 = ~mask64Bits1;
    swap8Left = ((x & mask64Bits1) >> 8) & mask64Bits2;
    swap8Right = (x & mask64Bits2) << 8;
    x = swap8Left | swap8Right;

    mask8Bits1 = 0xF0;
    mask16Bits1 = (mask8Bits1 << 8) | mask8Bits1;
    mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    mask64Bits2 = ~mask64Bits1;
    swap4Left = ((x & mask64Bits1) >> 4) & mask64Bits2;
    swap4Right = (x & mask64Bits2) << 4;
    x = swap4Left | swap4Right;

    mask8Bits1 = 0xCC;
    mask16Bits1 = (mask8Bits1 << 8) | mask8Bits1;
    mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    mask64Bits2 = ~mask64Bits1;
    swap2Left = ((x & mask64Bits1) >> 2) & mask64Bits2;
    swap2Right = (x & mask64Bits2) << 2;
    x = swap2Left | swap2Right;

    mask8Bits1 = 0xAA;
    mask16Bits1 = (mask8Bits1 << 8) | mask8Bits1;
    mask32Bits1 = (mask16Bits1 << 16) | mask16Bits1;
    mask64Bits1 = (mask32Bits1 << 32) | mask32Bits1;
    mask64Bits2 = ~mask64Bits1;
    swap1Left = ((x & mask64Bits1) >> 1) & mask64Bits2;
    swap1Right = (x & mask64Bits2) << 1;
    x = swap1Left | swap1Right;
    return x;
}
//float
/* 
 * floatFloat2Int - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
int floatFloat2Int(unsigned uf) {
  int M;
  int E;
  unsigned exp;
  int result;
  unsigned one = 1;
  unsigned sign = (uf >> 31) & one; // 0 for pos  1 for neg 
  
  exp = 0xffu & (uf >> 23);
  E = (int)exp - 127;

  if (exp < 127) {
    return 0;
  }

  if (exp >= 158) {
    return 0x80000000u;
  }

  M = uf & (0x7fffff);
  // printf("M 0x%08x\n", M);
  M = M | (one << 23);

  if (E < 23) {
    result = M >> (23 - E);
  } else {
    result = M << (E - 23);
  }
  // printf("%i\n", exp);
  // printf("%i\n", E);

  // printf("one 0x%08x\n", one);
  // printf("M 0x%08x\n", M);
  // printf("result %i\n", result);
  if (sign == 1) {
    return -result;
  }
  return result;
}
/* 
 * floatInt2Float - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned floatInt2Float(int x) {
  unsigned sign;
  unsigned absX;
  unsigned E = 0;
  unsigned M;
  unsigned frac;
  unsigned exp;
  unsigned absXCopy;
  unsigned numBitsRounded;
  unsigned removed;
  unsigned threshold;
  unsigned roundUp = 0;
  unsigned lastBit;
  
  if (x == 0) {
    return 0;
  }

  if(x == 0x80000000) {
		  return 0xcf000000;
  	}

  if (x >= 0) {
    sign = 0;
    absX = x;
  } else {
    sign = (1 << 31);
    absX = -x;
  }

  absXCopy = absX;
  while (absX > 1) {
    absX = absX >> 1;
    E++;
  }

  exp = E + 127;
  if (E <= 23) {
    M = absXCopy << (23 - E);
    frac = M & 0x7fffff;
    
  } else {
    numBitsRounded = E - 23;
    M = absXCopy >> numBitsRounded ;
    frac = M & 0x7fffff;

    removed = absXCopy & ((1 << numBitsRounded) - 1);
    threshold = 1 << (numBitsRounded - 1);
    
    if (removed > threshold ) {
      roundUp = 1;
    } else if (removed < threshold) {
      roundUp = 0;
    } else {
      lastBit = frac & 1;
      roundUp = lastBit;
    }

    if (removed == 0) {
      roundUp = 0;
    }
  }
  // printf("M 0x%08x\n", M);
  // printf("frac 0x%08x\n", frac);
  // printf("threshold 0x%08x\n", threshold);
  // printf("removed 0x%08x\n", removed);
  // printf("result 0x%08x\n", (sign | (exp << 23) | frac));
  return (sign | (exp << 23) | frac) + roundUp;
}
/* 
 * floatIsEqual - Compute f == g for floating point arguments f and g.
 *   Both the arguments are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   If either argument is NaN, return 0.
 *   +0 and -0 are considered equal.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 25
 *   Rating: 2
 */
int floatIsEqual(unsigned uf, unsigned ug) {
  unsigned expf;
  unsigned expg;
  unsigned fracf;
  unsigned fracg;

  if (uf == 0x80000000) {
    uf = 0;
  }

  if (ug == 0x80000000) {
    ug = 0;
  }

  fracf = uf & (0x7fffff);
  expf = 0xffu & (uf >> 23);
  if ( (expf == 0xff) && (fracf != 0) ) {
    return 0;
  }

  fracg = ug & (0x7fffff);
  expg = 0xffu & (ug >> 23);
  if ( (expg == 0xff) && (fracg != 0)) {
    return 0;
  }
  
  if ((uf ^ ug) == 0) {
    return 1;
  }
  return 0;
}
