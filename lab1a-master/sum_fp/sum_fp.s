       .text
       .set noreorder

# the main program: 
 
main:  li  $a0, 5           # set up parameter := 5
       bal sum              # call:  sum( 5 )
	                         # result in $v0
stop:  b stop

#  compute  sum = n + (n-1)+(n-2)+...+ 1
#  call only for n  0.

# sum( n: int ): int       (direct-recursive)
#   x: int;                (example of local variable)
#   if n = 1
#     then return( 1 )
#     else return( n + sum(n-1) );

sum:   addiu $sp, $sp, -4
       sw    $31, 0($sp)	# push the return addr
       addiu $sp, $sp, -4
       sw    $fp, 0($sp)	# push the old frame pointer
       move  $fp, $sp		# establish new frame pointer.
       addiu $sp, $sp, -8	# make room for 2 full
				# word local variables

   # everything above is called the "entry sequence".
   # the stack now looks like this.
   # YOU MUST SHOW US A DIAGRAM LIKE THIS, FOR ALL 
   # THE SUBROUTINES YOU WRITE IN YOUR FIRST LAB.
   #
   #    +-------------------+
   #    | uninit, for "x"   | -8($fp) <= $sp points here
   #    +-------------------+
   #    | uninit, for "n"   | -4($fp)
   #    +-------------------+
   #    | old frame pointer |  0($fp) <= $fp points here
   #    +-------------------+
   #    |  our return addr  |  4($fp)
   #  --+-------------------+--
   #    |                   |
   #    |  caller's stack   |
   #    |                   |
   #
   # (we don't need "x" below, just given as an example.)
   # now this activation can access its activation record
   # RELATIVE TO THE FRAME POINTER, like this:

save:  sw    $a0, -4($fp)	# save "n" into local var
     
if:    ori   $t0, $zero, 1	# $t0 := 1
       bne   $a0, $t0,  else	# n  1, jump to "else"
     
then:  ori   $v0, $zero, 1	# n = 1:  return value := 1,
       b     exit		# escape to exit sequence.
     
else:  addiu $a0, $a0, -1	# compute n-1 (destroys $a0).
       bal   sum		# $v0 := sum( n-1 ).
     
       lw    $t0, -4($fp)	# fetch value "n".
       addu  $v0, $v0, $t0	# $v0 := n + sum( n-1 ).
     
   # the exit sequence reverses the entry sequence:
     
exit:  move  $sp, $fp		# all local var's gone: easy !
       lw    $fp, 0($sp)	# restore old $fp
       addiu $sp, $sp, 4	# and pop that word,
       lw    $31, 0($sp)	# restore return address,
       addiu $sp, $sp, 4	# and pop that word.
       jr    $31			# return