	.file	"task.c"
	.intel_syntax noprefix
	.text
	.globl	Task
	.type	Task, @function
Task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -24[rbp], edx
	mov	DWORD PTR -8[rbp], 1
	mov	eax, DWORD PTR -24[rbp]
	sub	eax, 1
	mov	DWORD PTR -4[rbp], eax
	jmp	.L2
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 2
	lea	rcx, -4[rax]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rcx
	mov	eax, DWORD PTR [rax]
	cmp	edx, eax
	jle	.L3
	add	DWORD PTR -8[rbp], 1
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jne	.L4
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	jmp	.L5
.L3:
	mov	DWORD PTR -8[rbp], 1
.L4:
	sub	DWORD PTR -4[rbp], 1
.L2:
	cmp	DWORD PTR -4[rbp], 0
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
