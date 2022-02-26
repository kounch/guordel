#program guordel
#autostart

   1 REM Copyright (c) 2022, kounch. All rights reserved.
   2 REM SPDX-License-Identifier: BSD-2-Clause

  10 CLEAR VAL "44031"
  20 LET I=NOT PI:LET P=VAL"7":LET O=VAL"4":LET K=VAL"1":LET Y=VAL"6"
  30 LET A=VAL"48126":LET B=VAL"48127":LET C=VAL"44032":LET D=VAL"48119"

 100 PAPER I:INK P:CLS:PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **"
 110 PRINT AT VAL"8",VAL"8";"LOADING CODE...":INK I:LOAD "guordel"CODE C:INK P
 120 PRINT AT VAL"8",VAL"8";"LOADING WORDS...":INK I:LOAD"words"CODE (B+1):INK P

 200 PAPER P:INK I:CLS:PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **"
 210 PRINT AT VAL"8",VAL"7";"COUNTING WORDS...";:POKE A,NOT PI:POKE B,NOT PI:RANDOMIZE USR C:PRINT "OK"
 220 LET M=PEEK A*VAL"256"+PEEK B:PRINT AT VAL"10",VAL"10";"FOUND ";M
 230 PRINT AT VAL"18",VAL"1";"PRESS ANY KEY TO START A GAME"
 240 PAUSE 0

 300 CLS:RANDOMIZE PEEK VAL"23672"*VAL"256"+PEEK VAL"23673"
 310 LET W=VAL"1"+INT(RND*M)
 315 PRINT "WORD NUMBER: ";W
 320 POKE A,INT(W/VAL"256"):POKE B,W-VAL"256"*PEEK A:RANDOMIZE USR C
 330 LET R=PEEK A*VAL"256"+PEEK B:IF R=VAL"65535" THEN PRINT "UNEXPECTED ERROR":STOP
 340 LET W$="":FOR J=VAL"1" TO VAL"5":LET W$=W$+CHR$(PEEK (D+J)):NEXT J
 345 PRINT"WORD: ";W$:REM PAUSE 0:GO TO 310

 400 INPUT "YOUR GUESS: ";G$
 410 IF G$=W$ THEN INK O:PRINT G$:INK I:PRINT "SUCCESS! :-)":PAUSE 0:GO TO 300
 420 FOR J=VAL"1" TO VAL"5":POKE(D+J),CODE(G$(J TO J)):NEXT J
 430 POKE A,VAL"255":POKE B,VAL"255":RANDOMIZE USR C
 440 LET R=PEEK A*VAL"256"+PEEK B:IF R=VAL"65535" THEN GO TO 400:REM NOT A VALID WORD >:-|

 500 FOR J=VAL"1" TO VAL"5":LET S=K
 510 IF G$(J TO J)=W$(J TO J) THEN S=O:GO TO 540
 520 FOR L=VAL"1" TO VAL"5":IF G$(J TO J)=W$(L TO L) THEN LET S=Y
 530 NEXT L
 540 INK S:PRINT G$(J TO J);:INK I:NEXT J:PRINT""
 550 GO TO 400