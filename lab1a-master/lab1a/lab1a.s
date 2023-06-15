# Assignment: extend this program to reverse the string "intext"
# and write the result to "outtext".	

            .text
            .set noreorder
main:       la    $t1, intext	# t1 points to start of intext
            la    $t2, outtext	# t2 points to start of outtext
		
            li    $t0, 0		# t0 used to count characers
            li    $t4, 0		# output the outtext

seek_end:	lb    $t3, 0($t1)	# read character
            beq   $t3, 0, seek_end1 # check if 0 (end of string) || beq: branch if contents rs == rt
            addiu $t0, $t0, 1   # counting chars
            addiu $t1, $t1, 1   # increments intext
            b     seek_end      # b: unconditional branch

seek_end1:  addu  $t2, $t2, $t0	# t2 points to end of outtext
            sb    $t3, 0($t2)	# write 0 to terminate string || sb: store byte
            la    $t1, intext	# t1 points to start of intext

copy:       addiu $t2, $t2, -1  # traverse outtext backwards
            addu   $a0, $a0, $t0 # counting chars as arg0
            add   $a1, $a1, $t1 # intext as arg1
            add   $a2, $a2, $t2 # outtext as arg2

rev:   addiu $sp, $sp, -4
       sw    $31, 0($sp)	# push the return addr
       addiu $sp, $sp, -4
       sw    $fp, 0($sp)	# push the old frame pointer
       move  $fp, $sp		# establish new frame pointer.
       addiu $sp, $sp, -12	# make room for 3 full 

   #    +-------------------+
   #    | uninit, for "outtext ad"   | -12($fp) <= $sp points here  
   #    +-------------------+
   #    | uninit, for "intext ad"   |  -8($fp) <= $sp points here
   #    +-------------------+
   #    | uninit, for "charcount"   |  -4($fp)
   #    +-------------------+
   #    | old frame pointer |           0($fp) <= $fp points here
   #    +-------------------+
   #    |  our return addr  |           4($fp)
   #  --+-------------------+-- 
   #    |                   |
   #    |  caller's stack   |
   #    |                   |


save:  sw    $a0, -4($fp)	    # save "charcount" into local var
       sw    $a1, -8($fp)	    # save "intext address" into local var
       sw    $a2, -12($fp)	    # save "outtext address" into local var
     
if:    # ori   $t0, $zero, 1	    # $t0 := 1
       bne   $a0, $zero,  else	# n  1, jump to "else" (a0 fixes the bitshift problem???)

     
then:  # ori   $v0, $zero, 1	# n = 1:  return value := 1,
       b     exit		    # escape to exit sequence.
     
else:  addiu $a0, $a0, -1   # decreasing character counter for loop stop
       addiu $a1, $a1, 1    # incrementing intext 
       addiu $a2, $a2, -1   # decremneting outtext

       bal   rev            # bal instead of b to link return register (31)?
       
       lw $t2, -12($fp)     # outtext
       lw $t1, -8($fp)      # intext
       lb $t4, 0($t1)       # load byte
       sb $t4, 0($t2)       # store into out
     
exit:  move  $sp, $fp		# all local var's gone: easy !
       lw    $fp, 0($sp)	# restore old $fp
       addiu $sp, $sp, 4	# and pop that word,
       lw    $31, 0($sp)	# restore return address,
       addiu $sp, $sp, 4	# and pop that word.
       jr    $31			# return

stop:	b     stop          # I cannot for the life of me figure out how to stop the program
       .data               # no matter what i do something breaks, even trying to move it

intext:		.string "!dlroW olleH"
            .align 4

outtext:	.string "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

