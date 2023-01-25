// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(WAIT)
    @KBD
    D = M
    @WHITE
    D;JEQ
    @BLACK
    0;JMP


(WHITE)
    @SCREEN
    D = A
    @addr
    M = D
    
    @8191
    D = A
    @n
    M = D // n = 256

    @i
    M = 0 // i = 0

    (LOOP1)
        @i
        D = M
        @n
        D = D-M
        @WAIT
        D;JGT

        @addr
        A = M
        M=0

        @i
        M=M+1
        @32
        D=1
        @addr
        M=D+M
        @LOOP1
        0;JMP


(BLACK)
    @SCREEN
    D = A
    @addr
    M = D
    
    @8191
    D = A
    @n
    M = D // n = 256

    @i
    M = 0 // i = 0

    (LOOP2)
        @i
        D = M
        @n
        D = D-M
        @WAIT
        D;JGT

        @addr
        A = M
        M=-1

        @i
        M=M+1
        @32
        D=1
        @addr
        M=D+M
        @LOOP2
        0;JMP
