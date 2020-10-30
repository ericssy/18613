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
long bitOr(long, long);
long test_bitOr(long, long);
long specialBits();
long test_specialBits();
//2
long isZero(long);
long test_isZero(long);
long anyEvenBit(long);
long test_anyEvenBit(long);
long negate(long);
long test_negate(long);
long leastBitPos(long);
long test_leastBitPos(long);
//3
long rotateLeft(long, long);
long test_rotateLeft(long, long);
long dividePower2(long, long);
long test_dividePower2(long, long);
long isLess(long, long);
long test_isLess(long, long);
//4
long isPower2(long);
long test_isPower2(long);
long bitReverse(long);
long test_bitReverse(long);
//float
int floatFloat2Int(unsigned);
int test_floatFloat2Int(unsigned);
unsigned floatInt2Float(int);
unsigned test_floatInt2Float(int);
int floatIsEqual(unsigned, unsigned);
int test_floatIsEqual(unsigned, unsigned);
