#program guordel
#autostart

   1 REM Copyright (c) 2022, kounch. All rights reserved.
   2 REM SPDX-License-Identifier: BSD-2-Clause

  10 CLEAR VAL "32767":LET I=NOT PI:LET P=VAL"7"
  20 LET D=VAL"44024":LET A=D+VAL"6":LET B=A+VAL"1":LET C=VAL"35840":LET E=VAL"39168":LET F=VAL"38400":LET X=VAL"32768"
  30 PAPER I:BORDER I:INK P:CLS:PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **":PRINT AT VAL"21",VAL"8";"(C) kounch  2022"
  40 PRINT AT VAL"8",VAL"12";" CODE...":INK I:LOAD"loader "CODE X:INK P:RANDOMIZE USR X:PRINT 0:RANDOMIZE USR X:RUN VAL"3100"
  50 PRINT AT VAL"8",VAL"12";" CODE...":INK I:RANDOMIZE USR X:LOAD"guordel"CODE C:INK P
  60 PRINT AT VAL"8",VAL"12";" FONT...":INK I:RANDOMIZE USR X:LOAD"font"CODE F:INK P
  70 RANDOMIZE F:POKE VAL"23606",PEEK VAL"23670":POKE VAL"23607",PEEK VAL"23671"-VAL"1"
  80 PRINT AT VAL"8",VAL"12";"WORDS...":INK I:RANDOMIZE USR X:LOAD"words"CODE (B+VAL"1"):INK P
  90 PRINT AT VAL"8",VAL"12";" SOLS...":INK I:RANDOMIZE USR X:LOAD"wordss"CODE E:INK P
 100 CLEAR VAL "35839":PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **":PRINT AT VAL"21",VAL"8";"(C) kounch  2022"
 110 PRINT AT VAL"8",VAL"12";"BASIC...":INK NOT PI:LOAD"basic":STOP