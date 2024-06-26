cls
cuco = 0
lc$(0) = "/"
lc$(1) = "-"
lc$(2) = "\"
lc$(3) = chr$(245)

input "enter column size"; cols
input "enter rows size"; rows

grid = cols * rows

dim cgen(grid)
dim ngen(grid)

input "enter random seed (1 to 5 digits)"; seed%

lf = int(rnd(SEED%*-2))

print "initialising grid..."

for i = 0 TO grid
	lf = int(2*rnd(1))
	cgen(i) = lf
	ngen(i) = cgen(i)
next i

label_main_loop cls

beep

for i = 0 TO grid-1
	if ngen(i) = 0 then print " "; else print "@";
	if ((i+1) mod cols) = 0 then print ""

	cgen(i) = ngen(i)
next i

' row counter
rc = 0

' find neighbors
for i = 0 to grid-1
	' print i; ") "; "analyzing "; cgen(i)
	gosub print_loader

	' the formula is: (a % w) + (w * r) where w = cols, r = row and "a" can be:
	'  -w-1 , -w  ,  -w+1
	'  -1   ,  i  ,  +1
	'  +w-1 , +w  ,  +w+1
	' "i" is the current cell being scanned
	
	' neighbors
	ngb = 0

	' top row
	tr = (((rc - 1) + rows) mod rows)
	' bottom row
	br = ((rc + 1) mod rows)
	' current row is stored in rc (row counter)
	cc = i + cols

	a = ((cc - 1) mod cols) + (cols*rc)
	b = ((cc + 1) mod cols) + (cols*rc)
	
	c = ((cc - 1) mod cols) + (cols*tr)
	d = ((cc + 1) mod cols) + (cols*tr)
	e = (cc mod cols) + (cols*tr)
	
	f = (cc mod cols) + (cols*br)
	g = ((cc + 1) mod cols) + (cols*br)
	h = ((cc - 1) mod cols) + (cols*br)

	ngb = cgen(a) + cgen(b) + cgen(c) + cgen(d) + cgen(e) + cgen(f) + cgen(g) + cgen(h)

	' gam of life rules
	if ngb < 2 then ngen(i) = 0
	if ngb > 3 then ngen(i) = 0
	if ngen(i) = 0 and ngb = 3 then ngen(i) = 1

	if ((i + 1) mod cols) = 0 then rc = rc + 1
next i

goto label_main_loop

function print_loader
	print @318, lc$(cuco);
	cuco = (cuco + 1) mod 4
return