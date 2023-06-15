# ----------------------------------------------------------
#  Group 34's "underlag" for Lab 1
#  Pseudo-instructions may be used for Lab 1.
# ----------------------------------------------------------
 
 
 
# Group 34's Codeword Generator Subroutine (pseudocode)
#  (remember:  "seed" is a global variable, UNSIGNED INTEGER;
#              you may implement local variables in registers or on the stack;
#              result returned in v0; preserve all except t regs)
#
# FUNCTION codgen(): UNSIGNED INTEGER;
#  LOCAL SIGNED INTEGER   n;
#  LOCAL UNSIGNED INTEGER x, y;
#  BEGIN
#    n := [right-justify the five bits "seed"<31:27>, and zero-extend];
#   WHILE (n >= 0) LOOP
#    x := [multiply "seed" by the constant 8];
#    y := [divide "seed" (unsigned !) by the constant 8];
#    seed := x - y;  [ignore overflow condition]
#    n  :=  n - 1;
#   ENDLOOP;
#   RETURN( seed XOR 0x3c8c693b );
#  END;
# 
# hint:  if "seed" is initialized to 0x6e7af858,
#        the first five calls will generate these values:
#        0xd2135887, 0xe496ff44, 0x2ef9901b, 0x8b498e4f, 0x461cd8b1, ...
# your code is to be written farther down (see comment below).
 
 
# Group 34's Recursive Decoding Subroutine (pseudocode)
#  (for "decode", all four local variables must be implemented ON THE
#              STACK, and NOT in registers; implement the code literally,.
#              no optimizations.  We're trying to teach you something.
#   remember:  result returned in v0; preserve all except t regs)
#
# FUNCTION decode( wordarr, bytearr ): UNSIGNED INTEGER;
#    (wordarr, bytearr passed by reference)
#  LOCAL UNSIGNED INTEGER m, r, x, y;
#  BEGIN
#    x := ONE'S-COMPLEMENT of codgen();
#    IF ([contents of word at "wordarr"] = 0) THEN  
#      [byte pointed to by "bytearr"] := 0;
#      r := x;
#    ELSE
#      y := decode( wordarr+, bytearr+ );  # "k+" means "successor in k"
#      m := ( x + y ) XOR [contents of word at "wordarr"];
#      [byte pointed to by "bytearr"] := [the eight bits at "m"<30:23>];
#      r := TWO'S-COMPLEMENT OF codgen();
#      r := x + y + m + r + 5;
#    ENDIF;
#    RETURN( r );
#  END;
 
 
# ----------------------------------------------------------
# The following are the ONLY lines that may appear in the
# ".data" section of the code.  You may add NO other lines.
# NO additional global variables.
# ----------------------------------------------------------
 
 
	.data
plain:	.space	75		# room for 75 characters
 
	.align 4
seed:	.word    0			# 32-bit UNSIGNED INTEGER.
 
abc:	.word	0xf37bf755	# string "abc", encoded
	.word	0x096a937b
	.word	0x10ad04d8
	.word	    0
coded:	.word	0x46a695d7	# the real encoded data
	.word	0x195e7e5e
	.word	0x49ac331d
	.word	0x07b6216a
	.word	0x3caf8807
	.word	0x95a7669c
	.word	0x9005cad7
	.word	0x5945d28f
	.word	0x97c04427
	.word	0xee2452f3
	.word	0xe708b1a1
	.word	0x1b412da6
	.word	0xa4231bef
	.word	0xbf702355
	.word	0x5432b290
	.word	0xea53d602
	.word	0x3f4dc272
	.word	0xfc48f58d
	.word	0xe27e8357
	.word	0x9dab7d77
	.word	0x41ab240d
	.word	0x5ce4c1f3
	.word	0x08530383
	.word	0x4ab67a47
	.word	0xe68c4e3a
	.word	0xfb7ae1e4
	.word	0x9c29c1cf
	.word	0x4f31a24a
	.word	0x5e39d08b
	.word	0x697d7890
	.word	0xa4da4f88
	.word	0x969f1a94
	.word	0xa39eee10
	.word	0x032aed55
	.word	0x8616a3c4
	.word	0xefb5463a
	.word	0x294c3d69
	.word	0x1d82f932
	.word	0x90da5b72
	.word	0xefe41814
	.word	0x000e1b85
	.word	0x74c312a5
	.word	0x244e4a69
	.word	0x2fbf1e4a
	.word	0x63383b03
	.word	0x7bf50642
	.word	0x8c0373b9
	.word	0x1a1d9589
	.word	0x2e0809d5
	.word	0x3f951efe
	.word	0xa0914aa5
	.word	0x1ef530e7
	.word	0xadbb3406
	.word	0x730c64f8
	.word	0x0d93a218
	.word	0x137f7d7c
	.word	0x27edf79a
	.word	0x3502752d
	.word	0x9adcf6bd
	.word	0x9b53bf0b
	.word	0x2e25ea87
	.word	0x886dedfd
	.word	0xcbdc59fe
	.word	0x833e1140
	.word	0x78c309f1
	.word	0x571b7228
	.word	0x9d07ecd3
	.word	0x06aadb8c
	.word	0x24f39e23
	.word	0x1507f2bf
	.word	0x7ba90c99
	.word	0x49715f9b
	.word	0x4a759a81
	.word	0x43272643
	.word	    0
 
 
# ----------------------------------------------------------
# The following is the main program.  You may not change this.
# You may only add your subroutines AFTER the "infinite end loop" instruction here.
# You MUST have two subroutines named "codgen" and "decode".
# BOTH must adhere to our calling conventions; 
# both MUST preserve all registers except v-regs and t-regs;
# we are going to TEST for this when we run your code.
# ----------------------------------------------------------
 
 
	.text
	.set noreorder
main:	
	# initialize "seed"
	lui	$s0, 0x3179
	ori $s0, $s0, 0xc241
	lui	$s1, 0x0
	addiu $s1, $s1, 4176
	sw	$s0, 0($s1)
	# address of start of coded words
	lui	$a0, 0x0
	addiu $a0, $a0, 4196  # 4196
	# address of start of decoded bytes
	lui	$a1, 0x0
	addiu $a1, $a1, plain
	bal	   decode	# outer call to recursive "decode"
	nop

end:
	b       end             # infinite loop; plaintext now in "plain".
	nop               # syntax error = budget stop

 
# ----------------------------------------------------------
# Group 34's assembly code for Function CodGen :
# ----------------------------------------------------------

	# your activation record diagram here.

   #    +-------------------+
   #    | old frame pointer |  0($fp) <= $fp points here
   #    +-------------------+
   #    |  our return addr  |  4($fp)
   #  --+-------------------+--
   #    |                   |
   #    |  caller's stack   |
   #    |                   |

codgen:
	addiu $sp, $sp, -4
	sw    $31, 0($sp)	# push the return addr
	addiu $sp, $sp, -4
	sw    $fp, 0($sp)	# push the old frame pointer
	addu  $fp, $sp, $zero		# establish new frame pointer.
	addiu $sp, $sp, -4	# make room for 2 full 

	lui	$t0, 0x0
	addiu $t0, $t0, 4176
	lw    $t0, 0($s1)   
	nop
	srl   $t1, $t0, 27   # right-justify    $t1 = n
	
loop1:
	sll   $t2, $t0, 3   # multiply by 8    $t2 = x
	srl	  $t3, $t0, 3   # divide by 8      $t3 = y
	subu  $t0, $t2, $t3 # x-y
	addiu $t1, $t1, -1  # n-1
	bgez  $t1, loop1     # WHILE n >= 0 LOOP

loop1end:
	xor	  $v0, $t0, 0x3c8c693b
	sw 	  $t0, 0($s1)




exit1:
	b 	exit

# ----------------------------------------------------------
# Group 34's assembly code for Function DeCode :
# ----------------------------------------------------------

   # your activation record diagram here.
   #    +-------------------+
   #    | uninit, for "a1"   | -24($fp)
   #    +-------------------+
   #    | uninit, for "a0"   | -20($fp)
   #    +-------------------+
   #    | uninit, for "m"   | -16($fp)
   #    +-------------------+
   #    | uninit, for "y"   | -12($fp)
   #    +-------------------+
   #    | uninit, for "r"   | -8($fp)
   #    +-------------------+
   #    | uninit, for "x"   | -4($fp)
   #    +-------------------+
   #    | old frame pointer |  0($fp) <= $fp points here
   #    +-------------------+
   #    |  our return addr  |  4($fp)
   #  --+-------------------+--
   #    |                   |
   #    |  caller's stack   |
   #    |                   |

decode:
	addiu $sp, $sp, -4
	sw    $31, 0($sp)	# push the return addr
	addiu $sp, $sp, -4
	sw    $fp, 0($sp)	# push the old frame pointer
	addu  $fp, $sp, $zero		# establish new frame pointer.
	addiu $sp, $sp, -24	# make room 4local2global

	bal codgen               # call codgen in order to get v0
	nop
	or  $t0, $zero, $v0      # SAVE v0 into t0 
	xor $t0, $t0, 0xffffffff # one's compliment of codgen
	sw  $t0, -4($fp)         # stores x onto the stack
	sw  $a0, -20($fp)        # stores wordarray onto the stack
	sw  $a1, -24($fp)        # stores bytearray onto the stack
if:
	lw  $t0, 0($a0)          # load wordarray onto t0
	nop
	bne $t0, $zero, else     # branch if content not 0
	nop

then:
	sb $zero, 0($a1)  # then byte pointed to = 0
	lw $t0, -4($fp)   # load x into t0
	sw $t0, -8($fp)   # save x to r, so x=r
	or $v0, $t0, 0    # return v0
	b exit

else:
	addi $a0, $a0, 4  # wordarray successon
	bal decode
	addi $a1, $a1, 1  # bytearray successon
	or   $t2, $v0, 0
	sw   $t2, -12($fp) # y to t2
	# loading onto the stack to use
	lw   $t0, -4($fp)
	lw   $t1, -12($fp)
	lw   $t2, -20($fp)
	addu  $t4, $t0, $t1
	lw   $t3, 0($t2)
	nop
	# math according to lab
	xor  $t4, $t4, $t3
	# save to m
	sw   $t4, -16($fp) 
	# :=[the eight bits at "m"<30:23>]
	srl  $t4, $t4, 23
	lw   $t0, -24($fp)
	nop
	sb   $t4, 0($t0)

	# #### 2s compliment #### #
	bal codgen
	nop
	or   $t0, $v0, 0
	xor  $t0, $t0, 0xffffffff # one's compliment of codgen
	add  $t0, $t0, 1          # two's compliment

	# -24fp = bytearray
	# -20fp = wordarray
	# -16fp = m
	# -12fp = y
	# -8fp  = r
	# -4fp  = x
	# r := x + y + m + r + 5;
	lw   $t1, -4($fp) # x
	lw   $t2, -12($fp) # y
	lw   $t3, -16($fp) # m

	addu $t0, $t0, $t1 # r + x
	addu $t0, $t0, $t2 # r + y
	addu $t0, $t0, $t3 # r + m
	addi $t0, $t0, 5   # r + 5
	sw 	  $t0, -8($fp)
	or   $v0, $t0, 0 # returning r

exit:
	addu  $sp, $fp, $zero	# all local var's gone: easy !
	lw    $fp, 0($sp)	# restore old $fp
	addiu $sp, $sp, 4	# and pop that word,
	lw    $31, 0($sp)	# restore return address,
	addiu $sp, $sp, 4	# and pop that word.
	jr    $31	
	nop



# end of file.

# How many cycles did lab1b take to execute, running in the no-pipe mode?
# 	- 17348 cycles

# How many cycles did lab2 take to execute without the interrupts and running 
# in the pipeline mode? 
#	- 20504 cycles
#	- SPEED UP = 3,384 the rather big difference from 4 is a clear-
#   --indication of many nop uses. not very effiently done by me.
#   ---since codgen runs a lot the nops there have a clear impact.

# How many cycles did lab 2 take to execute with timer interrupts, running in the extended mode?
# Explain the extra clock cycles.
#	- 20741 cycles
#   we get more lines of code from the interupts, but also from the extra kernal
#   code at startup. the increased cycles have a direct correlation with the
#   added instructions having to be read each time an interrupt occurs.

# How many cycles did lab 2 take to execute with timer and input interrupts, running in the extended mode?
# Explain the extra clock cycles.
#	- 20918 cycles
#   just added interrupts by user input. This was abit tricky to do so the reading is not exact
#