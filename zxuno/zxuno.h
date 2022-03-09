/*
Copyright (c) 2022, kounch
All rights reserved.

SPDX-License-Identifier: BSD-2-Clause
*/

#include <arch/zx.h>
#include <z80.h>

#ifndef __ZXUNO__
#define __ZXUNO__

// ZX-Uno register address port
#define ZXUNO_ADDR 64571
// ZX-Uno register data port
#define ZXUNO_REG 64827

// ZX-Uno Registers
#define SCANDBLCTRL_REG 0x0B
#define COREID_REG 0xFF

// ZX-Uno Turbo Modes
#define ZXUNO_TURBO_X1 0x00
#define ZXUNO_TURBO_X2 0x40
#define ZXUNO_TURBO_X4 0x80
#define ZXUNO_TURBO_X8 0xC0

#define ZXUNO_TURBO_MASK 0xC0

extern uint8_t ZXUNO_detect();
extern uint8_t ZXUNO_TURBO_get();
extern void ZXUNO_TURBO_set(uint8_t turboMode);

#endif // #define __ZXUNO__
