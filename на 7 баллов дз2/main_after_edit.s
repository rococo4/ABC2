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
	mov	DWORD PTR -1668[rbp], edi #-1668 - argc
	mov	QWORD PTR -1680[rbp], rsi
	mov	r12d, 0 # -4 - i r12d
	cmp	DWORD PTR -1668[rbp], 1 #-1668 - argc
	jle	.L2
	mov	rax, QWORD PTR -1680[rbp]
	add	rax, 8
	mov	rdi, QWORD PTR [rax]
	call	atoi@PLT
	mov	DWORD PTR -1652[rbp], eax #-1652 - N
	mov rax, QWORD PTR -1680[rbp]
	add rax, 16
	mov rax,  QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax #-24 - input
.L4:
	mov	rdi, QWORD PTR -24[rbp] #-24 - input
	call	fgetc@PLT
	mov	DWORD PTR -8[rbp], eax #-8 - ch
	mov	eax, r12d #-4 - i
	lea	edx, 1[rax]
	mov r12d, edx #-4 - i
	mov	edx, DWORD PTR -8[rbp] #-8 - ch
	mov	DWORD PTR -1648[rbp+rax*4], edx #-1648 - in
	cmp	DWORD PTR -8[rbp], -1 #-8 - ch
	je	.L3
	cmp	r12d, 99 #-4 - i
	jle	.L4
.L3:
	mov	rdi, QWORD PTR -24[rbp]  #-24 - input
	call	fclose@PLT
	mov	eax, DWORD PTR -1652[rbp] #-1652 - N передача N в функцию
	mov	edx, r12d #-4 - i передача i в функцию
	lea	rcx, -1648[rbp] #-1648 - in передача массива интов в функцию
	mov	rsi, rcx
	mov	edi, eax
	call	Task@PLT
	mov	DWORD PTR -12[rbp], eax #-12 - res получение вовзращаемого значения из функции в res
	mov rax, QWORD PTR -1680[rbp]
	add rax, 24
	mov rax, QWORD PTR [rax]
	lea	rsi, .LC1[rip]
	mov rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax #-32 - output
	cmp	DWORD PTR -12[rbp], -1 #-12 - res
	jne	.L5
	mov	rax, QWORD PTR -32[rbp] #-32 - output
	lea	rdx, .LC2[rip]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L6
.L5:
	mov	eax, DWORD PTR -12[rbp]
	mov	r12d, eax #-4 - i
	jmp	.L7
.L8:
	mov	eax, r12d
	mov	eax, DWORD PTR -1648[rbp+rax*4] #-1648 - in
	mov	BYTE PTR -33[rbp], al #-33 - c
	movsx	eax, BYTE PTR -33[rbp] #-33 - c
	mov	rsi, QWORD PTR -32[rbp] #-32 - output
	mov	edi, eax
	call	fputc@PLT
	add	r12d, 1 #-4 - i
.L7:
	mov	edx, DWORD PTR -1652[rbp] #-1652 - N
	mov	eax, DWORD PTR -12[rbp]
	add	eax, edx
	cmp	r12d, eax #-4 - i
	jl	.L8
.L6:
	mov	rdi, QWORD PTR -32[rbp] #-32 - output
	call	fclose@PLT
	jmp	.L9
.L2:
	mov	r12d, 0 #-4 - i
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -1652[rbp] #-1652 - N
	mov	rsi, rax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L11:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -8[rbp], eax #-8 - ch
	mov	eax, r12d #-4 - i
	lea	edx, 1[rax]
	mov	r12d, edx #-4 - i
	cdqe
	mov	edx, DWORD PTR -8[rbp] #-8 - ch
	mov	DWORD PTR -1648[rbp+rax*4], edx #-1648 - in
	cmp	DWORD PTR -8[rbp], -1 #-8 - ch
	je	.L10
	cmp	r12d, 99 #-4 - i
	jle	.L11
.L10:
	mov	eax, DWORD PTR -1652[rbp] #-1652 - N
	mov	edx, r12d #-4 - i
	lea	rcx, -1648[rbp] #-1648 - in
	mov	rsi, rcx
	mov	edi, eax
	call	Task@PLT
	mov	DWORD PTR -12[rbp], eax #-12 - res
	cmp	DWORD PTR -12[rbp], -1 #-12 - res
	jne	.L12
	mov	rax, QWORD PTR stdout[rip]
	lea	rdx, .LC2[rip]
	lea	rsi, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L9
.L12:
	mov	eax, DWORD PTR -12[rbp] #-12 - res
	mov	r12d, eax #-4 - i
	jmp	.L13
.L14:
	mov	eax, r12d #-4 - i
	cdqe
	mov	eax, DWORD PTR -1648[rbp+rax*4] #-1648 - in
	mov	BYTE PTR -13[rbp], al
	movsx	eax, BYTE PTR -13[rbp]
	mov	rdx, QWORD PTR stdout[rip]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
	add	r12d, 1 #-4 - i
.L13:
	mov	edx, DWORD PTR -1652[rbp] #-1652 - N
	mov	eax, DWORD PTR -12[rbp] #-12 - res
	add	eax, edx
	cmp	r12d, eax #-4 - i
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
