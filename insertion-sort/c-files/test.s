	.file	"test.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.word	4
	.word	5
	.word	-1
	.word	100
	.word	1
	.word	22
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	s0,56(sp)
	addi	s0,sp,64
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a4,0(a5)
	sd	a4,-56(s0)
	ld	a4,8(a5)
	sd	a4,-48(s0)
	ld	a5,16(a5)
	sd	a5,-40(s0)
	li	a5,6
	sw	a5,-28(s0)
	li	a5,1
	sw	a5,-20(s0)
	j	.L2
.L6:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-40(a5)
	sw	a5,-32(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-24(s0)
	j	.L3
.L5:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sext.w	a3,a5
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-40(a5)
	slli	a5,a3,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	a4,-40(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,-1
	sw	a5,-24(s0)
.L3:
	lw	a5,-24(s0)
	sext.w	a5,a5
	blt	a5,zero,.L4
	lw	a5,-24(s0)
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-40(a5)
	lw	a5,-32(s0)
	sext.w	a5,a5
	blt	a5,a4,.L5
.L4:
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-32(s0)
	sw	a4,-40(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L6
	li	a5,0
	mv	a0,a5
	ld	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.ident	"GCC: (13.2.0-11ubuntu1+12) 13.2.0"
