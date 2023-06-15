       .text
       .set noreorder

# the main program: 
 
main:  li  $a0, 5            # set up parameter := 5
       bal sum               # call:  sum( 5 )
	                         # result in $v0
stop:  b stop

#  compute  sum = n + (n-1)+(n-2)+...+ 1
#  call only for n  0.

# sum( n: int ): int       (direct-recursive)
#   if n = 1
#     then return( 1 )
#     else return( n + sum(n-1) );
     
sum:   addiu $sp, $sp, -4	# push the return addr...
       sw    $31, 0($sp)	# ...onto the stack.
     
       addiu $sp, $sp, -4   # now push the incoming...
       sw    $a0, 0($sp)	# ...param "n"
     
if:    ori   $t0, $zero,  1	 # $t0 := 1
       bne   $a0, $t0,  else # n  1, branch to "else"
     
then:  ori   $v0, $zero,  1	# return value := 1,
       b     exit	     	# to exit sequence.
     
else:  addiu $a0, $a0, -1	# compute n-1 (destroys $a0).
       bal   sum	       	# $v0 := sum( n-1 ).
			               	# call also wipes out our $31.
     
       lw    $t0, 0($sp)	# fetch our incoming value "n".
       addu  $v0, $v0, $t0	# $v0 := n + sum( n-1 ).
     
exit:  lw    $31, 4($sp)	# restore return address.
       addiu $sp, $sp, 8	# stack like we found it.
       jr    $31	       	# return