# Lab 4: From C code to assembly

In this lab you will re-write your program from lab 2 (decoding a string) in the C programming language and study how C code is compiled into assembly code, with different optimization settings.

You should start by studying this [C language tutorial](https://www.cprogramming.com/tutorial/c-tutorial.html). Since you already have a basic understanding of how to program, the most important thing to focus on is the syntax of the language. This is covered mostly in the sections "Introduction and Basic C Features" and "Pointers, Arrays and Strings" in the link.

For a primer on bitwise operations, take a look at this [link](https://en.wikipedia.org/wiki/Bitwise_operations_in_C).

As usual you may exchange questions and information using the discord channel.

---

## Assignment

1. Implementing the decoding algorithm from lab 1b in C.

   For this part, place all files in the `hosted` folder, as you will first implement your lab under a hosted environment (Linux in our case).

   Create a new file `lab4.c`. Define the decoded string as a global array of char's and the coded string as a global array of unsigned int's:

   ```c
        char plain[132];
        unsigned int coded[] = { /* your lab1b coded words here */ };
        unsigned int abc[] = { /* your lab1b abc words here */ };
    
        unsigned int seed = /* your seed value here */;
   ```

   I.e., you need to copy the arrays words (`coded`/`abc`) from your lab 2 code into the C arrays `coded`/`abc`, and set the `seed` according to your lab.

   You should implement three functions:

   - `unsigned int codgen(unsigned int *seed_addr)`: this function should take an address to seed as an argument;

   - `unsigned int decode(unsigned int *wordarr, char *bytearr, unsigned int *seed_addr)`: this function should take addresses to `wordarr`, `bytearr`, and `seed` as arguments;

   - `int main(void)`: this is the main function, the entry point of the program. The main function should initialize seed as a local variable and invoke `decode(coded, plain, &seed)`.

   To test your implementation, include the header file `stdio.h` and add a print-out using `printf()` at the end of the main function. Compile your program using gcc (`gcc -o lab4 lab4.c`) and execute it (`./lab4`).

   It is recommended to first make sure that `codgen` generates the seed values properly (use the "test" seed). Then test that the recursion is properly working using `abc`, and finally verify that the `coded` string is correctly decrypted.

   Notice, your `lab4.c` file and generated executable should be in the `hosted` folder of this repository.

2. Compiling for MIPS.

   Copy your `lab4.c` file to the lab4 folder and make the following changes:

   - remove include and print-out;

   - add an infinite loop at the end of the main function.

   - add the following attribute to all global variables:

   ```c
        char plain[132] __attribute__((section(".data")));
        unsigned int coded[] __attribute__((section(".data"))) = {...};
   ```

   Notes:
   - (1) unless you include this attribute, global variables can be placed by the compiler in memory segments `.bss`, `.sbss` or `.scommon`;

   - (2) the compiler may re-arrange the order of global variables in memory.

   Compile your code for MIPS by running make. Execute the code in SyncSim in the pipelined mode (`java -jar SyncSim.jar --mips-pipe`). Make sure that the string is properly decoded.


3. Compare your implementation for decode() and codgen() from lab 2 with the assembly code produced by the C compiler 
(the assembly code can be found in lab4_0.s). 

Are there any differences in the calling convention, the usage of stack/frame pointer, etc.?
   - calling convention is different, it uses register numbers istead of names
   - a lot of nops
   - memory allocation is different, instead of having the stack above the heap, it has the heap at the top
     it also seems to save arguments to the stack
   - a lot of room on the stack
How many clock cycles does each (lab2 vs lab4) program take to execute?
   - lab2; 20504
   - lab4; 70902


4. Enable compiler optimizations by running make OPT=X, where X=1,2,3. This will produce assembly files lab4_X.s and memory files 
mips_program_X.objdump. See this document for the list of features enabled at different optimization levels.

Is the string properly decoded?
   - yes
How many clock cycles does each program (lab4_X.s) take to execute?
   - lab2; 20504
   
   - lab4_0.s; 70902
   - lab4_1.s: 16014
   - lab4_2.s: 15196
   - lab4_3.s: 15519
What are the main differences in the generated assembly code (between lab 2, and each lab4_X.s)?
   - the main difference from the generated assembly code and the one I wrote is that the generated isn't as
	 top down readibly written, and doesn't use the semantics and logic as I did.
   - the optimization from lab4_0 - lab4_2 just reduces nops, manages the pointers differently and further reduces
     operations such as loads in codegen
   - the lab4_3 optimization adds a lot of additional instructions. It seems it tries to optmize the code in a way
     by adding instructions where it deemed it uneccessary to repeat code. But it takes even more iterations than
	 the OPT=2 so I'm a bit unsure as to what the logic is. It might be more effiecent in some way I don't understand


5. Include in your Git submission all compiled `.objdump` memory files and the `hosted/lab4.s` as well.

*Hint*: consider how registers and stack are used (load and store of local variables); if the frame pointer is used and how does an activation frame look like; are procedures inlined; and what about load and branch delay slots / instruction re-ordering?

Your C code needs to be properly documented for the reviewer to follow. When answering assignments 4.3 and 4.4, you may refer to the source code, and make comments in the source code regarding the effect of optimizations. In any case your presentation should be easy to follow for the reviewer, showing that you have a good understanding how optimization affects the code generation. You may include snippets of generated code for clarification, either as part of this document, or using links to the generated code. If referring to generated code, make sure that is part of the repository. See example link below:

[Example link](./lab4/linker_script#L26-29)
