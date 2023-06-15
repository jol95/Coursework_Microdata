# Lab 0a: Introduction to MIPS
## Preparation

- Start by studing the [SyncSim page](https://vesuvio-git.neteq.ltu.se/d0013e-microcomputer-engineering/info/-/wikis/The-SyncSim-simulator).        Download SyncSim.
- Test compilation of the example program lab0a.s.
- Study the example program, consult the [MIPS opcodes page](https://vesuvio-git.neteq.ltu.se/d0013e-microcomputer-engineering/info/-/wikis/MIPS/MIPS%20opcodes).
- Start SyncSim and open the compiled program (mips_program.objdump). Open Code View to see which instruction is being executed, open Data View to inspect the contents of the data memory (Go to... .data), open the register file. To do so, double-click the respective components.
- Single-step the program in SyncSim and trace each instruction from program counter, to instruction memory, ALU, data memory, register file, etc. If you are unsure how to do it, ask a lab supervisor.

You should be able to: compile a program, load it to SyncSim, trace instructions; for each instruction, you should be able to explain (roughly) what is does and which CPU components are involved in executing it.

## Laboration

Fork this repsoitory (press fork). Then git clone/pull the fork. You should replace ... in lab0a.s with MIPS instructions and register names, according to the specification in the comments (you may also need to add completely new lines with instructions). Use the [MIPS programming](https://vesuvio-git.neteq.ltu.se/d0013e-microcomputer-engineering/info/-/wikis/MIPS/MIPS%20Programming), [MIPS opcodes](https://vesuvio-git.neteq.ltu.se/d0013e-microcomputer-engineering/info/-/wikis/MIPS/MIPS%20opcodes), and  [MIPS registers](https://vesuvio-git.neteq.ltu.se/d0013e-microcomputer-engineering/info/-/wikis/MIPS/MIPS%20registers) for reference. Do one assignment at a time and test your solutions in SyncSim.

Hint 1: Before writing to an address in data memory (or reading from it), we need to place the BASE ADDRESS into some register. If this address is labelled (e.g. res_heap), you can use a special MIPS instruction to do so (check the MIPS opcodes page on the left). You can find the labels defined for data memory by looking at the .data section of the program (at he end of the lab0a.s file).

Hint 2: For bitmasking, see this [Wikipedia article](http://en.wikipedia.org/wiki/Mask_(computing)).
