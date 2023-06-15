# Lab 2: Pipelined MIPS

In this lab, you study the pipelined MIPS with and without interrupts (interaction with the environment, in this case user input). Pay attention to delay slots, why they occur, and how they affect the execution of the program.


## Setup

First, make sure that your code from lab 1b works. Run it in SyncSim `java -jar SyncSim.jar --mips`, and write down the number of cycles it takes to execute. Copy your file `lab1b.s` to the folder `lab2` and rename it to `lab2.s`.

There are two part in this lab.

For the first part, compile the code by executing `make pipe` in the Terminal (which will produce the memory file `mips_pipe_program.objdump`) and start SyncSim in the pipelined mode using the command `java -jar SyncSim.jar --mips-pipe`, or, for a more detailed view including the control path `java -jar SyncSim.jar --mips-pipe-c`.

For the second part, compile the code by executing make `pipe_ext` in the Terminal (which will produce the memory file `mips_ext_program.objdump`) and start SyncSim in the extended mode using the command `java -jar SyncSim.jar --mips-ext`.

---

## Part 1 – Pipelined MIPS

To run in the pipelined mode you should add some code to the main function so that it looks like this:
``` mips
    	.text
    	.set noreorder
main:	li	$s0, ...

    	bal	decode	# outer call to recursive "decode"
    	nop
end:	b	end	# infinite loop; plaintext now in "plain".
    	nop
```

Only the `nop` instructions should be added. Compile your program using `make pipe`.

In this lab, you may not use any *pseudo-instructions* that are expanded into more than one native MIPS instructions. For example: `LA` can be translated into a combination of `LUI/ORI`. You should compare the code in the file `lab2.s` to the code loaded by SyncSim and make necessary changes to your code. You should also ensure that you correctly treat "seed" as a global variable, i.e. that you make no assumptions about it being stored in some particular register before `codgen()` or `decode(...)` are invoked.

Execute the program in SyncSim (`java -jar SyncSim.jar --mips-pipe` or `java -jar SyncSim.jar --mips-pipe-c`). Does the program work? Does it reach the infinite loop in the end of the main function? How many characters are successfully decrypted? Try to locate where things first go wrong.

Modify your program to run in the pipelined mode. The changes must be small, local transformations, not a big sweeping rewrite. When possible, re-arrange the instructions; when not possible, add `NOP`. 

Hint: there are only two types of instructions that may cause trouble.

Once you got the program working (i.e. it properly decodes your string), record the number of cycles it takes to complete. Have you achieved an improvement compared to the no-pipe mode (`lab1b`)?

Add comments to your source code file with the following information:

How many cycles did `lab1b` take to execute, running in the no-pipe mode?
        
How many cycles did `lab2` take to execute without the interrupts and running in the pipeline mode? Compute the speed-up factor according to the following formula:

```
                                      (cycles in no-pipe mode)
                 SPEED-UP  =  4  *   --------------------------
                                     (cycles in pipelined mode)
```

Give at least 3 decimal places. If you didn't get a speed-up of exactly 4, explain why. We want to see explanations based on your specific code, not based on some general principles.

---

## Part 2 – Exposing your code to interrupts

For this part, your code in `lab2.s` will be combined with initialization code for interrupts in `init.s` and an interrupt handler routine in `int_handler.s`. 

The interrupt handler will be placed in a special memory segment `.ktext`, reserved for *kernel* code. The code in these two files is well-commented, and you should study it before proceeding. 

Two kinds of interrupts are enabled in the provided code: a
- timer interrupt (firing approximately every 1000 clock cycles) and an

- input interrupt, registered when you type something in an Input Window. 

An Input Window can be opened by right-clicking the IO component in SyncSim and choosing "New Input Window". Both interrupts are handled by the same kernel code. 

Important new MIPS instructions are `MTC0` (move a value from a main CPU register to a register in the co-processor), `MFC0` (move a value from a register in the co-processor to a register in the main processor), and `RFE` (return from exception).

Recompile your code using `make pipe_ext`. Start SyncSim in the extended mode (`java -jar SyncSim.jar --mips-ext`) and load the program `mips_ext_program.objdump`. Locate the interrupt routine in the code view and put a breakpoint there. Press "Play" and your program should break for each timer interrupt, approximately every 1000 cycles. 

IMPORTANT: If your code does not work (i.e. the string is not decoded), check your stack management.

Reload the program and set a breakpoint in the infinite loop in the main function. How many clock cycles did it take to complete the program?

Reload the program once again, set a breakpoint in the infinite loop in the main function and open an Input Window. Start the program and type in the Input Window while the program is running. How many clock cycles did it take to complete the program? You should also verify that your program has decoded the string properly.

Add comments to your source code file with the following information:
- How many cycles did lab 2 take to execute with timer interrupts, running in the extended mode? Explain the extra clock cycles.
- How many cycles did lab 2 take to execute with timer and input interrupts, running in the extended mode? Explain the extra clock cycles.
- Make sure your code builds, and that comments/answers are clear and easy to review.