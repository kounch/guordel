#program guordel
#autostart

   1 REM Copyright (c) 2022, kounch. All rights reserved.
   2 REM SPDX-License-Identifier: BSD-2-Clause

  10 CLEAR VAL "44031"
  20 LET I=NOT PI:LET P=VAL"7"
  30 LET A=VAL"48126":LET B=VAL"48127":LET C=VAL"44032":
  40 PAPER I:BORDER I:INK P:CLS:PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **"
  50 PRINT AT VAL"8",VAL"12";" CODE...":INK I:LOAD"guordel"CODE C:INK P
  60 PRINT AT VAL"8",VAL"12";"WORDS...":INK I:LOAD"words"CODE (B+1):INK P
  70 PRINT AT VAL"8",VAL"12";"BASIC...":INK I:LOAD"basic"
