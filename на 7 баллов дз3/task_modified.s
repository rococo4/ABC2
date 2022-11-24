	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	Task
	.type	Task, @function
Task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -36[rbp], edi # -36 - x передается из edi в -36
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -8[rbp], xmm0 # -8 - result
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -16[rbp], xmm0 # -16 - temp
	mov		r12d, 1 # r12d - i
	jmp	.L2
.L5:
	cvtsi2sd	xmm0, DWORD PTR -36[rbp] # -36 - x
	cvtsi2sd	xmm1, r12d # r12d - i
	divsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0 # -32 - differnce
	movsd	xmm0, QWORD PTR -16[rbp] # -16 - temp
	mulsd	xmm0, QWORD PTR -32[rbp] # -32 - differnce
	movsd	QWORD PTR -16[rbp], xmm0 # -16 - temp
	mov	eax, r12d # r12d - i
	and	eax, 1
	test	eax, eax
	jne	.L3
	movsd	xmm0, QWORD PTR -8[rbp] # -8 - result
	addsd	xmm0, QWORD PTR -16[rbp] # -16 - temp
	movsd	QWORD PTR -8[rbp], xmm0 # -8 - result
	jmp	.L4
.L3:
	movsd	xmm0, QWORD PTR -8[rbp] # -8 - result
	subsd	xmm0, QWORD PTR -16[rbp] # -16 - temp
	movsd	QWORD PTR -8[rbp], xmm0 # -8 - result
.L4:
	add	r12d, 1 # r12d - i
.L2:
	cmp	r12d, 99 # r12d - i
	jle	.L5
	movsd	xmm0, QWORD PTR -8[rbp] # -8 - result возвращается
	pop	rbp
	ret
	.size	Task, .-Task
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
