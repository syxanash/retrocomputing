' even faster implementation, since this one does not contain all those
' MOD operations the 8085 won't be slowed down while calculating neighbors

cls

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

cc = 0
' row counter
rc = 0

for i = 0 TO grid-1
	if ngen(i) = 0 then print " "; else print "@";
	if ((i+1) mod cols) = 0 then print ""

	cgen(i) = ngen(i)
next i

' find neighbors
for i = 0 to grid-1
	print @280, "...";

	' neighbors
	ngb = 0
	' calculated index
	ind = 0

	ind = i - cols
	if (rc = 0) then ind = ind + grid
	ngb = ngb + cgen(ind)
	
	ind = (i - cols) + 1
	if (rc = 0) then ind = ind + grid
	if (cc = cols-1) then  ind = ind - cols
	ngb = ngb + cgen(ind)

	ind = (i - cols) - 1
	if (rc = 0) then ind = ind + grid
	if (cc = 0) then ind = ind + cols
	ngb = ngb + cgen(ind)

	ind = i + cols
	if (rc = (rows - 1)) then	ind = ind - grid
	ngb = ngb + cgen(ind)

	ind = (i + cols) + 1
	if (rc = (rows - 1)) then	ind = ind - grid
	if (cc = (cols - 1)) then	ind = ind - cols
	ngb = ngb + cgen(ind)

	ind = (i + cols) - 1
	if (rc = (rows - 1)) then	ind = ind - grid
	if (cc = 0) then ind = ind + cols
	ngb = ngb + cgen(ind)

	ind = i + 1
	if (cc = (cols - 1)) then ind = ind - cols
	ngb = ngb + cgen(ind)

	ind = i - 1
	if (cc = 0) then ind = ind + cols
	ngb = ngb + cgen(ind)

	' gam of life rules
	if ngb < 2 then ngen(i) = 0
	if ngb > 3 then ngen(i) = 0
	if ngen(i) = 0 and ngb = 3 then ngen(i) = 1

	cc = (cc + 1) mod cols
	if ((i + 1) mod cols) = 0 then rc = rc + 1
next i

goto label_main_loop
