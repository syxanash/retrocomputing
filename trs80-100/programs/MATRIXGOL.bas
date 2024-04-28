cls

input "enter column size"; cols
input "enter rows size"; rows

grid = cols * rows

dim cgen(rows,cols)
dim ngen(rows,cols)

input "enter random seed (1 to 5 digits)"; seed%

lf = int(rnd(SEED%*-2))

for i = 0 TO rows-1
  for j = 0 to cols-1
    lf = int(2*rnd(1))

	  cgen(i,j) = lf
	  ngen(i,j) = cgen(i,j)
  next j
next i

labelA cls

beep

for i = 0 TO rows-1
  for j = 0 to cols-1
    if ngen(i, j) = 0 then print " "; else print "@";
    cgen(i, j) = ngen(i, j)
  next j

  print ""
next i

'  A          B       C
' i-1,j-1 | i-1,j | i-1,j+1
'  D                  E
' i,j-1   | i,j   | i,j+1
'  F         G        H
' i+1,j-1 | i+1,j | i+1,j+1

for i = 0 to rows-1
  for j = 0 to cols-1

    ngb = 0

    a = cgen(((((i-1) mod rows) + rows) mod rows), ((((j-1) mod cols) + cols) mod cols))
    b = cgen(((((i-1) mod rows) + rows) mod rows), (((j mod cols) + cols) mod cols))
    c = cgen(((((i-1) mod rows) + rows) mod rows), ((((j+1) mod cols) + cols) mod cols))
    d = cgen((((i mod rows) + rows) mod rows), ((((j-1) mod cols) + cols) mod cols))
    e = cgen((((i mod rows) + rows) mod rows), ((((j+1) mod cols) + cols) mod cols))
    f = cgen(((((i+1) mod rows) + rows) mod rows), ((((j-1) mod cols) + cols) mod cols))
    g = cgen(((((i+1) mod rows) + rows) mod rows), (((j mod cols) + cols) mod cols))
    h = cgen(((((i+1) mod rows) + rows) mod rows), ((((j+1) mod cols) + cols) mod cols))

    ngb = a + b + c + d + e + f + g + h

    ' gam of life rules
    if ngb < 2 then ngen(i, j) = 0
    if ngb > 3 then ngen(i, j) = 0
    if ngen(i, j) = 0 and ngb = 3 then ngen(i, j) = 1
  next j
next i

goto labelA