# Guardle

## Memory map

Reserved Spaces

42484-45566 (3K) Compiled C binary code
45566-48119 (2.5K) Solutions list
48119-48125 (6 bytes) Word Letters (0 terminated string)
48126 (2 bytes) Word Number
48128-65022 (16.5K) Word Dictionary

## Compression

Word packing algorithm based on [http://alexanderpruss.blogspot.com/2022/02/game-boy-wordle-how-to-compress-12972.html?m=1]

1. Divide the 12972 word list n lists, based on the first letter of the word. Since in each list, the first letter is the same, we now need only store four letters per word, along with some overhead for each list.

2. Each four letter “word” (or tail of a word) can be stored with 5 bits per letter, thereby yielding a 20 bit unsigned integer. If we stop here, we can store each word in 2.5 bytes.

3. As each of the lists of four letter “words”, is in alphabetical order, and encoded the natural way as 20 bit numbers, the numbers will be in ascending order. Instead of storing these numbers, we need only store their arithmetical differences.

4. Store a stream of bytes encoding the difference. Each number is encoded as one, two or three bytes.

## Word list sources

[https://wordle.danielfrg.com](Spanish)

---

## Copyright

Copyright (c) 2022 kounch

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE
