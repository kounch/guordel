/*
Copyright (c) 2022, kounch
All rights reserved.

SPDX-License-Identifier: BSD-2-Clause
*/

#include <arch/zx.h>
#include <z80.h>

#ifndef __ZXNEXT__
#define __ZXNEXT__

// ZX Next register address port
#define ZXNEXT_ADDR 9275
// ZX Next register data port
#define ZXNEXT_REG 9531

// ZX Next Registers
#define MACHINEID_REG 0x00
#define CPUSPEED_REG 0x07

// ZX Next Machine IDs
#define ZXNEXT_DE1A 0x01
#define ZXNEXT_DE2A 0x02
#define ZXNEXT_FBLABS 0x05
#define ZXNEXT_VTRUCCO 0x06
#define ZXNEXT_WXEDA 0x07
#define ZXNEXT_EMULATORS 0x08
#define ZXNEXT_MULTICORE 0x0B
#define ZXNEXT_ZXNEXT 0x0A
#define ZXNEXT_UNAMIGA 0xAA
#define ZXNEXT_SIDI 0xBA
#define ZXNEXT_MIST 0xCA
#define ZXNEXT_MISTER 0xDA
#define ZXNEXT_ZXDOS 0xEA
#define ZXNEXT_ANTIBRICK 0xFA

// ZX Next Turbo Modes
#define ZXNEXT_TURBO_X1 0x00
#define ZXNEXT_TURBO_X2 0x01
#define ZXNEXT_TURBO_X4 0x02
#define ZXNEXT_TURBO_X8 0x03

#define ZXNEXT_TURBO_MASK 0x03

extern uint8_t ZXNEXT_detect();
extern uint8_t ZXNEXT_TURBO_get();
extern void ZXNEXT_TURBO_set(uint8_t turboMode);

#endif // #define __ZXNEXT__
