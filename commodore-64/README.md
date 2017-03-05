# Keepin' up with the C64

A Commodore 64 bought in a thrift shop along with a 1530 Datassette

![Commodore 64](https://i.imgur.com/OMotnx7.jpg)

after a few weeks trying to make it work with modern TVs I finally succeeded making it run games and programs written in BASIC.

## BOOMBAS

This is my very first game in BASIC language. The purpose of the game is to collect the dollar signs avoiding the bouncing ball on the screen and the spiky hash signs spawned randomly.

The version uploaded on GitHub can easily be imported in [VICE emulator](http://vice-emu.sourceforge.net/) and works with the following key combination:

|command|direction|
|---|---|
|1|left|
|2|down|
|9|right|
|8|up|
|5|quit|

This key combination was heavily improvised due to the fact that the original program works with a joystick thus PEEKing from the memory address 56320.
If you want to use joysticks you should replace the line 180 like the following code and chaning the if statements with the values of the memory address according to the slot number.

```
180 A = PEEK(56320)  
```

Here's a short demo on VICE:

[![BOOMBAS](https://thumbs.gfycat.com/BraveCelebratedAfricanrockpython-size_restricted.gif)](https://gfycat.com/BraveCelebratedAfricanrockpython)
