# Digital Logic Final Project
## Simple Processor

The task of this project was to create a simple processor in verilog, eventually putting it on the FPGA board. We currently have eight registers, each of 16 bits. 

## Functions Implemented

We implemented nine functions so far: Load, move, add, subtract, XOR, OR, AND, divide, and remainder. 

Load: This loads a number into the register selected.

Move: This moves a number in register y, Ry, to register x, Rx.

Add: This adds two binary numbers together saving in the first specified register.

Subtract: This subtracts two binary numbers saving in the first specified register.

XOR: This xor's two binary numbers saving in the first specified register.

OR: This or's two binary numbers saving in the first specified register.

AND: This AND's two binary numbers saving in the first specified register.

Divide: This divides two binary numbers saving in the first specified register.

Remainder: This determines the reaminder of two binary numbers saving in the first specified register.

# How it works

This processor takes in the function number, and the two inputs, Rx and Ry.


