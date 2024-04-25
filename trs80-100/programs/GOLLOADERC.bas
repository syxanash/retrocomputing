5 CLS
10 INPUT "ENTER COLUMN SIZE"; COLS
20 INPUT "ENTER ROWS SIZE"; ROWS
30 GRID = COLS * ROWS
40 DIM CGEN(GRID)
50 DIM NGEN(GRID)
60 INPUT "ENTER RANDOM SEED"; SEED%
70 LF = INT(RND(SEED%*-2))
80 PRINT "INITIALISING GRID..."
90 FOR I = 0 TO GRID
100 LF = INT(2*RND(1))
110 CGEN(I) = LF
120 NEXT I
130 CLS
140 FOR I = 0 TO GRID-1
150 IF CGEN(I) = 0 THEN PRINT " "; ELSE PRINT "@";
160 IF ((I+1) MOD COLS) = 0 THEN PRINT ""
170 NEXT I
180 RC = 0
190 BOXCO# = 0
200 MABOX = 37
210 PASSO# = MABOX / GRID
220 FOR I = 0 TO GRID-1
230 GOSUB 490
240 NGB = 0
250 TR = (((RC - 1) + ROWS) MOD ROWS)
260 BR = ((RC + 1) MOD ROWS)
270 A = (((((I - 1) MOD COLS)) + COLS) MOD COLS) + (COLS*RC)
280 B = ((I + 1) MOD COLS) + (COLS*RC)
290 C = (((((I - COLS - 1) MOD COLS)) + COLS) MOD COLS) + (COLS*TR)
300 D = (((((I - COLS + 1) MOD COLS)) + COLS) MOD COLS) + (COLS*TR)
310 E = (((((I - COLS) MOD COLS)) + COLS) MOD COLS) + (COLS*TR)
320 F = ((I + COLS) MOD COLS) + (COLS*BR)
330 G = ((I + COLS + 1) MOD COLS) + (COLS*BR)
340 H = ((I + COLS - 1) MOD COLS) + (COLS*BR)
350 NGB = CGEN(A) + CGEN(B) + CGEN(C) + CGEN(D) + CGEN(E) + CGEN(F) + CGEN(G) + CGEN(H)
360 IF CGEN(I) = 1 AND NGB < 2 THEN NGEN(I) = 0
370 IF CGEN(I) = 1 AND (NGB = 2 OR NGB = 3) THEN NGEN(I) = 1
380 IF CGEN(I) = 1 AND NGB > 3 THEN NGEN(I) = 0
390 IF CGEN(I) = 0 AND NGB = 3 THEN NGEN(I) = 1
400 IF ((I + 1) MOD COLS) = 0 THEN RC = RC + 1
410 NEXT I
420 CLS
430 FOR I = 0 TO GRID-1
440 IF NGEN(I) = 0 THEN PRINT " "; ELSE PRINT "@";
450 IF ((I+1) MOD COLS) = 0 THEN PRINT ""
460 CGEN(I) = NGEN(I)
470 NEXT I
480 GOTO 180
490 REM FUNCTION PRINT_LOADER
500 BOXCO# = (BOXCO# + PASSO#)
510 BOXES$ = ""
520 FOR J = 0 TO INT(BOXCO#)
530 BOXES$ = BOXES$ + CHR$(239)
540 NEXT J
550 PRINT @318, "|"; : PRINT @280, BOXES$;
560 RETURN