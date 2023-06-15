# Lab 3a: User code and a kernel

In this lab you will study the interaction between user code and a kernel (a minimal operating system). Typically, user code can perform computations, read from and write to data memory, but it has to rely on the kernel to perform output or take care of input. You will implement system call functionality in the kernel and use it to print characters to an Output Window.

You can compile your program by running `make` in the Terminal and start SyncSim in the extended mode using the command `java -jar SyncSim.jar --mips-ext`. You can open an Output Window by right-clicking the I/O component in SyncSim and choosing "New Output Window".

---

## General info

Most software systems consist of one or more user processes and a kernel, or an operating system. The kernel switches between user processes (to accomplish multitasking), handles exceptions and controls interaction with the environment. If CPU hardware detects an exception (a software interrupt, such as overflow when executing SUB) or an external hardware interrupt (for example, from a timer or standard input), the current user process is interrupted and the program counter is set to the start of the kernel instruction space (`.ktext`). The kernel can also be invoked by a user process by executing a special instruction `SYSCALL`.

One of the services offered by the kernel to user processes is printing to stdout (in our model – to an Output Window). To invoke printing, a user process must specify the argument(s) in the `$a`-registers and write the service-specific code (`0x102` for "output") into the register `$v0`, before executing `SYSCALL`. When invoked, the kernel should preserve all the registers except `$k0` and `$k1`, which are reserved for the kernel. In MIPS, there is a special co-processor `CP0` with 11 registers that relate to exception processing. The kernel can examine these registers to determine the cause of an exception and the state of the main CPU at the time of exception. We will use three registers in `CP0`:

- `$12` is the Status Register (SR). Bits [15:10] are used to disable/enable extrnal interrupts Int5...Int0, bit 1 is used to switch between kernel mode (status[1]=0) and user mode (status[1]=1), and bit 0 is used to enable/disable all interrupts.
- `$13` is the Exception Cause Register (ECR). Bits [5:2] contain the exception code and bits [15:10] are set if the external interrupts Int5...Int0 are pending.
- `$14` is the Exception Program Counter (EPC). The value of the Program Counter is saved to this register before an exception is taken.

These registers are only accessible in kernel mode and special ("privileged") instructions are used to move date between them and the registers in the main CPU:

-   `MTC0 <cpu register>, <cp0 register>`: move data to CP0
-   `MFC0 <cpu register>, <cp0 register>`: move data from CP0; the data is available after a delay of one clock cycle
-   `RFE`: return from exception: popping the previous operation mode from the mode stack, typically restoring it to user mode (unless the kernel is written in a re-entrant fashion)

The processor always starts in kernel mode (on a reset/cold start) and it is set to kernel mode automatically when an exception is taken or an external interrupt occurs. SyncSim `mips-ext` implements `CP0` to mimic this behavior.

Our `mips-ext` model also includes a hardware timer and I/O registers for input and output. These are memory-mapped (i.e. assigned memory addresses) in the kernel space and are only accessible in kernel mode.

---

## Assignment

1. The initialization code in `lab3.s` is identical to the one you saw in lab 2. For `lab3a`, change the initialization code to disable interrupts: write `0x0003` instead of `0x0C03` to the Status Register (register `$12` of the co-processor `CP0`).

2. Implement the first user process (proc1). It should read the byte stored at `0($gp)`, print it, and increment the byte at `0($gp)` to the next character (use ASCII code: 'A' = 65, 'B' = 66, ..., 'Z' = 90). After printing 'Z', this process should start over again with 'A', in an endless loop. Notice, the symbol `glob1` may not be used in the user code. Instead, before entering proc1, `$gp` is set to point the heap memory area for the process proc1, allowing accesses to global variables to use `$gp` relative addressing. (Later in lab3b, you will implement multi tasking, where each process has its own heap area.)

    Since a user process may not access memory-mapped I/O, to print a character you should:

   - setup the argument: write the character to the least significant byte of `$a0`;
   
   - specify the kernel service "output": write the value `0x102` to `$v0`;

   - invoke the kernel by executing the MIPS instruction `SYSCALL`; SYSCALL may NOT be executed in a branch delay slot.

1. Implement a simple exception handler in the kernel instruction space (`.ktext`). You should:

   - check that the exception code in the bits [5:2] of the Exception Cause Register (register `$13` of the co-processor `CP0`) is 8 (`SYSCALL`);

   - check that the service requested by the application is "output" (i.e. that `0x102` has been written to `$v0`);

   - write the character from `$a0` to the address `0xFFFF0000` (base address for the IO component) with offset `+8`;

   - load the exception address from the Exception Program Counter (register `$14` of the co-processor `CP0`) to one of the registers reserved for the kernel, `$k0` or `$k1`, and jump back to that address + 4. `EPC` itself will point to the `SYSCALL` instruction, so you need to jump to the next instruction;
        
   - execute the MIPS instruction `RFE` (return from exception) to switch from kernel mode to user mode, this is best done in the jump delay slot.

    If the exception code is not `SYSCALL`, you should branch to an infinite loop in the kernel code (`kernel_loop`). If the service requested by the application is not "output", you should return control to the user process. (You can test these requirements, by some code in proc1; that a) generates an overflow, and b) sets an erroneous service code. Once you have tested these cases separately, comment out the test code but leave it in your repo for later review. We don't have a proper unit testing framework, so this is a best effort work-around.)

    Notice, make sure that all registers besides `$k0` and `$k1` are either untouched or restored when the user process is is resumed. Hint, use only the registers `$k0` and `$k1` in your kernel code.


1. Test your implementation: open a new Output Window and run the program. It should print letters from 'A' to 'Z' in an endless loop.

Don't forget to add clear high-level comments to your code.