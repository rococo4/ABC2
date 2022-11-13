	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"w"
.LC2:
	.string	"No such subsequence"
.LC3:
	.string	"%s "
.LC4:
	.string	" Enter N:"
.LC5:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 1680
	mov	DWORD PTR -1668[rbp], edi
	mov	QWORD PTR -1680[rbp], rsi
	mov	DWORD PTR -4[rbp], 0
	cmp	DWORD PTR -1668[rbp], 1
	jle	.L2
	mov	rax, QWORD PTR -1680[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -1652[rbp], eax
	mov	rax, QWORD PTR -1680[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
.L4:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	mov	edx, DWORD PTR -8[rbp]
	mov	DWORD PTR -1648[rbp+rax*4], edx
	cmp	DWORD PTR -8[rbp], -1
	je	.L3
	cmp	DWORD PTR -4[rbp], 99
	jle	.L4
.L3:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, DWORD PTR -1652[rbp]
	mov	edx, DWORD PTR -4[rbp]
	lea	rcx, -1648[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	Task@PLT
	mov	DWORD PTR -12[rbp], eax
	mov	rax, QWORD PTR -1680[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	DWORD PTR -12[rbp], -1
	jne	.L5
	mov	rax, QWORD PTR -32[rbp]
	lea	rdx, .LC2[rip]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L6
.L5:
	mov	eax, DWORD PTR -12[rbp]
	mov	DWORD PTR -4[rbp], eax
	jmp	.L7
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -1648[rbp+rax*4]
	mov	BYTE PTR -33[rbp], al
	movsx	eax, BYTE PTR -33[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	edx, DWORD PTR -1652[rbp]
	mov	eax, DWORD PTR -12[rbp]
	add	eax, edx
	cmp	DWORD PTR -4[rbp], eax
	jl	.L8
.L6:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L9
.L2:
	mov	DWORD PTR -4[rbp], 0
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -1652[rbp]
	mov	rsi, rax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L11:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	mov	edx, DWORD PTR -8[rbp]
	mov	DWORD PTR -1648[rbp+rax*4], edx
	cmp	DWORD PTR -8[rbp], -1
	je	.L10
	cmp	DWORD PTR -4[rbp], 99
	jle	.L11
.L10:
	mov	eax, DWORD PTR -1652[rbp]
	mov	edx, DWORD PTR -4[rbp]
	lea	rcx, -1648[rbp]
	mov	rsi, rcx
	mov	edi, eax
	call	Task@PLT
	mov	DWORD PTR -12[rbp], eax
	cmp	DWORD PTR -12[rbp], -1
	jne	.L12
	mov	rax, QWORD PTR stdout[rip]
	lea	rdx, .LC2[rip]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L9
.L12:
	mov	eax, DWORD PTR -12[rbp]
	mov	DWORD PTR -4[rbp], eax
	jmp	.L13
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -1648[rbp+rax*4]
	mov	BYTE PTR -13[rbp], al
	movsx	eax, BYTE PTR -13[rbp]
	mov	rdx, QWORD PTR stdout[rip]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1
.L13:
	mov	edx, DWORD PTR -1652[rbp]
	mov	eax, DWORD PTR -12[rbp]
	add	eax, edx
	cmp	DWORD PTR -4[rbp], eax
	jl	.L14
.L9:
	mov	eax, 0
	leave
	ret
	.size	main, .-main
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
