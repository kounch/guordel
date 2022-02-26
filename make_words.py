#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# -*- mode: Python; tab-width: 4; indent-tabs-mode: nil; -*-
# Do not modify previous lines. See PEP 8, PEP 263.
# pylint: disable=too-many-lines
"""
Copyright (c) 2022, kounch
All rights reserved.

SPDX-License-Identifier: BSD-2-Clause
"""

from __future__ import print_function
import logging
import sys
import os

__MY_VERSION__ = '0.0.1'

LOGGER = logging.getLogger(__name__)
LOGGER.setLevel(logging.INFO)
LOG_FORMAT = logging.Formatter(
    '%(asctime)s [%(levelname)-5.5s] - %(name)s: %(message)s')
LOG_STREAM = logging.StreamHandler(sys.stdout)
LOG_STREAM.setFormatter(LOG_FORMAT)
LOGGER.addHandler(LOG_STREAM)

if sys.version_info < (3, 6, 0):
    LOGGER.error('This software requires Python version 3.6 or greater')
    sys.exit(1)

MY_DIRPATH = os.path.dirname(sys.argv[0])
MY_DIRPATH = os.path.abspath(MY_DIRPATH)


def main():
    """Main routine"""

    LOGGER.debug('Start')
    str_words = os.path.join(MY_DIRPATH, 'words.txt')
    str_sols = os.path.join(MY_DIRPATH, 'wordss.txt')
    str_binwords = os.path.join(MY_DIRPATH, 'words')
    str_binsols = os.path.join(MY_DIRPATH, 'wordss')

    dict_words = create_wordpack(str_words)
    i_arr_len = len(dict_words)
    i_offset = 1 + i_arr_len * 4
    i_total_count = 0
    with open(f'{str_binwords}', "wb") as out_bindata:
        out_bindata.write(i_arr_len.to_bytes(1, 'big'))  # Total Letters
        for c_index in dict_words:
            i_offset += len(dict_words[c_index][0])
            i_count = dict_words[c_index][1]
            i_total_count += i_count
            out_bindata.write(i_offset.to_bytes(2, 'big'))  # Letter offset
            out_bindata.write(i_count.to_bytes(2, 'big'))  # Letter word count
        for c_index in dict_words:
            out_bindata.write(dict_words[c_index][0])  # Letter word pack
    print(i_total_count)

    i_sols_len, b_sols = create_solpack(str_words, str_sols)
    with open(f'{str_binsols}', "wb") as out_bindata:
        out_bindata.write(i_sols_len.to_bytes(2, 'big'))  # Total Solutions
        out_bindata.write(b_sols)
    print(i_sols_len)

    extract_word(str_binwords, i_total_count)

    LOGGER.debug('End')


def create_wordpack(str_file_words):
    """Creates wordpack data from txt"""
    dict_words = {}
    with open(str_file_words, 'r', encoding='utf-8') as wordlist_handle:
        LOGGER.debug('Loading words...')
        i_last = 0
        for str_line in wordlist_handle.readlines():
            str_word = str_line.strip().upper()
            str_word = str_word.replace('Ñ', '[')
            if len(str_word) == 5:
                c_index = str_word[:1]
                str_subword = str_word[1:]
                i_word = 0
                for index, c_letter in enumerate(str_subword):
                    i_letter = ord(c_letter) - ord('A')
                    i_letter = i_letter << (5 * (3 - index))
                    i_word += i_letter

                if c_index not in dict_words:
                    i_last = 0
                    dict_words[c_index] = [b'', 0]

                i_diff = i_word - i_last

                if i_diff > 0x3fffff:
                    print(f'>>> {i_diff} ({i_diff:032b})')
                    LOGGER.error('Not compressible')
                    sys.exit(255)
                elif i_diff > 0x3fff:
                    b_diff = (0xc00000 + i_diff).to_bytes(3, 'big')
                elif i_diff > 0x3f:
                    b_diff = (0x4000 + i_diff).to_bytes(2, 'big')
                else:
                    b_diff = i_diff.to_bytes(1, 'big')

                dict_words[c_index][0] += b_diff
                dict_words[c_index][1] += 1
                i_last = i_word

                # LOGGER.debug(f'{c_index}: {str_subword} ->{i_word} : {i_diff}')

    return dict_words


def create_solpack(file_words, str_file_sols):
    """"Indexes solutions"""
    with open(file_words, 'r', encoding='utf-8') as wordlist_handle:
        arr_words = wordlist_handle.readlines()

    i_sols = 0
    b_sols = b''
    with open(str_file_sols, 'r', encoding='utf-8') as sollist_handle:
        for str_word in sollist_handle.readlines():
            i_sol = arr_words.index(str_word) + 1
            b_sols += i_sol.to_bytes(2, 'big')
            i_sols += 1

    return i_sols, b_sols


def extract_word(str_bin_words, i_word_number=-1):
    "Extracts a word from wordpack data"
    i_total_count = 0
    i_word_count = 0
    with open(f'{str_bin_words}', "rb") as in_bindata:
        index_len = int.from_bytes(in_bindata.read(1), 'big')
        arr_offsets = []
        arr_count = []
        for c_index in range(index_len):
            arr_offsets.append(int.from_bytes(in_bindata.read(2), 'big'))
            arr_count.append(int.from_bytes(in_bindata.read(2), 'big'))
            i_total_count += arr_count[c_index]
        if i_total_count < i_word_number:
            LOGGER.error('Out of range word index')
            sys.exit(2)

        i_offset = 1 + 4 * index_len
        for c_index in range(index_len):
            new_offset = arr_offsets[c_index]
            len_data = new_offset - i_offset
            in_bindata.seek(i_offset)
            i_word = 0
            while len_data > 0:
                b_diff = in_bindata.read(1)
                len_data -= 1
                i_diff = int.from_bytes(b_diff, 'big')
                if i_diff > 191:
                    b_diff = (i_diff & 0x3f).to_bytes(
                        1, 'big') + in_bindata.read(2)
                    len_data -= 2
                elif i_diff > 63:
                    b_diff = (i_diff & 0x3f).to_bytes(
                        1, 'big') + in_bindata.read(1)
                    len_data -= 1
                i_diff = int.from_bytes(b_diff, 'big')
                i_word += i_diff

                new_word = chr(ord('A') + c_index)
                for index in range(4):
                    i_letter = i_word >> (5 * (3 - index)) & 0x1f
                    i_letter += ord('A')
                    c_letter = chr(i_letter)
                    new_word += c_letter

                new_word = new_word.replace('[', 'Ñ')

                i_word_count += 1
                if i_word_number == i_word_count:
                    print(new_word.lower())
                    break
            i_offset = new_offset


if __name__ == "__main__":
    main()
