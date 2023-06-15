# First section:  user data,
# each process has its own "private" area.

        .data        
glob1:  .byte   'A'
        .space  999
glob2:  .byte   '0'
        .space  999
glob3:  .byte   'a'
        .space  999

# Second section: user code.
#
# The first instructions initializes IO and Timer.
# The last instruction in main are only used for start
# up, they initialize the first process.

        .text
        .set noreorder
main:
        li    $t0, 0xFFFF0010   # address to Timer registers:
                                # +0: Timer control register
                                # +4: Timer count register
                                # +8: Timer compare register

        li    $t1, 0
        sw    $t1, 4($t0)       # reset counter register

        li    $t1, 63           # count from 0 to 63
        sw    $t1, 8($t0)       # compare register := 63

        li    $t1, 0b101001     # "101001": compare interrupt enable,
                                #           compare reset enable,
                                #           timer start
        sw    $t1, 0($t0)       # control register := "101001"

        li    $t0, 0xFFFF0000   # address to I/O registers:
                                # +0: Input control register
 
        li    $t1, 0b10         # "10": interrupt enable
        sw    $t1, 0($t0)       # control register := "10"

        li    $t0, 0x0C03       # enable HW Interrupt 1 (input):  bit 11
        # li    $t0, 0x0003       # disable HW interrupt 1 (input): bit 11
                                # enable HW Interrupt 1 (timer):  bit 10
                                # set user mode:      1 (user):   bit 1
                                # enable interrupts   1 (enable): bit 0

        mtc0  $t0, $12          # CP0 status := 0x0C03

        ######## # Testing process 1 # ########
        la    $gp, glob1        # dirty setup for process 1
        # b       proc1          

        ######## # Testing process 1 # ########
        # la    $gp, glob2        # dirty setup for process 2
        # b       proc2 

        ######## # Testing process 1 # ########
        # la    $gp, glob3        # dirty setup for process 3
        # b       proc3

        nop                     # Delay for testing purposes

proc1:  # ++++++++++ first process +++++++++

        # Description: proc1 reads the byte stored at 0($gp),
        # prints it, increments to the next character,
        # saving that back into 0($gp).  After printing 'Z',
        # this process should then start over again with 'A', in
        # an endless loop.  The symbol "glob1" may not be used.
        lb      $a0, 0($gp)     # Write the character to lsb of $a0

        ########## CORRECT SERVICE CODE   #############
        li      $v0, 0x102      # kernel service output
        SYSCALL
        nop

        beq     $a0, 90, proc1_loop     # branch if at Z
        addiu   $a0, $a0, 1             # ASCII code incrementation
        j       proc1
        sb      $a0, 0($gp)

proc1_loop:
        li      $a0, 65         # set to "A"
        sb      $a0, 0($gp)
        j proc1                 # infnite loop
        nop


proc2: # ++++++++++ second process +++++++++

        # Description: almost identical to the code of proc1 above,
        # only 2-3 lines should differ.  Prints '0' through '9' in
        # an endless loop. The symbol "glob2" may not be used.

        lb      $a0, 0($gp)     # Write the character to lsb of $a0

        ########## CORRECT SERVICE CODE   #############
        li      $v0, 0x102      # kernel service output
        SYSCALL
        nop

        beq     $a0, 57, proc2_loop     # branch if at 9
        addiu   $a0, $a0, 1             # number code incrementation
        j       proc2
        sb      $a0, 0($gp)

proc2_loop:
        li      $a0, 48         # set to "0"
        sb      $a0, 0($gp)
        j proc2                 # infnite loop
        nop


proc3:  # +++++++++ third process ++++++++++

        # Description: almost identical to the code of proc1 above,
        # only 2-3 lines should differ.  Prints 'a' through 'z' in
        # an endless loop. The symbol "glob3" may not be used.

        lb      $a0, 0($gp)     # Write the character to lsb of $a0

        ########## CORRECT SERVICE CODE   #############
        li      $v0, 0x102      # kernel service output
        SYSCALL
        nop

        beq     $a0, 122, proc3_loop     # branch if at z
        addiu   $a0, $a0, 1             # ascii code incrementation
        j       proc3
        sb      $a0, 0($gp)

proc3_loop:
        li      $a0, 97         # set to "z"
        sb      $a0, 0($gp)
        j proc3                 # infnite loop
        nop

# Third section: data structures for the kernel:
# Process Control Block (PCB) consists of three words:
# pcb: .word  (next Program Counter for this process)
#      .word  (contents of $gp for this process)
#      .word  (contents of $sp for this process)
# All other context is saved on the process' own stack
# during exception handling and SYSCALL.

        .section .kdata
curpcb: .word  pcb1
pcb1:   .word  0, 0, 0
pcb2:   .word  proc2, glob2, 0x7fffbf94
pcb3:   .word  proc3, glob3, 0x7fff7f94

# Fourth section: kernel code.

        .section .ktext , "xa"
        .set noreorder
exception_handler:
        # checks for the exception syscall #    	
	mfc0	$k0, $13		# from CP0¨
	ori	$k1, $zero, 0x8         # for exception cause comparison
	srl	$k0, $k0, 2             # 5:2
	andi	$k0, $k0, 0xf		# masking out non exception bits
	beq	$k0, $k1, syscall_handler # If the exception code is:
	nop
	beq	$k0, $zero, int_handler # Now also detects external interrupt
	nop
	b	kernel_loop             # If neither inf loop
	nop

syscall_handler:
	# checks for the kernal service
	ori	$k0, $zero, 0x102	#
	beq	$k0, $v0, output	# Checks if an output is requested.
	nop
	b	return_from_exception  
	nop

output:	# prints
        lui	$k0, 0xffff
	sw	$a0, 8($k0)
	
return_from_exception:
        # returns
	mfc0	$k1, $14		
	nop
	addiu	$k1, $k1, 4	
	jr      $k1
	rfe

int_handler:
        # checks for the exception interrupt #
	mfc0	$k0, $13		# from CP0¨
	ori	$k1, $zero, 1           # for exception cause comparison
	srl	$k0, $k0, 10            # 9:0
	andi	$k0, $k0, 1		# timer interupt 'cause' bit mask
	beq	$k0, $k1, store_stack   
	nop
	b	kernel_loop             # If the exception code is not SYSCALL
	nop

store_stack:
        # Clear Timer Interrupt
	li      $k0, 0xFFFF0010	
	li      $k1, 0b101001
	sw      $k1, 0($k0)
        # load current current pcb
	la	$k0, curpcb
	lw	$k0, 0($k0)
        # makes room
	mfc0	$k1, $14
	addiu	$sp, $sp, -104
        # stores pc gp and sp
	sw	$k1, 0($k0)
	sw	$gp, 4($k0)
	sw	$sp, 8($k0)
        # saves the rest
	.set noat		
	sw	$at, 100($sp)
	.set at
	sw	$v0, 96($sp)
	sw	$v1, 92($sp)

	sw	$a0, 88($sp)
	sw	$a1, 84($sp)
	sw	$a2, 80($sp)
	sw	$a3, 76($sp)

	sw	$t0, 72($sp)
	sw	$t1, 68($sp)
	sw	$t2, 64($sp)
	sw	$t3, 60($sp)
	sw	$t4, 56($sp)
	sw	$t5, 52($sp)
	sw	$t6, 48($sp)
	sw	$t7, 44($sp)

	sw	$s0, 40($sp)
	sw	$s1, 36($sp)
	sw	$s2, 32($sp)
	sw	$s3, 28($sp)
	sw	$s4, 24($sp)
	sw	$s5, 20($sp)
	sw	$s6, 16($sp)
	sw	$s7, 12($sp)
	sw	$t8, 8($sp)
	sw	$t9, 4($sp)
	sw	$ra, 0($sp)

	la	$k0, curpcb
	lw	$k0, 0($k0)
	la	$k1, pcb1
	nop
        # if pcb == 1, switch to pcb2
	beq	$k0, $k1, store_pcb2
	nop
	# if pcb == 2, switch to pcb3
	la	$k1, pcb2
	beq	$k0, $k1, store_pcb3
	nop

store_pcb1:
        # else switch to pcb1.
	la	$k0, curpcb
	la	$k1, pcb1
	sw	$k1, 0($k0)
	b	restore_stack
	nop
store_pcb2:
	la	$k0, curpcb
	la	$k1, pcb2
	sw	$k1, 0($k0)
	b	restore_stack
	nop
store_pcb3:
	la	$k0, curpcb
	la	$k1, pcb3
	sw	$k1, 0($k0)
        b       restore_stack
        nop
restore_stack:
        # restores pc gp and sp
	lw	$sp, 8($k1)
	lw	$k0, 0($k1)
	lw	$gp, 4($k1)
	# restores the rest
	.set noat
	lw	$at, 100($sp)
	.set at

	lw	$v0, 96($sp)
	lw	$v1, 92($sp)

	lw	$a0, 88($sp)
	lw	$a1, 84($sp)
	lw	$a2, 80($sp)
	lw	$a3, 76($sp)

	lw	$t0, 72($sp)
	lw	$t1, 68($sp)
	lw	$t2, 64($sp)
	lw	$t3, 60($sp)
	lw	$t4, 56($sp)
	lw	$t5, 52($sp)
	lw	$t6, 48($sp)
	lw	$t7, 44($sp)

	lw	$s0, 40($sp)
	lw	$s1, 36($sp)
	lw	$s2, 32($sp)
	lw	$s3, 28($sp)
	lw	$s4, 24($sp)
	lw	$s5, 20($sp)
	lw	$s6, 16($sp)
	lw	$s7, 12($sp)
	lw	$t8, 8($sp)
	lw	$t9, 4($sp)
	lw	$ra, 0($sp)
        # jump back
	jr      $k0
	rfe

kernel_loop:
	b	kernel_loop
	nop
