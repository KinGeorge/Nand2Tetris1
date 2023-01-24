// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

    @R0
    D = M // D = R0
    @ZERO
    D;JEQ // if R0 == 0 goto ZERO

    @R1
    D = M // D = R1
    @ZERO
    D;JEQ // if R1 == 0 goto ZERO

    @i
    M = D // i = R[1], use R1 as iterator, add R1 R0s
    @sum
    M = 0 // sum = 0

(LOOP) 
    @i
    D = M
    @ASSIGN
    D;JEQ // if i = 0, goto END
    @R0
    D = M // D = R0
    @sum
    M = M + D // sum += R0
    @i
    M = M-1 // i -= 1
    @LOOP
    0;JMP // goto LOOP

(ASSIGN)
    @sum
    D = M // D = sum
    @R2
    M=D // R2 = sum
    @END
    0;JMP

(ZERO)
    @R2
    M = 0

(END)
    @END
    0;JMP