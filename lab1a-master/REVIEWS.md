# Reviews for lab1a

0 You did not push your files.

1 You did not follow the lab instructions regarding Project Visibility. You should make it public. (OBS We have updated the instructions for this in the labs)

2 You did not follow the instructions from lab0b.s.
```
# Assignment: extend this program to reverse the string "intext"
# and write the result to "outtext".

...

.align 4
outtext:        .string "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

This implies that the resulting string should be readable from the label "outtext", starting from the first byte.

3 Your string is not zero terminated (zero termination is typically used to indicate that the string has come to an end. See lab0b, where the trailing zero is explicitly written.

4 Your stack frame illustration should indicate the use for each location (e.g., "write pointer").

5 Your program should reach an infinite loop when it has finnished it's task by looping back to stop. (In case you have deliberately caused an exception to abort execution/simulation. This is not the preferred way to end a program.)

6 Your repository should follow the structure of the original lab. (This may become crucial to CI and other automatic code management.)

7 Your code does not build.

8 Your code does not follow the lab instructions, you should use frame pointer, stack pointer and return address. Check out [sum_fp.s](sum_fp/sum_fp.s).

9 You changed parts of the lab file that you should not have changed.
