ZX GUORDEL is a word discovery game, for ZX Spectrum (48K or better) and its derivatives, inspired by Wordle (https://www.nytimes.com/games/wordle/index.html). Wordle is an idea and original creation by Josh Wardle (https://powerlanguage.co.uk), the game name is a play on his surname.

The latest versions include some enhancements that may require additional hardware to be enabled:

- Automatic save of statistics (esxdos, etc.)
- Turbo mode when checking the dictionary (ZX-Uno, ZX Spectrum Next or similar)
- Colours closer to those of the original game (ULAplus)
- Alternative Spanish font (esxdos, etc.)

Loading instructions
--------------------
You can obtain the latest version of the game from the releases page, here: https://github.com/kounch/guordel/releases/latest. There are distribution files in several formats: tape for classic ZX Spectrum (normal .tap and turbo .tzx or .pzx), +3 disk file (.dsk), files for esxdos (http://esxdos.org), and files for ZX Spectrum Next (https://www.specnext.com). All these are available in several languages.

Tape
----
Type LOAD"" and "Enter", and start the tape.

+3 disk
-------
With the disk inserted in the main drive (A:), without write protection, choose the menu option "Loader" and press "Enter" to start the game.

esxdos firmware
---------------
Copy the uncompressed contents of the ZIP file labelled for esxdos to the storage card.
With the device turned off, insert the card and turn on the computer. Make sure that esxdos initializes correctly.
Browse to the directory where the files are and run the program GUORDEL.BAS, either from the command line, or using a file browser, to start the game.

ZX Spectrum Next and clones
---------------------------
Extract the contents of the ZIP file labelled for ZX Spectrum Next to the SD card.
With the device turned off, insert the SD card and turn on the computer. For compatible computers, be sure to boot up with the ZX Spectrum Next core.
Browse to the directory where the files are and run the program guordel.bas from within the directory where the extracted files are, to start the game.


How to play
-----------
Guess the hidden word in six tries. Each guess must be a valid five-letter word. After each guess, the colour of the letters will change to show how close your guess was. Letters marked with green are in the word and in the correct spot. Letters marked with yellow are in the word but in the wrong spot. Letters marked with red (grey in ULAplus) aren`t in the word in any spot.

On hard mode, any revealed and correct hint (marked with green) must be used in the right spot in subsequent guesses.

Use the letters of the keyboard to type your word, and "Caps Shift" and 0 to delete a typed key. Hit the "Enter" key when ready to guess.

Game statistics are kept. On the tape version they can be saved manually, and they are stored automatically on all the other versions.

Copyright
---------

Copyright (c) 2022 kounch

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE

Spectrum Turboloader by Esben Krag Hansen (from Your Sinclair, May 1986)
