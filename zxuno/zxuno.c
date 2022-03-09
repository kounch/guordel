/*
Copyright (c) 2022, kounch
All rights reserved.

SPDX-License-Identifier: BSD-2-Clause
*/

#include "zxuno.h"

uint8_t ZXUNO_detect() {
  uint8_t c_data;

  z80_outp(ZXUNO_ADDR, COREID_REG);
  c_data = z80_inp(ZXUNO_REG);
  if ((c_data >= 32) && (c_data <= 127)) {
    return 1;
  } else {
    return 0;
  }
}

uint8_t ZXUNO_TURBO_get() {
  // Gets current turbo mode
  z80_outp(ZXUNO_ADDR, SCANDBLCTRL_REG);
  return z80_inp(ZXUNO_REG) & ZXUNO_TURBO_MASK;
}

void ZXUNO_TURBO_set(uint8_t turboMode) {
  // Sets a turbo mode.
  z80_outp(ZXUNO_ADDR, SCANDBLCTRL_REG);
  z80_outp(ZXUNO_REG, (z80_inp(ZXUNO_REG) & (~ZXUNO_TURBO_MASK)) | turboMode);
}
