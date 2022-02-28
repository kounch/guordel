/*
Copyright (c) 2022, kounch
All rights reserved.

SPDX-License-Identifier: BSD-2-Clause
*/

#include "guordel.h"

int main() {
  unsigned char *p_words;
  unsigned char *p_word;
  unsigned char *p_string;
  uint16_t word_number;
  char new_word[6];
  char word_search[6];
  unsigned char c_search = 0xff;

  unsigned char total_letters;
  unsigned char current_letter;
  uint16_t i_offset;
  uint16_t new_offset;
  uint16_t i_count;
  uint16_t new_count;
  uint32_t i_diff;
  uint32_t i_word;
  int ret;

  p_string = (unsigned char *)44025; // Result location
  p_word = p_string + 5;   // Word number location
  p_words = p_string + 7;  // Word Dictionary location

  // Get Word to obtain
  word_number = *(p_word)*256 + *(p_word + 1);
  memcpy(word_search, p_string, 5);
  new_word[5] = 0;
  word_search[5] = 0;

  total_letters = *(p_words);

  i_offset = 1 + total_letters * 4;

  if (word_number == 0xffff)
    c_search = word_search[0] - 65;

  i_count = 0;
  for (char i = 0; i < total_letters; i++) {
    current_letter = i + 65;
    new_offset = *(p_words + 1 + i * 4) * 256 + *(p_words + 2 + i * 4);
    new_count = *(p_words + 3 + i * 4) * 256 + *(p_words + 4 + i * 4);
    i_word = 0;
    if ((i < c_search) && (i_count + new_count < word_number)) {
      i_count += new_count;
    } else {
      while (new_offset > i_offset) {
        i_diff = (uint32_t) * (p_words + i_offset);
        ++i_offset;
        if (i_diff > 191) {
          i_diff = (uint32_t)(i_diff - 192) * 65536 +
                   (uint32_t) * (p_words + i_offset) * 256 +
                   *(p_words + i_offset + 1);
          i_offset += 2;
        } else if (i_diff > 63) {
          i_diff = (uint32_t)(i_diff - 64) * 256 + *(p_words + i_offset);
          ++i_offset;
        }
        i_word += i_diff;
        ++i_count;
        if ((word_number == 0xffff) && (c_search == i)) {
          fill_word(current_letter, i_word, new_word);
          ret = strncmp(new_word, word_search, 5);
          if (ret == 0) {
            word_number = i_count;
            break;
          }
        }
        if (i_count == word_number) {
          fill_word(current_letter, i_word, new_word);
          memcpy(p_string, new_word, 5);
          break;
        }
      }
    }
    if (i_count == word_number) {
      break;
    }
    i_offset = new_offset;
  }
  if (word_number == 0)
    word_number = i_count;
  if (i_count != word_number)
    word_number = 0xffff;
  *p_word = word_number >> 8;
  *(p_word + 1) = word_number & 0xff;

  return 0;
}

void fill_word(unsigned char current_letter, uint32_t i_word, char new_word[]) {
  unsigned char c_letter;
  new_word[0] = current_letter;
  for (char j = 1; j < 5; j++) {
    c_letter = i_word >> (5 * (4 - j)) & 0x1f;
    c_letter += 65;
    new_word[j] = c_letter;
  }
}
