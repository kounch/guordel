/*
Copyright (c) 2022, kounch
All rights reserved.

SPDX-License-Identifier: BSD-2-Clause
*/

#include "zxnext/zxnext.h"
#include "zxuno/zxuno.h"
#include <arch/zx.h>
#include <string.h>
#include <z80.h>

void fill_word(unsigned char current_letter, uint32_t i_word, char new_word[]);
uint8_t turbo_on();
void turbo_off(uint8_t u_speed);
