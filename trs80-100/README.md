# TRS-80 Model 100

![trs80](images/trs80model100.jpg)

## Experiments

Here you can find a Game of Life algorithm I wrote for TRS-80 model 100.

The file `GOLT.bas` is a transpiled version of a simplified basic program `GOL.bas` which runs Game of Life with a spinning loader at the corner of the screen.

![GOLT.bas video](images/GOL.mp4)

The program `GOLLOADERT.bas` instead is the transpiled version of `GOLLOADER.bas` which does the same thing but it also shows a loading bar at the bottom of the screen.

![GOLLOADERT.bas video](images/GOLLOADER.mp4)

The transpiler written in Ruby is called `baspiler.rb` (BAsic tranSPILER 👀).
`Neighbours.java` instead is the algorithm I sketched before starting to write the actual code in BASIC.