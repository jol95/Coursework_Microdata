		.text           # .text segment (code)
		.set noreorder	# necessary to avoid code optimization

		# replace ... with your own code to make it work

		# try single step, re-load, free-run, etc. to be sure how they work
		# for each instruction you run,	trace the paths from program
		# counter all the way to wb-reg / wb-data

		# Assigment 1:
		# assume we use $t0 for our varible "res"
		# compute res = 1 + 2 + 3

		li		$t0, 1		# constant 1
		addiu		$t0, $t0, 2	# + 2
		addiu		$t0, $t0, 3	# + 3


break1:		nop				# put 1st breakpoint here
	
		# Assigment 2:
		# assume we use $t1 for our varible "tmp"
		# code the following
		# tmp = res + 1
		# res = tmp - 2 (should compute to 5)

		addiu $t1, $t0, 1		# "tmp = res + 1
		sub   $t0, $t1, 2		# "res = tmp - 2
			
break2:		nop				# put 2nd breakpoint here
	
		# Assigment 3:	
		# assume we would like to store "res" onto the heap (data) 
		# memory; "res" is 32 bit (word), hence "res_heap" should be 
		# the same size

		la $a0, res_heap
		sw $t0, 0($a0)
	
break3:		nop				# put 3rd breakpoint here	

		# trace the paths from program counter all the way to data 
		# memory update, be sure to understand calculation of memory 
		# address (base+offset)

		# Assigment 4:	
		# compute "res = bytearr_heap[0]+bytearr_heap[1]+
		# bytearr_heap[2]+bytearr_heap[3]
		# using static base address + offsets

		la $a1, bytearr_heap
		li $t0,0 		# initialize accumulator for result	

		lb $t2, 0($a1)     # load byte into $t2, heap[0]
		add $t0, $t0, $t2  # t0 ++

		lb $t2, 1($a1)		# heap[1]
		add $t0, $t0, $t2 

		lb $t2, 2($a1)		# heap[2]
		add $t0, $t0, $t2

		lb $t2, 3($a1)		# heap[3]
		add $t0, $t0, $t2

	
break4:		nop		# put 4th breakpoint here			

		# Assigment 5:	
		# compute "res = bytearr_heap[0]+bytearr_heap[1]+
		# bytearr_heap[2]+bytearr_heap[3]
		# using 0 offset and increasing base address
		la $a1, bytearr_heap
		li $t0,0	

		lb $t2, 0($a1)
		add $t0, $t0, $t2
		addiu $a1, $a1, 1	# increasing base address by 1 (from heap[0] to heap[1])
		
		lb $t2, 0($a1)
		add $t0, $t0, $t2
		addiu $a1, $a1, 1 # from heap[1] to heap[2]
		
		lb $t2, 0($a1)
		add $t0, $t0, $t2
		addiu $a1, $a1, 1 # from heap[2] to heap[3]
		
		lb $t2, 0($a1)
		add $t0, $t0, $t2
		
break5:		nop

		# Assigment 6:	
		# compute "res = bytearr_heap[0]+bytearr_heap[1]+
		# bytearr_heap[2]+bytearr_heap[3]"
		# using a loop, use $t3 as a loop condition
		#		$t3 = 4
		# loop1:	...
		#		decrease $t3
		#		if ($t3 <> 0) goto loop1  
		la $a1, bytearr_heap
		li $t0, 0
		li $t3, 4
loop1:		lb $t2, 0($a1)
		add $t0, $t0, $t2
		addiu $a1, $a1, 1
		addiu $t3, $t3, -1 #  i++ essentially
		bgtz $t3, loop1 # gbtz = if $t3 is greater than zero, loop
		
break6:		nop				
		
		# Assigment 7:
		# use "bitmasking" to extract each byte from the word stored in
		# word_heap and compute the sum of the 4 bytes and store this in
		# res

		la $a1, word_heap
		lw $t2, 0($a1)
		li $t0, 0
		li $t3, 4
loop2:	andi $t1, $t2, 0xff	# 0x000000FF #and shift vs 1111 1111 to mask on
		add $t0, $t0, $t1
		srl $t2, $t2, 8		# >> 8 bits srl = shift right logical
		
		addiu $t3, $t3, -1
		bgtz $t3, loop2
		
break7:		nop				

stop:		b stop
		
                .data   # .data segment
res_heap:       .word 0x00000000
bytearr_heap:	.byte 0
                .byte 1
                .byte 2
                .byte 3
word_heap:      .word 0x00010203

