/*
Copyright (c) 2022, kounch
All rights reserved.

SPDX-License-Identifier: BSD-2-Clause
*/

#include "zxnext.h"

uint8_t ZXNEXT_detect() {
  uint8_t c_data;

  z80_outp(ZXNEXT_ADDR, MACHINEID_REG);
  c_data = z80_inp(ZXNEXT_REG);
  if ((c_data & 0x0F) == ZXNEXT_ZXNEXT) {
    return 1;
  } else {
    return 0;
  }
}

uint8_t ZXNEXT_TURBO_get() {
  // Gets current turbo mode
  z80_outp(ZXNEXT_ADDR, CPUSPEED_REG);
  return z80_inp(ZXNEXT_REG) & ZXNEXT_TURBO_MASK;
}

void ZXNEXT_TURBO_set(uint8_t turboMode) {
  // Sets a turbo mode.
  z80_outp(ZXNEXT_ADDR, CPUSPEED_REG);
  z80_outp(ZXNEXT_REG,
           (z80_inp(ZXNEXT_REG) & (~ZXNEXT_TURBO_MASK)) | turboMode);
}
