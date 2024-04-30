label_init print "hello world"
input "what's my name again"; n$
if n$ = "simone" then goto label_end
goto label_init
label_end print "right!"
end