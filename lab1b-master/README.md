# Lab 1b: Decrypting a String

## Preparation

You find your individual assembler file [here](http://www.sm.luth.se/csee/courses/smd/D0013E/labs/lab1b_sources/) 
(i.e., the file with the number matching the number you will generate). Download 
the .s file into the folder lab1b and modify the Makefile (set the FILE 
variable to the name of your .s file).

To generate your code got to lab1b, open a terminal and run:

```shell
> bash generate
```

If the command fails, try

```shell
> bash generate_wsl
```

(The `bash` shell binary can be stored on various/multiple locations, `generate` assumes `/bin/bash`, `generate_wsl` assumes `/usr/bin/bash`, that's all.)

It will now ask for your username write your ideal. For example karkar-0.

Now you will get 3 digits. They represents what file you will use in the lab.

## Assignment

In this lab you will get a crash course in assembler programming for the MIPS 
architecture. You will implement a recursive function and learn how to manage 
the stack, pass parameters, write control statements (if/while constructs), 
and perform computer arithmetics (signed/unsigned) and logical operations 
(and/or/xor, etc.).



In the user-specific assembler file, you will find:

- An array of 32-bit words (named "coded") containing an encrypted string of characters.
- Pseudo-code for a subroutine `codgen` which generates a sequence of words that, when fed the correct `seed` (or start value), is used to decrypt the string.
- The correct seed for decrypting the string (and debugging `decode`).
- A test seed value that will produce a known sequence of return values from `codgen`. You will use this to debug your `codgen` implementation.
- Pseudo-code for the `decode` function, a recursive function that can decode the string (given a correct implementation of `codgen`).

Your task is to decode the string `coded` and store the result in a byte array called "plain". Modify the assembler file by adding your code to it according 
to the instructions in the file. Leave all the original pseudocode in the file, since it will help the review process. We've also included the sample return 
value of `codgen` given a test seed, this seed value can be used to ensure that `codgen` works properly.

Since decoding the entire coded string can take a lot of time, a shorter string
`abc` is supplied to make your life easier. Note that when decoding the `abc` and 
`coded` strings you should use the original seed value (not the test `seed`).

Note:

- You are working with BOTH signed and unsigned integers (choose your compare instructions correctly) but don't worry about overflows (we work with wrapping/modular arithmetics, choose your arithmetic instructions accordingly). There are no "MULTIPLY" or "DIVIDE" instructions in the MIPS model, maybe you can use shifts instead?
- You may implement local variables in registers for the subroutine `codgen`, but you MUST implement ALL local variables for the subroutine `decode` on the stack, not in the registers (as a practice for the final exam). This lets you practice `$fp`-negative stack accesses. Draw a stack diagram for both subroutines, as in the "sum with framepointer" example in "MIPS Programming".
- You MUST use the frame pointer for both your subroutines. Respect the D0013E calling convention (see "MIPS Programming"). This includes the requirement that any procedure must leave the registers (except `$ax`, `$tx`, `$vx`, `$ra`) intact when it returns.
- Comments in your assembler code should explain what you are doing, and why, at a higher level than the instructions themselves. The following comments are worthless:

```
        .text       # set the assembler to ".text" mode
        j  main     # jump to program label "main"
sum:    jr $ra      # jump-register through register $ra
main:   li  $a0, 5  # load-immediate constant "5" into register $a0
        bal sum     # branch-and-link to label "sum"
```

Here's a hint that some of you might find helpful, from "The C Programming Language" (Kernighan/Ritchie), Exercise 2-9:

*"In a two's complement number system, x &= (x-1) deletes the rightmost 1-bit in x."*

You may use this observation.

Hints:

- First study the `codgen` procedure. It *mutates* the `seed` value stored on the (global) heap. Make sure you understand what the code is supposed to do. 

- Translate the `codgen` procedure to MIPS assembly by following the "Mips Programming" guidelines, don't try optimize the code (you may do that later if you want when you got it to work). You may not assume that the address of `seed` is stored in any register, you must access `seed` through the `label`.

- Try your `codgen` implementation by applying the test `seed`, invoke `codgen` once and check the result against the assumed value. Debug your `codgen` until you get the right result. Now, proceed to check if the second of two calls to `codgen` produces the correct value. Fix bug if any, and check result for three successive calls, etc.

- At this point, you can now look at `decode`, first make sure you understand the pseudocode, then implement it and debug it using the `abc` string.

