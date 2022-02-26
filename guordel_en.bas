#program guordel_en
#autostart

   1 REM Copyright (c) 2022, kounch. All rights reserved.
   2 REM SPDX-License-Identifier: BSD-2-Clause

  10 LET I=NOT PI:LET P=VAL"7":LET O=VAL"4":LET K=VAL"2":LET Y=VAL"6"
  20 LET A=VAL"48126":LET B=VAL"48127":LET C=VAL"44032":LET D=VAL"48119"

 100 PAPER P:BORDER P:INK I:CLS:PRINT AT VAL"2",VAL"8";"** ZX GUORDEL **"
 110 PRINT AT VAL"8",VAL"7";"COUNTING WORDS...";:POKE A,NOT PI:POKE B,NOT PI:RANDOMIZE USR C:PRINT "OK"
 120 LET M=PEEK A*VAL"256"+PEEK B:PRINT AT VAL"10",VAL"10";"FOUND ";M
 130 PRINT AT VAL"18",VAL"1";"PRESS ANY KEY TO START A GAME"
 140 PAUSE 0

 200 CLS:RANDOMIZE PEEK VAL"23672"*VAL"256"+PEEK VAL"23673"
 210 LET W=VAL"1"+INT(RND*M)
 215 PRINT "WORD NUMBER: ";W
 220 POKE A,INT(W/VAL"256"):POKE B,W-VAL"256"*PEEK A:RANDOMIZE USR C
 230 LET R=PEEK A*VAL"256"+PEEK B:IF R=VAL"65535" THEN PRINT "UNEXPECTED ERROR":STOP
 240 LET W$="":FOR J=VAL"1" TO VAL"5":LET W$=W$+CHR$(PEEK (D+J)):NEXT J
 245 PRINT"WORD: ";W$

 300 INPUT "YOUR GUESS: ";G$
 310 IF G$=W$ THEN INK O:PRINT G$:INK I:PRINT "SUCCESS! :-)":PAUSE 0:GO TO 200
 320 FOR J=VAL"1" TO VAL"5":POKE(D+J),CODE(G$(J TO J)):NEXT J
 330 POKE A,VAL"255":POKE B,VAL"255":RANDOMIZE USR C
 340 LET R=PEEK A*VAL"256"+PEEK B:IF R=VAL"65535" THEN GO TO 400:REM NOT A VALID WORD >:-|

 400 FOR J=VAL"1" TO VAL"5":LET S=K
 410 IF G$(J TO J)=W$(J TO J) THEN S=O:GO TO 440
 420 FOR L=VAL"1" TO VAL"5":IF G$(J TO J)=W$(L TO L) THEN LET S=Y
 430 NEXT L
 440 PAPER I:INK S:PRINT G$(J TO J);:INK I:PAPER P:NEXT J:PRINT""
 450 GO TO 300
