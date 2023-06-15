	.section .mdebug.abi32
	.previous
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.globl	coded
	.section	.data,"aw",@progbits
	.align	2
	.type	coded, @object
	.size	coded, 300
coded:
	.word	1185322455
	.word	425623134
	.word	1236022045
	.word	129376618
	.word	1018136583
	.word	-1784191332
	.word	-1878668585
	.word	1497748111
	.word	-1749007321
	.word	-299609357
	.word	-418860639
	.word	457256358
	.word	-1541202961
	.word	-1083169963
	.word	1412608656
	.word	-363604478
	.word	1062060658
	.word	-62327411
	.word	-495025321
	.word	-1649705609
	.word	1101734925
	.word	1558495731
	.word	139658115
	.word	1253472839
	.word	-427012550
	.word	-75832860
	.word	-1674985009
	.word	1328652874
	.word	1580847243
	.word	1769830544
	.word	-1529196664
	.word	-1767957868
	.word	-1549865456
	.word	53144917
	.word	-2045336636
	.word	-273332678
	.word	692862313
	.word	495122738
	.word	-1864737934
	.word	-270264300
	.word	924549
	.word	1958941349
	.word	609110633
	.word	801054282
	.word	1664629507
	.word	2079655490
	.word	-1945930823
	.word	438146441
	.word	772278741
	.word	1066737406
	.word	-1601090907
	.word	519385319
	.word	-1380240378
	.word	1930192120
	.word	227779096
	.word	327122300
	.word	669906842
	.word	889353517
	.word	-1696794947
	.word	-1689010421
	.word	774236807
	.word	-2006061571
	.word	-874751490
	.word	-2093084352
	.word	2026047985
	.word	1461416488
	.word	-1660425005
	.word	111860620
	.word	619945507
	.word	352842431
	.word	2074676377
	.word	1232166811
	.word	1249221249
	.word	1126639171
	.word	0
	.section	.text.codgen,"ax",@progbits
	.align	2
	.globl	codgen
.LFB0:
	.file 1 "lab4.c"
	.loc 1 21 0
	.set	nomips16
	.ent	codgen
codgen:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
.LCFI0:
	sw	$fp,16($sp)
.LCFI1:
	move	$fp,$sp
.LCFI2:
	sw	$4,24($fp)
	.loc 1 24 0
	lw	$2,24($fp)
	nop
	lw	$2,0($2)
	nop
	srl	$2,$2,27
	sw	$2,0($fp)
.L2:
	.loc 1 25 0
	lw	$2,0($fp)
	nop
	bltz	$2,.L3
	nop

	.loc 1 27 0
	lw	$2,24($fp)
	nop
	lw	$2,0($2)
	nop
	sll	$2,$2,3
	sw	$2,4($fp)
	.loc 1 28 0
	lw	$2,24($fp)
	nop
	lw	$2,0($2)
	nop
	srl	$2,$2,3
	sw	$2,8($fp)
	.loc 1 29 0
	lw	$4,24($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	nop
	subu	$2,$3,$2
	sw	$2,0($4)
	.loc 1 30 0
	lw	$2,0($fp)
	nop
	addiu	$2,$2,-1
	sw	$2,0($fp)
	b	.L2
	nop

.L3:
	.loc 1 32 0
	lw	$2,24($fp)
	nop
	lw	$3,0($2)
	li	$2,1015808000			# 0x3c8c0000
	ori	$2,$2,0x693b
	xor	$2,$3,$2
	.loc 1 33 0
	move	$sp,$fp
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	codgen
.LFE0:
	.size	codgen, .-codgen
	.section	.text.decode,"ax",@progbits
	.align	2
	.globl	decode
.LFB1:
	.loc 1 56 0
	.set	nomips16
	.ent	decode
decode:
	.frame	$fp,40,$31		# vars= 16, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
.LCFI3:
	sw	$31,36($sp)
.LCFI4:
	sw	$fp,32($sp)
.LCFI5:
	move	$fp,$sp
.LCFI6:
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	.loc 1 58 0
	lw	$4,48($fp)
	jal	codgen
	nop

	nor	$2,$0,$2
	sw	$2,24($fp)
	.loc 1 59 0
	lw	$2,40($fp)
	nop
	lw	$2,0($2)
	nop
	bne	$2,$0,.L5
	nop

	.loc 1 61 0
	lw	$2,44($fp)
	nop
	sb	$0,0($2)
	.loc 1 62 0
	lw	$2,24($fp)
	nop
	sw	$2,20($fp)
	b	.L6
	nop

.L5:
	.loc 1 66 0
	lw	$2,40($fp)
	nop
	addiu	$2,$2,4
	sw	$2,40($fp)
	.loc 1 67 0
	lw	$2,44($fp)
	nop
	addiu	$2,$2,1
	sw	$2,44($fp)
	.loc 1 68 0
	lw	$4,40($fp)
	lw	$5,44($fp)
	lw	$6,48($fp)
	jal	decode
	nop

	sw	$2,28($fp)
	.loc 1 69 0
	lw	$2,40($fp)
	nop
	addiu	$2,$2,-4
	sw	$2,40($fp)
	.loc 1 70 0
	lw	$2,44($fp)
	nop
	addiu	$2,$2,-1
	sw	$2,44($fp)
	.loc 1 71 0
	lw	$3,24($fp)
	lw	$2,28($fp)
	nop
	addu	$3,$3,$2
	lw	$2,40($fp)
	nop
	lw	$2,0($2)
	nop
	xor	$2,$3,$2
	sw	$2,16($fp)
	.loc 1 72 0
	lw	$3,44($fp)
	lw	$2,16($fp)
	nop
	srl	$2,$2,23
	sb	$2,0($3)
	.loc 1 73 0
	lw	$4,48($fp)
	jal	codgen
	nop

	nor	$2,$0,$2
	addiu	$2,$2,1
	sw	$2,20($fp)
	.loc 1 74 0
	lw	$3,24($fp)
	lw	$2,28($fp)
	nop
	addu	$3,$3,$2
	lw	$2,16($fp)
	nop
	addu	$3,$3,$2
	lw	$2,20($fp)
	nop
	addu	$2,$3,$2
	addiu	$2,$2,5
	sw	$2,20($fp)
.L6:
	.loc 1 76 0
	lw	$2,20($fp)
	.loc 1 77 0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	decode
.LFE1:
	.size	decode, .-decode
	.section	.text.main,"ax",@progbits
	.align	2
	.globl	main
.LFB2:
	.loc 1 80 0
	.set	nomips16
	.ent	main
main:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
.LCFI7:
	sw	$31,28($sp)
.LCFI8:
	sw	$fp,24($sp)
.LCFI9:
	move	$fp,$sp
.LCFI10:
	.loc 1 81 0
	li	$2,830013440			# 0x31790000
	ori	$2,$2,0xc241
	sw	$2,16($fp)
	.loc 1 82 0
	lui	$2,%hi(coded)
	addiu	$4,$2,%lo(coded)
	lui	$2,%hi(plain)
	addiu	$5,$2,%lo(plain)
	addiu	$6,$fp,16
	jal	decode
	nop

	.loc 1 83 0
	sw	$0,20($fp)
.L8:
	.loc 1 84 0
	b	.L8
	nop

	.set	macro
	.set	reorder
	.end	main
.LFE2:
	.size	main, .-main
	.globl	plain
	.section	.data
	.align	2
	.type	plain, @object
	.size	plain, 132
plain:
	.space	132
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 4
	.byte	0x1f
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -2
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x1e
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI3-.LFB1
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI5-.LCFI3
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -2
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xd
	.uleb128 0x1e
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI7-.LFB2
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI9-.LCFI7
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -2
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x1e
	.align	2
.LEFDE4:
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x1ec
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.ascii	"GNU C 3.4.4 mipssde-6.06.01-20070420\000"
	.byte	0x1
	.ascii	"lab4.c\000"
	.ascii	"/home/oscarlundberg95/lab4/lab4\000"
	.uleb128 0x2
	.4byte	0xae
	.byte	0x1
	.ascii	"codgen\000"
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.4byte	0xae
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x6e
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x14
	.4byte	0xbe
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x4
	.ascii	"n\000"
	.byte	0x1
	.byte	0x16
	.4byte	0xc4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x17
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x17
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.byte	0x0
	.uleb128 0x5
	.ascii	"unsigned int\000"
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.byte	0x4
	.4byte	0xae
	.uleb128 0x5
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	0x14c
	.byte	0x1
	.ascii	"decode\000"
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.4byte	0xae
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x6e
	.uleb128 0x7
	.ascii	"wordarr\000"
	.byte	0x1
	.byte	0x37
	.4byte	0xbe
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x7
	.ascii	"bytearr\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x14c
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x37
	.4byte	0xbe
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x4
	.ascii	"m\000"
	.byte	0x1
	.byte	0x39
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x4
	.ascii	"r\000"
	.byte	0x1
	.byte	0x39
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x39
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x39
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x152
	.uleb128 0x5
	.ascii	"char\000"
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	0x192
	.byte	0x1
	.ascii	"main\000"
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.4byte	0xc4
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x6e
	.uleb128 0x4
	.ascii	"seed\000"
	.byte	0x1
	.byte	0x51
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0x1
	.byte	0x53
	.4byte	0xc4
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.byte	0x0
	.uleb128 0x8
	.4byte	0x1a2
	.4byte	0x152
	.uleb128 0x9
	.4byte	0x1a2
	.byte	0x83
	.byte	0x0
	.uleb128 0x5
	.ascii	"long unsigned int\000"
	.byte	0x4
	.byte	0x7
	.uleb128 0xa
	.ascii	"plain\000"
	.byte	0x1
	.byte	0x1
	.4byte	0x192
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	plain
	.uleb128 0x8
	.4byte	0x1db
	.4byte	0xae
	.uleb128 0x9
	.4byte	0x1a2
	.byte	0x4a
	.byte	0x0
	.uleb128 0xa
	.ascii	"coded\000"
	.byte	0x1
	.byte	0x2
	.4byte	0x1cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	coded
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.4byte	0x41
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1f0
	.4byte	0x5d
	.ascii	"codgen\000"
	.4byte	0xcb
	.ascii	"decode\000"
	.4byte	0x15a
	.ascii	"main\000"
	.4byte	0x1b7
	.ascii	"plain\000"
	.4byte	0x1db
	.ascii	"coded\000"
	.4byte	0x0
	.section	.debug_aranges,"",@progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"",@progbits
.LASF0:
	.ascii	"seed_addr\000"
	.ident	"GCC: (GNU) 3.4.4 mipssde-6.06.01-20070420"
