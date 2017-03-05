5 poke 53281,14:print chr$(147):poke 53281,6
10 for l = 1 to 30
20 poke 1024 + int(rnd(1)*1000), 164
21 poke 1024 + int(rnd(1)*1000), 163
30 next l
40 sc = 0
50 ex = 1 : ey = 1
60 dx = 1 : dy = 1
70 x = 19 : y = 12
80 ox = x : oy = y
90 poke (1024+ex+40*ey),81
100 for t = 1 to 10 : next
110 poke 1024 + ex + 40*ey,32
120 ex = ex + dx
125 if peek(1024 + ex + 40*ey) = 163 then dx = -dx : goto 120
130 if ex <= 0 or ex >= 39 then dx = -dx
140 ey = ey + dy
145 if peek(1024 + ex + 40*ey) = 163 then dy = -dy : goto 140
150 if ey <= 0 or ey >= 24 then dy = -dy
160 po = 1024 + x + 40*y
170 poke po,65
171 for t = 1 to 10 : next
180 get a
190 if a = 9 then x = x + 1
200 if a = 1 then x = x - 1
210 if a = 8 then y = y - 1
220 if a = 2 then y = y + 1
230 if a = 5 then goto 290
231 if x < 0 or x > 39 then goto 290
232 if y < 0 or y > 24 then goto 290
240 opo = 1024 + ox + 40*oy
250 poke opo,32
255 if peek(1024 + x + 40*y) = 163 then goto 290
260 if peek(1024 + x + 40*y) = 164 then sc = sc + 10 : poke (1024+x+40*y),32
270 if ex = x and ey = y then goto 290
280 goto 80
290 print "game over - score: "; sc
