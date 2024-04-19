5 CLS
10 CUCO = 0
20 LC$(0) = "/"
30 LC$(1) = "-"
40 LC$(2) = "\"
50 LC$(3) = "|"
60 INPUT "ENTER COLUMN SIZE"; COLS
70 INPUT "ENTER ROWS SIZE"; ROWS
80 GRID = COLS * ROWS
90 DIM CGEN(GRID)
100 DIM NGEN(GRID)
110 INPUT "ENTER RANDOM SEED"; SEED%
120 LF = INT(RND(SEED%*-2))
130 PRINT "INITIALISING GRID..."
140 FOR I = 0 TO GRID
150 LF = INT(2*RND(1))
160 CGEN(I) = LF
170 NEXT I
180 CLS
190 FOR I = 0 TO GRID-1
200 IF CGEN(I) = 0 THEN PRINT " "; ELSE PRINT "@";
210 IF ((I+1) MOD COLS) = 0 THEN PRINT ""
220 NEXT I
230 RC = 0
240 FOR I = 0 TO GRID-1
250 GOSUB 510
260 NGB = 0
270 TR = (((RC - 1) + ROWS) MOD ROWS)
280 BR = ((RC + 1) MOD ROWS)
290 A = (((((I - 1) MOD COLS)) + COLS) MOD COLS) + (COLS*RC)
300 B = ((I + 1) MOD COLS) + (COLS*RC)
310 C = (((((I - COLS - 1) MOD COLS)) + COLS) MOD COLS) + (COLS*TR)
320 D = (((((I - COLS + 1) MOD COLS)) + COLS) MOD COLS) + (COLS*TR)
330 E = (((((I - COLS) MOD COLS)) + COLS) MOD COLS) + (COLS*TR)
340 F = ((I + COLS) MOD COLS) + (COLS*BR)
350 G = ((I + COLS + 1) MOD COLS) + (COLS*BR)
360 H = ((I + COLS - 1) MOD COLS) + (COLS*BR)
370 NGB = CGEN(A) + CGEN(B) + CGEN(C) + CGEN(D) + CGEN(E) + CGEN(F) + CGEN(G) + CGEN(H)
380 IF CGEN(I) = 1 AND NGB < 2 THEN NGEN(I) = 0
390 IF CGEN(I) = 1 AND (NGB = 2 OR NGB = 3) THEN NGEN(I) = 1
400 IF CGEN(I) = 1 AND NGB > 3 THEN NGEN(I) = 0
410 IF CGEN(I) = 0 AND NGB = 3 THEN NGEN(I) = 1
420 IF ((I + 1) MOD COLS) = 0 THEN RC = RC + 1
430 NEXT I
440 CLS
450 FOR I = 0 TO GRID-1
460 IF NGEN(I) = 0 THEN PRINT " "; ELSE PRINT "@";
470 IF ((I+1) MOD COLS) = 0 THEN PRINT ""
480 CGEN(I) = NGEN(I)
490 NEXT I
500 GOTO 230
510 REM FUNCTION PRINT_LOADER
520 PRINT @318, LC$(CUCO);
530 CUCO = (CUCO + 1) MOD 4
540 RETURN