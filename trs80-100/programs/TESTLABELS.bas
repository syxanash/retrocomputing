labelInit print "hello world"
input "what's my name again"; n$
if n$ = "simone" then goto labelEnd
goto labelInit
labelEnd print "right!"
end