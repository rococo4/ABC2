	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	Task
	.type	Task, @function
Task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi #-20 - N получение из rdi.
	mov	QWORD PTR -32[rbp], rsi #-32 - s получение из rsi.
	mov	DWORD PTR -24[rbp], edx #-24 - count получение из edx.
	mov	DWORD PTR -8[rbp], 1 #-8 - count1
	mov	eax, DWORD PTR -24[rbp] #-24 - count
	sub	eax, 1
	mov	r12d, eax #-4 - i
	jmp	.L2
.L6:
	mov	eax, r12d #-4 - i
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp] #-32 - s
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, r12d #-4 - i
	sal	rax, 2
	lea	rcx, -4[rax] #-4 - i
	mov	rax, QWORD PTR -32[rbp] #-32 - s
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jle	.L3
	add	DWORD PTR -8[rbp], 1 #-8 - count1
	mov	eax, DWORD PTR -8[rbp] #-8 - count1
	cmp	eax, DWORD PTR -20[rbp] #-20 - N
	jne	.L4
	mov	eax, r12d #-4 - i
	sub eax, 1
	jmp	.L5
.L3:
	mov	DWORD PTR -8[rbp], 1 #-8 - count1
.L4:
	sub	r12d, 1 #-4 - i
.L2:
	cmp	r12d, 0 #-4 - i
	jg	.L6
	mov	eax, -1
.L5:
	pop	rbp
	ret
	.size	Task, .-Task
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
