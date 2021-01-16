# Machine language loader

This bit of **MSX** **BASIC** code loads the specified opcodes in the data lines portion to memory.
The benefit of coding this way (with the machine language program on the data lines) is that you don't need any special assembler program on your MSX.
The downside is that you have to calculate the jump locations everytime you change code, but to eliminate this downside i'm making an assembler which run on your nowadays computer and you only have to type the generated file into your **MSX** (or use openMSX emulator).

## Code

    10 REM ML Loader
    20 REM
    30 REM by Gwen De Brul
    40 REM
    50 SCREEN 0
    60 ST=49152 ' This is the address where the ML program should be loaded in memory
    70 L=&H1B   ' this is the number of bytes the program is in size (-1)
    80 FOR I=0 TO L
    90 READ A$
    110 POKE ST+I,VAL("&H"+A$)
    120 NEXT I
    130 DEF USR=&HC000
    140 USR0(0)

## Changes you should make

line 60 should be filled with the start address on which you want your program to be.
I choose 49152 (&HC000) this is page 3 of memory. 
There's also system variables and basic variables like strings etc in this page of memory.
You have about 5K of ram out of the 16K page.
You can put the program on page 2 or 1 of system memory, but then you lose the **BASIC** functions.

line 70 contains the length of the machine language program (opcodes) as read from the DATA lines.
Don't forget to subtract 1 of the counted bytes (because the computer starts counting from 0)

line 130 must contain the location in RAM where your program is loaded (same as line 60).

The other lines should niot be altered whatsoever.
