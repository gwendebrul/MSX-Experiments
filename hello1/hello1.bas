10 REM Hello World
20 REM
30 REM by Gwen De Brul
40 REM
45 DEFUSR=&HC000
50 SCREEN 0
60 ST=49152!
70 L=&H1B
80 FOR I=0 TO L
90 READ A$
110 POKE ST+I,VAL("&H"+A$)
120 NEXT I
140 X=USR(0)
150 DATA 21,0F,C0
160 DATA 7E
170 DATA FE,00
180 DATA 28,06
190 DATA CD,A2,00
200 DATA 23
210 DATA 18,F5
220 DATA C9
230 DATA 48,65,6C,6C,6F,20,57,6F,72,6C,64,21,00
