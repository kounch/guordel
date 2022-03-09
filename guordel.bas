#program guordel_en
#autostart

   1 REM Copyright (c) 2022, kounch. All rights reserved.
   2 REM SPDX-License-Identifier: BSD-2-Clause

  10 LET I=NOT PI:LET P=VAL"7":LET O=VAL"4":LET K=VAL"2":LET Y=VAL"6":LET YY=VAL"1":LET Q=NOT PI:LET G=NOT PI
  20 LET D=VAL"43897"-VAL"1":LET A=D+VAL"6":LET B=A+VAL"1":LET C=VAL"35328":LET E=VAL"39168":LET F=VAL"43840":GO TO 900

  29 REM Get lists length
  30 PAPER P:BORDER P:INK I:CLS:PRINT AT VAL"5",VAL"6";"COUNTING WORDS... ";:POKE A,NOT PI:POKE B,NOT PI:RANDOMIZE USR C:PRINT "OK"
  40 LET M=PEEK A*VAL"256"+PEEK B:PRINT AT VAL"7",VAL"10";"FOUND: ";M
  50 LET N=PEEK E*VAL"256"+PEEK (E+VAL"1"):PRINT AT VAL"9",VAL"10";N;" TO GUESS"
  60 PRINT AT VAL"1",VAL"8";"** ZX GUORDEL **":PRINT #0;AT VAL"1",VAL"2";"(C) kounch  2022":PRINT #0;AT VAL"1",VAL"25";"V1.2"
  70 PRINT AT VAL"14",VAL"8";"PRESS H FOR HELP":IF Q=0 THEN PRINT AT VAL"16",VAL"3";"MODE: NORMAL (D TO CHANGE)"
  80 IF Q=1 THEN PRINT AT VAL"16",VAL"3";"MODE: HARD   (D TO CHANGE)"
  90 PRINT AT VAL"19",VAL"2";"PRESS ANY OTHER KEY  TO PLAY"
 100 LET K$=INKEY$:IF K$="" THEN GO TO 100
 110 IF INKEY$<>"" THEN GO TO 110
 120 IF K$="H" OR K$="h" THEN GO TO 1000
 130 IF K$="S" OR K$="M" THEN GO TO 990
 140 IF K$="D" OR K$="d" THEN LET Q=VAL"1"-Q: GO TO 70

 149 REM Precalculate attribute addresses for onscreen keyboard
 150 CLS:PRINT AT VAL"7",VAL"10";"PREPARING...":LET U$="QWERTYUIOPASDFGHJKLZXCVBNM":DIM U(VAL"26"):DIM V(VAL"26")
 160 FOR J=VAL"1" TO VAL"26":LET Z=VAL"15":LET X=VAL"4":LET L=J:IF J>VAL"10" THEN LET Z=VAL"17":LET X=VAL"5":LET L=J-VAL"10"
 170 IF J>VAL"19" THEN LET Z=VAL"19":LET X=VAL"6":LET L=J-VAL"19"
 180 IF J>VAL"27" THEN LET Z=VAL"21":LET X=VAL"9":LET L=J-VAL"27"
 190 LET X=X+L*VAL"2":LET U(J)=VAL"22496"+Z*VAL"32"+X:NEXT J

 199 REM Get Word to Guess
 200 FOR J=VAL"1" TO VAL"26":LET V(J)=P*VAL"8"+I:NEXT J:LET H$="     "
 210 CLS:RANDOMIZE PEEK VAL"23672"*VAL"256"+PEEK VAL"23673":LET W=VAL"1"+INT(RND*N):LET W=E+W*2:LET W=PEEK W*VAL"256"+PEEK(W+1)
 229 POKE A,INT(W/VAL"256"):POKE B,W-VAL"256"*PEEK A:RANDOMIZE USR C:LET R=PEEK A*VAL"256"+PEEK B:IF R=VAL"65535" THEN PRINT "UNEXPECTED ERROR":STOP
 230 LET W$="":FOR J=VAL"1" TO VAL"5":LET W$=W$+CHR$(PEEK (D+J)):NEXT J

 249 REM Show UI
 250 PRINT AT VAL"14",VAL"6";"Q W E R T Y U I O P":PRINT AT VAL"16",VAL"6";" A S D F G H J K L"
 260 PRINT AT VAL"18",VAL"6";"  Z X C V B N M"
 270 PLOT VAL"102",VAL"145":DRAW VAL"43",NOT PI:DRAW NOT PI,VAL"-51":DRAW VAL"-43",NOT PI:DRAW NOT PI,VAL"51"
 280 PLOT VAL"43",VAL"67":DRAW VAL"161",NOT PI:DRAW NOT PI,VAL"-48":DRAW VAL"-161",NOT PI:DRAW NOT PI,VAL"48"
 290 PAPER P:INK I:BORDER P

 299 REM Guess input
 300 LET T=NOT PI
 310 LET G$="":BORDER P
 320 LET K$=INKEY$:IF K$="" THEN GO TO 320
 330 PRINT AT VAL"4"+T,VAL"13"+LEN(G$);
 340 REM
 350 REM
 360 REM
 370 REM
 380 REM
 390 IF CODE(K$)<>VAL"12" THEN GO TO 420
 400 IF LEN(G$)>VAL"1" THEN LET G$=G$(1 TO (LEN(G$)-1)):PRINT CHR$(VAL"8");" ";CHR$(VAL"8");:GO TO 460
 410 IF LEN(G$)=VAL"1" THEN LET G$="":PRINT CHR$(VAL"8");" ";CHR$(VAL"8");:GO TO 460
 420 IF CODE(K$)=VAL"13" AND LEN(G$)=VAL"5" THEN GO TO 480
 430 IF CODE(K$)>VAL"96" AND CODE(K$)<123 THEN LET K$=CHR$(CODE(K$)-VAL"32"):REM LOWERCASE
 440 IF CODE(K$)<VAL"65" OR CODE(K$)>91 THEN GO TO 320
 450 IF LEN(G$)<VAL"5" THEN LET G$=G$+K$:PRINT K$;
 460 IF INKEY$<>"" THEN GO TO 460
 470 GO TO 320
 480 PRINT AT VAL"4"+T,VAL"13";
 490 IF INKEY$<>"" THEN GO TO 490

 499 REM Guess validation and UI update
 500 BORDER I:IF Q=NOT PI THEN GO TO 530
 510 FOR J=VAL"1" TO VAL"5":IF H$(J TO J)<>" "THEN IF H$(J TO J)<>G$(J TO J)THEN BORDER K:BEEP .25,NOT PI:PRINT "     ":GO TO 310:REM HARD MODE NOT VALID WORD
 520 NEXT J
 530 FOR J=VAL"1" TO VAL"5":POKE(D+J),CODE(G$(J TO J)):NEXT J:POKE A,VAL"255":POKE B,VAL"255":RANDOMIZE USR C
 540 LET R=PEEK A*VAL"256"+PEEK B:IF R=VAL"65535" THEN BORDER K:BEEP .5,NOT PI:PRINT "     ":GO TO 310:REM NOT A VALID WORD >:-|
 550 LET T=T+VAL"1":BORDER P:FOR J=VAL"1" TO VAL"5":LET X=P:LET S=K:IF G$(J TO J)=W$(J TO J) THEN LET S=O:LET H$(J TO J)=W$(J TO J):GO TO 580
 560 FOR L=VAL"1" TO VAL"5":IF G$(J TO J)=W$(L TO L) THEN LET X=YY:LET S=Y
 570 NEXT L
 580 POKE VAL"22636"+T*VAL"32"+J,S*VAL"8"+X:LET H=0:FOR L=1 TO LEN(U$):IF U$(L TO L)=G$(J TO J) THEN LET H=L
 590 NEXT L:IF V(H)<>O THEN LET V(H)=S
 600 POKE U(H),VAL"8"*V(H)+X:NEXT J:IF G$=W$ THEN BORDER P:PRINT INK O;G$:PRINT INK O;AT VAL"11",VAL"10";"SUCCESS! :-)":GO TO 630
 610 IF T<VAL"6" THEN GO TO 310
 620 LET T=NOT PI:PRINT INK K;AT VAL"11",VAL"11";"GAME  OVER":PRINT AT VAL"12",VAL"9";"IT WAS: ";W$
 630 IF INKEY$="" THEN GO TO 630
 640 IF INKEY$<>"" THEN GO TO 640
 650 FOR J=VAL"3" TO VAL"20":PRINT AT J,VAL"6";"                   ":NEXT J:PRINT AT VAL"5",VAL"7";"STATISTICS";:IF Q=NOT PI THEN PRINT"(NORMAL)"
 660 IF Q=VAL"1" THEN PRINT " (HARD)"
 670 PRINT AT VAL"12",VAL"10";"DISTRIBUTION":PLOT VAL"48",VAL"139":DRAW VAL"151",NOT PI:DRAW NOT PI,VAL"-129":DRAW VAL"-151",NOT PI:DRAW NOT PI,VAL"129"
 680 LET L=F+Q*VAL"18":LET H=L+T*2:LET J=PEEK H*VAL"256"+PEEK(H+VAL"1")+1:POKE H,INT(J/VAL"256"):POKE (H+VAL"1"),J-VAL"256"*PEEK H:IF T>NOT PI THEN LET T=VAL"1"
 690 LET H=L+VAL"14":LET J=PEEK H*VAL"256"+PEEK(H+VAL"1")+VAL"1":IF T=NOT PI THEN LET J=NOT PI
 700 POKE H,INT(J/VAL"256"):POKE (H+VAL"1"),J-VAL"256"*PEEK H:LET H=L+VAL"16":LET S=PEEK H*VAL"256"+PEEK(H+VAL"1"):IF J>S THEN LET S=J
 710 POKE H,INT(S/VAL"256"):POKE (H+VAL"1"),S-VAL"256"*PEEK H:PRINT AT VAL"9",VAL"7";J;" CURRENT STREAK":PRINT AT VAL"10",VAL"7";S;" MAX STREAK"
 720 LET X=NOT PI:LET S=NOT PI:LET R=NOT PI:FOR J=NOT PI TO VAL"6":LET H=L+J*VAL"2":LET T=PEEK H*VAL"256"+PEEK(H+VAL"1"):LET R=R+T:IF T>X THEN LET X=T
 730 IF J<>NOT PI THEN LET S=S+T
 740 NEXT J:PRINT AT VAL"7",VAL"7";R;" PLAYED":PRINT AT VAL"8",VAL"7";INT(100*S/R);"% WINS"
 750 FOR J=NOT PI TO VAL"6":IF J=NOT PI THEN GO TO 780
 760 LET H=L+J*VAL"2":LET T=PEEK H*VAL"256"+PEEK(H+VAL"1"):PRINT AT VAL"13"+J,VAL"8";J;" ";:PAPER O
 770 FOR S=NOT PI TO INT(VAL"10"*T/X):PRINT " ";:NEXT S:PRINT T:PAPER P
 780 NEXT J
 790 IF G<>NOT PI THEN GO TO 870
 800 PRINT AT VAL"1",VAL"1";"PRESS S TO SAVE STATS TO TAPE"
 810 PRINT AT VAL"0",VAL"1";"PRESS M TO GO BACK TO THE TITLE":PRINT AT VAL"2",VAL"2";"ANY OTHER KEY TO  PLAY AGAIN"
 820 LET K$=INKEY$:IF K$="" THEN GO TO 820
 830 IF INKEY$<>"" THEN GO TO 830
 840 IF K$="M" OR K$="m" THEN CLS:GO TO 60
 850 IF K$="S" OR K$="s" THEN GO TO 870
 860 GO TO 200

 869 REM Save Stats
 870 SAVE"scores"CODE F,VAL"56":IF G<>NOT PI THEN GO TO 810
 880 IF INKEY$<>"" THEN GO TO 880
 890 GO TO 810
 
 899 REM Load Stats
 900 INK P:FOR J=NOT PI TO VAL"55":POKE F+J,NOT PI:NEXT J:IF G<>NOT PI THEN GO TO 970
 910 PRINT AT VAL"12",VAL"0";"LOAD STATISTICS FROM TAPE? (Y/N)"
 920 LET K$=INKEY$:IF K$="" THEN GO TO 920
 930 IF INKEY$<>"" THEN GO TO 930
 940 IF K$="n" OR K$="N" THEN GO TO 980
 950 IF K$<>"y" AND K$<>"Y" THEN GO TO 920
 960 PRINT AT VAL"12",VAL"0";"      PLEASE START THE TAPE     "
 970 PRINT AT VAL"8",VAL"12";"STATS...":INK I:LOAD"scores"CODE F
 980 GO TO 30
 990 INK I:PAPER VAL"3":BORDER VAL"3":CLS:PRINT AT VAL"10",VAL"2";"Dedicado a Sara y Montse :-*":PAUSE 0:INK I:PAPER P:BORDER P:CLS:GO TO 60
 
 999 REM HELP TEXT
1000 INK I:PAPER P:BORDER P:CLS:PRINT AT NOT PI,VAL"10";"GUORDEL HELP":PRINT
1010 PRINT "GUESS THE WORD IN SIX TRIES."
1020 PRINT "EACH GUESS MUST BE A VALID FIVE-"
1030 PRINT "LETTER WORD. HIT ENTER TO GUESS."
1040 PRINT "AFTER EACH GUESS, THE COLOUR OF"
1050 PRINT "THE LETTERS WILL CHANGE TO SHOW"
1060 PRINT "HOW CLOSE YOUR GUESS WAS.":PRINT
1070 PRINT AT VAL"9",VAL"12";"EXAMPLES":PRINT
1080 PRINT PAPER O;INK P;"W";:PRINT"EARY"
1090 PRINT "THE LETTER W IS IN THE WORD AND"
1100 PRINT "IN THE CORRECT SPOT.":PRINT
1110 PRINT "P";PAPER Y;INK YY;"I";:PRINT "LLS"
1120 PRINT "THE LETTER I IS IN THE WORD BUT"
1130 PRINT "IN THE WRONG SPOT.":PRINT
1140 PRINT "VAG";PAPER K;INK P;"U";:PRINT "E"
1150 PRINT "THE LETTER U IS NOT IN THE WORD"
1160 PRINT "IN ANY SPOT."
1170 IF INKEY$<>"" THEN GO TO 1170
1180 IF INKEY$="" THEN GO TO 1180
1190 CLS:GO TO 60
