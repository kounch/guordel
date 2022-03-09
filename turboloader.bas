#program guordel
#autostart

   1 REM Copyright (c) 2022, kounch. All rights reserved.
   2 REM SPDX-License-Identifier: BSD-2-Clause

  10 CLEAR VAL "32767":LET I=NOT PI:LET P=VAL"7"
  20 LET D=VAL"43897"-VAL"1":LET A=D+VAL"6":LET B=A+VAL"1":LET C=VAL"35328":LET E=VAL"39168":LET F=VAL"38400":LET X=VAL"32768"
  30 PAPER I:BORDER I:INK P:CLS:PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **":PRINT AT VAL"21",VAL"8";"(C) kounch  2022"
  40 PRINT AT VAL"8",VAL"12";" CODE...":INK I:LOAD"loader "CODE X:INK P:RANDOMIZE USR X:PRINT 0:RANDOMIZE USR X:RUN VAL"3100"
  50 PRINT AT VAL"8",VAL"12";" CODE...":INK I:RANDOMIZE USR X:LOAD"guordel"CODE C:INK P
  60 PRINT AT VAL"8",VAL"12";" FONT...":INK I:RANDOMIZE USR X:LOAD"font1"CODE F:INK P
  70 RANDOMIZE F:POKE VAL"23606",PEEK VAL"23670":POKE VAL"23607",PEEK VAL"23671"-VAL"1"
  80 PRINT AT VAL"8",VAL"12";"WORDS...":INK I:RANDOMIZE USR X:LOAD"words"CODE (B+VAL"1"):INK P
  90 PRINT AT VAL"8",VAL"12";" SOLS...":INK I:RANDOMIZE USR X:LOAD"wordss"CODE E:INK P
 100 CLEAR VAL "35327":PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **":PRINT AT VAL"21",VAL"8";"(C) kounch  2022"

 199 REM ULAPLUS
 200 LET U=VAL"48955":LET L=VAL"65339":OUT U,VAL"64":OUT L,VAL"1":PRINT AT VAL"19",VAL"8";"ULAPLUS DISABLED":REM Turn on 64 colour mode
 210 OUT U,VAL"15":REM next we select the desired palette entry (BRIGHT 0:FLASH 0:PAPER 7:INK 0)
 220 OUT L,VAL"182":IF (IN L<>VAL"182") THEN GO TO 300:REM we pick a red, green and blue value (Original colour)
 230 OUT U,VAL"7":OUT L,VAL"255":PRINT AT VAL"19",VAL"8";"ULAPLUS ENABLED ":REM INK 7 BRIGHT
 240 OUT U,VAL"1":OUT L,VAL"255":REM INK 1 -> WHITE BRIGHT
 250 OUT U,VAL"10":OUT L,VAL"109":REM PAPER 2 -> GREY
 260 OUT U,VAL"12":OUT L,VAL"161":REM PAPER 4 -> GREEN
 270 OUT U,VAL"14":OUT L,VAL"185":REM PAPER 6 -> ORANGE
 280 OUT U,VAL"11":OUT L,VAL"119"
 300 PRINT AT VAL"8",VAL"12";"BASIC...":INK NOT PI:LOAD"basic":STOP
