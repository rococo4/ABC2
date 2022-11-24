	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"1"
.LC1:
	.string	"%d"
.LC2:
	.string	"2"
.LC3:
	.string	"r"
.LC4:
	.string	"File doesn't exist."
.LC5:
	.string	"X must be >0 && <=100"
.LC6:
	.string	"Result = %lf"
.LC7:
	.string	"w"
.LC8:
	.string	"%lf\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi # -36 - argc
	mov	QWORD PTR -48[rbp], rsi # -48 - argv
	cmp	DWORD PTR -36[rbp], 1 # -36 - argc
	je	.L2
	mov	rax, QWORD PTR -48[rbp] # -48 - argv
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L3
.L2:
	lea	rax, -28[rbp] # -28 - x
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L4
.L3:
	mov	rax, QWORD PTR -48[rbp] # -48 - argv
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L4
	mov	rax, QWORD PTR -48[rbp] # -48 - argv
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax # -8 - fread
	cmp	QWORD PTR -8[rbp], 0 # -8 - fread
	jne	.L5
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L11
.L5:
	lea	rdx, -28[rbp] # -28 - x
	mov	rax, QWORD PTR -8[rbp] # -8 - fread
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rdi, QWORD PTR -8[rbp]# -8 - fread
	call	fclose@PLT
.L4:
	mov	eax, DWORD PTR -28[rbp] # -28 - x
	cmp	eax, 100
	jg	.L7
	mov	eax, DWORD PTR -28[rbp] # -28 - x
	test	eax, eax
	jg	.L8
.L7:
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L11
.L8:
	mov	edi, DWORD PTR -28[rbp] # -28 - x x передается в edi как параметр функции
	call	Task@PLT
	cvtsd2ss	xmm0, xmm0
	movss	DWORD PTR -12[rbp], xmm0 # -12 - result в result передается итог исполнения функции
	cvtss2sd	xmm0, DWORD PTR -12[rbp] # -12 - result
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	cmp	DWORD PTR -36[rbp], 1 # -36 - argc
	jle	.L9
	mov	rax, QWORD PTR -48[rbp] # -48 - argv
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L9
	mov	rax, QWORD PTR -48[rbp] # -48 - argv
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax # -24 - fwrite
	cmp	QWORD PTR -24[rbp], 0 # -24 - fwrite
	jne	.L10
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L11
.L10:
	cvtss2sd	xmm0, DWORD PTR -12[rbp] # -12 - result
	mov	rax, QWORD PTR -24[rbp] # -24 - fwrite
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdi, QWORD PTR -24[rbp] # -24 - fwrite
	call	fclose@PLT
.L9:
	mov	eax, 0
.L11:
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
