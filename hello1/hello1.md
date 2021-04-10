# Hello World (1)

This little snippet displays "Hello World!".  
A mandotory program when learning programming or a new language.  

## The entire program

    10 REM Hello World
    20 REM
    30 REM by Gwen De Brul
    40 REM
    50 SCREEN 0
    60 ST=49152
    70 L=&H1B
    80 FOR I=0 TO L
    90 READ A$
    110 POKE ST+I,VAL("&H"+A$)
    120 NEXT I
    130 DEF USR=&HC000
    140 X=USR0(0)
    150 data 21,0F,C0
    160 data 7E			
    170 data FE,00		
    180 data 28,06		
    190 data CD,A2,00	
    200 data 23			
    210 data 18,F5		
    220 data C9 			


    230 REM db MESG "Hello World!",0
    240 REM DEC data 72,101,108,108,111,32,87,111,114,108,100,33,00
    250 data 48,65,6c,6c,6f,20,57,6f,72,6c,64,21,00

## Assembly

                ld hl, MESG
        loop:   ld a, (hl)
                cp 0x00
                jr z, end
                call 0x00A2     :' CHPUT BIOS CALL
                inc hl
                jr loop
        end:    ret
## Short explanation

Line 10 - 140 contains the BASIC loader to put the Machine Language code into memory &hC000

line 230 - 250 contains the actual string which has to be shown. Line 240 contains the decimal codes for each character. This line is not used it's only there for reference. Line 250 contains the hexadecimal code for each character.  

We begin to load the string into register HL, this has to be an absolute address to point to the byte before the beginning of the string.  

On line 160 we begin the loop by loading the value of HL into the A register, this is needed to do a check if the value of HL is 0 which is the end of the string.  

On line 170 is the actual testing and when the value is 0 then jump to the end of the program (line 220).  

When doing jumps it's actually the byte before the actual position you will have to jump to.  

The jump made on line 180 is a relative jump. This means you can jump forward 128 bytes or backwards 128 bytes.  
If you want to jump backwards you have to count the number of bytes you want to go to -1 (see explanation before). This value you subtract of 256 and then you got the correct jump value.  

Line 190 calls the BIOS routine CHPUT which puts a character in register HL to the screen.  

Now we increment the register HL (not the value but the address it points to) to contain the next character of the string.  

On line 210 make a relative jump back to the loop label (beginning of the loop). Again the value is the number of bytes back +1, and subtract this from 256 to get the correct jump.

The last line (220) finishes the program and return to BASIC.  

## Summary

With 15 bytes of code (the string is not included) you can write a Hello World example in Assembly and Machine Language.  

The reason I do this with a BASIC loader is that you don't need extra software to run Machine Language code.  
This is obviously more work because you have to calculate the jumps and string locations. Everytime you adjust the code you have to check if the jumps and other references to addresses are still correct.  
The last drawback of doing it this way is you don't get error messages like you would when compiling code, so a lot more of difficult debugging.
