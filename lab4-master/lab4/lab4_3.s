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
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	.loc 1 24 0
	lw	$6,0($4)
	nop
	srl	$5,$6,27
	.loc 1 30 0
	bltz	$5,.L6
	nop

.L4:
	.loc 1 28 0
	srl	$3,$6,3
	.loc 1 27 0
	sll	$2,$6,3
	.loc 1 30 0
	addiu	$5,$5,-1
	.loc 1 29 0
	.loc 1 30 0
	bgez	$5,.L4
	subu	$6,$2,$3

	sw	$6,0($4)
.L6:
	.loc 1 32 0
	li	$5,1015808000			# 0x3c8c0000
	ori	$4,$5,0x693b
	.loc 1 33 0
	j	$31
	xor	$2,$6,$4

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
	.frame	$sp,40,$31		# vars= 0, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
.LCFI0:
	sw	$19,28($sp)
.LCFI1:
	sw	$18,24($sp)
.LCFI2:
	sw	$16,16($sp)
.LCFI3:
	sw	$31,32($sp)
.LCFI4:
	sw	$17,20($sp)
.LCFI5:
.LBB2:
.LBB3:
	.loc 1 24 0
	lw	$2,0($6)
.LBE3:
.LBE2:
	.loc 1 56 0
	move	$16,$6
.LBB4:
.LBB5:
	.loc 1 24 0
	srl	$6,$2,27
.LBE5:
.LBE4:
	.loc 1 56 0
	move	$18,$4
.LBB6:
.LBB7:
	.loc 1 30 0
	bltz	$6,.L27
	move	$19,$5

	move	$4,$2
.L14:
	.loc 1 28 0
	srl	$3,$4,3
	.loc 1 27 0
	sll	$2,$4,3
	.loc 1 29 0
	subu	$4,$2,$3
	.loc 1 30 0
	addiu	$6,$6,-1
	.loc 1 29 0
	.loc 1 30 0
	bgez	$6,.L14
	sw	$4,0($16)

	.loc 1 31 0
	li	$8,1015808000			# 0x3c8c0000
.L32:
	ori	$7,$8,0x693b
.LBE7:
.LBE6:
	.loc 1 59 0
	lw	$5,0($18)
.LBB8:
.LBB9:
	.loc 1 31 0
	xor	$6,$4,$7
.LBE9:
.LBE8:
	.loc 1 21 0
	.loc 1 59 0
	bne	$5,$0,.L16
	nor	$17,$0,$6

	.loc 1 62 0
	move	$2,$17
	.loc 1 61 0
	sb	$0,0($19)
	.loc 1 77 0
	lw	$31,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	j	$31
	addiu	$sp,$sp,40

.L16:
	.loc 1 68 0
	addiu	$4,$18,4
	addiu	$5,$19,1
	jal	decode
	move	$6,$16

	.loc 1 71 0
	lw	$10,0($18)
	addu	$6,$17,$2
	xor	$4,$6,$10
	.loc 1 72 0
	srl	$9,$4,23
	sb	$9,0($19)
.LBB10:
.LBB11:
	.loc 1 24 0
	lw	$2,0($16)
	nop
	srl	$5,$2,27
	.loc 1 30 0
	bltz	$5,.L26
	nop

.L21:
	.loc 1 28 0
	srl	$12,$2,3
	.loc 1 27 0
	sll	$11,$2,3
	.loc 1 30 0
	addiu	$5,$5,-1
	.loc 1 29 0
	.loc 1 30 0
	bgez	$5,.L21
	subu	$2,$11,$12

	sw	$2,0($16)
.L26:
	.loc 1 31 0
	li	$16,1015808000			# 0x3c8c0000
	ori	$15,$16,0x693b
	xor	$14,$2,$15
.LBE11:
.LBE10:
	.loc 1 74 0
	addu	$13,$6,$4
	subu	$4,$13,$14
	.loc 1 77 0
	lw	$31,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	.loc 1 74 0
	addiu	$2,$4,5
	.loc 1 77 0
	j	$31
	addiu	$sp,$sp,40

.L27:
	lw	$4,0($16)
	.loc 1 31 0
	b	.L32
	li	$8,1015808000			# 0x3c8c0000

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
	.frame	$sp,48,$31		# vars= 8, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	.loc 1 81 0
	li	$2,830013440			# 0x31790000
	.loc 1 80 0
	addiu	$sp,$sp,-48
.LCFI6:
	.loc 1 81 0
	ori	$2,$2,0xc241
.LBB12:
	.loc 1 56 0
	lui	$3,%hi(coded)
	lui	$4,%hi(plain)
.LBE12:
	.loc 1 80 0
	sw	$19,36($sp)
.LCFI7:
	sw	$18,32($sp)
.LCFI8:
	sw	$17,28($sp)
.LCFI9:
	sw	$31,40($sp)
.LCFI10:
	sw	$16,24($sp)
.LCFI11:
	.loc 1 81 0
	sw	$2,16($sp)
.LBB13:
	.loc 1 56 0
	addiu	$17,$3,%lo(coded)
	addiu	$18,$4,%lo(plain)
	addiu	$19,$sp,16
.LBB14:
.LBB15:
.LBB16:
	.loc 1 24 0
	li	$5,6			# 0x6
.L36:
	.loc 1 28 0
	srl	$6,$2,3
	.loc 1 27 0
	sll	$7,$2,3
	.loc 1 29 0
	subu	$4,$7,$6
	.loc 1 30 0
	addiu	$5,$5,-1
	.loc 1 29 0
	.loc 1 30 0
	bgez	$5,.L36
	move	$2,$4

	.loc 1 31 0
	li	$10,1015808000			# 0x3c8c0000
	ori	$9,$10,0x693b
.LBE16:
.LBE15:
	.loc 1 59 0
	lw	$5,0($17)
.LBB17:
.LBB18:
	.loc 1 31 0
	xor	$8,$4,$9
	sw	$4,0($19)
.LBE18:
.LBE17:
	.loc 1 21 0
	.loc 1 59 0
	bne	$5,$0,.L38
	nor	$16,$0,$8

	.loc 1 61 0
	sb	$0,0($18)
.L45:
	b	.L45
	nop

.L38:
	.loc 1 68 0
	addiu	$5,$18,1
	move	$6,$19
	jal	decode
	addiu	$4,$17,4

	.loc 1 71 0
	lw	$14,0($17)
	addu	$13,$16,$2
.LBB19:
.LBB20:
	.loc 1 24 0
	lw	$6,0($19)
.LBE20:
.LBE19:
	.loc 1 71 0
	xor	$12,$13,$14
	.loc 1 72 0
	srl	$11,$12,23
.LBB21:
.LBB22:
	.loc 1 24 0
	srl	$5,$6,27
	.loc 1 72 0
	.loc 1 30 0
	bltz	$5,.L50
	sb	$11,0($18)

.L42:
	.loc 1 28 0
	srl	$15,$6,3
	.loc 1 27 0
	sll	$16,$6,3
	.loc 1 30 0
	addiu	$5,$5,-1
	.loc 1 29 0
	.loc 1 30 0
	bgez	$5,.L42
	subu	$6,$16,$15

	sw	$6,0($19)
.L50:
	b	.L45
	nop

.LBE22:
.LBE21:
.LBE14:
.LBE13:
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI5-.LCFI0
	.byte	0x11
	.uleb128 0x11
	.sleb128 -5
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -2
	.byte	0x11
	.uleb128 0x10
	.sleb128 -6
	.byte	0x11
	.uleb128 0x12
	.sleb128 -4
	.byte	0x11
	.uleb128 0x13
	.sleb128 -3
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI11-.LCFI6
	.byte	0x11
	.uleb128 0x10
	.sleb128 -6
	.byte	0x11
	.uleb128 0x1f
	.sleb128 -2
	.byte	0x11
	.uleb128 0x11
	.sleb128 -5
	.byte	0x11
	.uleb128 0x12
	.sleb128 -4
	.byte	0x11
	.uleb128 0x13
	.sleb128 -3
	.align	2
.LEFDE4:
	.text
.Letext0:
	.section	.debug_info
	.4byte	0x300
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.Ldebug_line0
	.4byte	0x0
	.4byte	.LASF12
	.byte	0x1
	.4byte	.LASF13
	.4byte	.LASF14
	.uleb128 0x2
	.4byte	0x5a
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.4byte	0x5a
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x14
	.4byte	0x61
	.uleb128 0x4
	.ascii	"n\000"
	.byte	0x1
	.byte	0x16
	.4byte	0x67
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x5a
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x5a
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF0
	.byte	0x4
	.byte	0x7
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5a
	.uleb128 0x7
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x8
	.4byte	0x9e
	.4byte	0x21
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x6d
	.uleb128 0x9
	.4byte	0x33
	.byte	0x1
	.byte	0x54
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.uleb128 0x2
	.4byte	0x12a
	.byte	0x1
	.4byte	.LASF2
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.4byte	0x5a
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x37
	.4byte	0x61
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0x37
	.4byte	0x12a
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x37
	.4byte	0x61
	.uleb128 0x4
	.ascii	"m\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x5a
	.uleb128 0x4
	.ascii	"r\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x5a
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x5a
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x5a
	.uleb128 0xb
	.4byte	0x111
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0xd
	.uleb128 0xe
	.4byte	0x3e
	.uleb128 0xe
	.4byte	0x47
	.uleb128 0xe
	.4byte	0x50
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0xd
	.uleb128 0xe
	.4byte	0x3e
	.uleb128 0xe
	.4byte	0x47
	.uleb128 0xe
	.4byte	0x50
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x130
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8
	.uleb128 0x8
	.4byte	0x1dc
	.4byte	0x9e
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x6d
	.uleb128 0x9
	.4byte	0xb0
	.byte	0x1
	.byte	0x62
	.uleb128 0x9
	.4byte	0xbb
	.byte	0x1
	.byte	0x63
	.uleb128 0x9
	.4byte	0xc6
	.byte	0x1
	.byte	0x60
	.uleb128 0xa
	.4byte	0xd1
	.byte	0x1
	.byte	0x54
	.uleb128 0xe
	.4byte	0xda
	.uleb128 0xa
	.4byte	0xe3
	.byte	0x1
	.byte	0x61
	.uleb128 0xe
	.4byte	0xec
	.uleb128 0xf
	.4byte	0x1a9
	.4byte	0x21
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x10
	.4byte	.Ldebug_ranges0+0x0
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x56
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x21
	.4byte	.LBB10
	.4byte	.LBE10
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x12
	.4byte	.LBB11
	.4byte	.LBE11
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.4byte	0x2b8
	.byte	0x1
	.4byte	.LASF7
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.4byte	0x67
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x6d
	.uleb128 0x14
	.4byte	.LASF8
	.byte	0x1
	.byte	0x51
	.4byte	0x5a
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x4
	.ascii	"i\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x67
	.uleb128 0xf
	.4byte	0x235
	.4byte	0x9e
	.4byte	.LBB12
	.4byte	.LBE12
	.uleb128 0x9
	.4byte	0x14a
	.byte	0x1
	.byte	0x61
	.uleb128 0x9
	.4byte	0x151
	.byte	0x1
	.byte	0x62
	.uleb128 0x9
	.4byte	0x158
	.byte	0x1
	.byte	0x63
	.byte	0x0
	.uleb128 0x12
	.4byte	.LBB14
	.4byte	.LBE14
	.uleb128 0xa
	.4byte	0xd1
	.byte	0x1
	.byte	0x52
	.uleb128 0xe
	.4byte	0xda
	.uleb128 0xa
	.4byte	0xe3
	.byte	0x1
	.byte	0x60
	.uleb128 0xe
	.4byte	0xec
	.uleb128 0xf
	.4byte	0x288
	.4byte	0x21
	.4byte	.LBB15
	.4byte	.LBE15
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x10
	.4byte	.Ldebug_ranges0+0x28
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.4byte	0x21
	.4byte	.LBB19
	.4byte	.LBE19
	.uleb128 0xc
	.4byte	0x81
	.uleb128 0x10
	.4byte	.Ldebug_ranges0+0x40
	.uleb128 0xa
	.4byte	0x3e
	.byte	0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	0x47
	.byte	0x1
	.byte	0x52
	.uleb128 0xa
	.4byte	0x50
	.byte	0x1
	.byte	0x53
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.4byte	0x2c8
	.4byte	0x130
	.uleb128 0x16
	.4byte	0x2c8
	.byte	0x83
	.byte	0x0
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x4
	.byte	0x7
	.uleb128 0x17
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1
	.4byte	0x2b8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	plain
	.uleb128 0x15
	.4byte	0x2f1
	.4byte	0x5a
	.uleb128 0x16
	.4byte	0x2c8
	.byte	0x4a
	.byte	0x0
	.uleb128 0x17
	.4byte	.LASF11
	.byte	0x1
	.byte	0x2
	.4byte	0x2e1
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
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
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
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x14
	.uleb128 0x34
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
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
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
	.4byte	0x304
	.4byte	0x6e
	.ascii	"codgen\000"
	.4byte	0x137
	.ascii	"decode\000"
	.4byte	0x1dc
	.ascii	"main\000"
	.4byte	0x2cf
	.ascii	"plain\000"
	.4byte	0x2f1
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	.LBB9
	.4byte	.LBE9
	.4byte	.LBB7
	.4byte	.LBE7
	.4byte	.LBB5
	.4byte	.LBE5
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	0x0
	.4byte	0x0
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.ascii	"unsigned int\000"
.LASF12:
	.ascii	"GNU C 3.4.4 mipssde-6.06.01-20070420\000"
.LASF3:
	.ascii	"seed_addr\000"
.LASF13:
	.ascii	"lab4.c\000"
.LASF6:
	.ascii	"char\000"
.LASF4:
	.ascii	"wordarr\000"
.LASF1:
	.ascii	"codgen\000"
.LASF10:
	.ascii	"plain\000"
.LASF8:
	.ascii	"seed\000"
.LASF14:
	.ascii	"/home/oscarlundberg95/lab4/lab4\000"
.LASF2:
	.ascii	"decode\000"
.LASF7:
	.ascii	"main\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF5:
	.ascii	"bytearr\000"
.LASF11:
	.ascii	"coded\000"
	.ident	"GCC: (GNU) 3.4.4 mipssde-6.06.01-20070420"
