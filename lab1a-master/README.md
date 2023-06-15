# Lab1a Using a frame pointer

## Reviews now available

Click here [REVIEWS.md](REVIEWS.md).

## Preparation
   
Read the page on [MIPS programming](https://vesuvio-git.neteq.ltu.se/d0013e-microcomputer-engineering/info/-/wikis/MIPS/MIPS%20Programming), (or in pdf version if you want to print it out [MIPS_Programming.pdf](http://www.sm.luth.se/csee/courses/smd/D0013E/download/MIPS_Programming.pdf))

Study the <strong>D0013E calling convention</strong>.

- Compile and run the `sum` program (included in this repo).

Study the program code and follow its execution in SyncSim. Use single-stepping and breakpoints  to follow how the stack grows towards lower addresses during the calls and how it shrinks back again on returns. The `$sp` register points to the current stack position. You may also look in the data memory to see where variables are stored on the stack.

- Compile and run the `sum_fp` program (included in this repo).
  
Study the program code and follow its execution in SyncSim. Use single-stepping and breakpoints  to follow how the stack grows towards lower addresses during the calls and how it shrinks back again on returns. It is recommended that you draw diagrams with stack and frame pointers that reflect the state of the data memory at different stages of program execution. The `$fp` register points to the current stack frame.
    
    
## Assignment
    
In this lab, you should modify your `lab0b` (string reversal) so that it uses the  recursive subroutine "rev".
    
- The subroutine should take three arguments: the address of the first character to copy, the destination address for that character, 
and the number of characters  to copy.

- The base case of the recursion is when the number of characters to copy is zero, in which case the subroutine should return immediately.

- Note that "rev" does not return any value, it only performs operations on data memory.

- Add your diagram with stack and frame pointers as a comment to your code. It helps your reviewer and us when assessing your solution.
    
    
Copy the folder `lab0b` to this repo under `lab1a`. Change the name of the file `lab0b.s` to `lab1a.s` and update the `Makefile` accordingly. Then implement the subroutine "rev" <strong>using a frame pointer</strong>. Respect the D0013E calling convention (see "MIPS Programming") and don't forget to test your program in SyncSim.
    
**Before writing the code, make sure that you understood the frame pointer concept! We reject wrong solutions and you must resubmit correct code. If you are unsure, draw a diagram with stack and frame pointers for the subroutine "rev" (see MIPS Programming).** 
