	.file "stdin"
	.text
	.globl main
	.type main, @function
main:
	# prologue, save old base pointer, update stack pointer
	pushq	%rbp
	movq	%rsp, %rbp
	# allocate space for stack local variables
	subq	$80, %rsp
	# prepare args to input_int64_t
	movl 	$0, %eax
	# call returns to %rax
	call	input_int64_t@PLT
	# save return value to inparam
	movq	%rax, -56(%rbp)
.BB0:
	jmp	.BB1
.BB1:
	movq	$0, -16(%rbp)
	mov	-16(%rbp), %rax
	mov	-56(%rbp), %rbx
	sub	%rbx, %rax
	mov	%rax, -40(%rbp)
	mov	-40(%rbp), %rax
	cmp	$0, %rax
	jl	.BB3
	jmp	.BB2
.BB2:
	movq	$0, -8(%rbp)
	jmp	.BB4
.BB3:
	movq	$1, -8(%rbp)
	jmp	.BB4
.BB4:
	mov	-8(%rbp), %rax
	cmp	$0, %rax
	je	.BB6
	jmp	.BB5
.BB5:
	movq	$1, -24(%rbp)
	mov	-24(%rbp), %rax
	mov	%rax, -48(%rbp)
	jmp	.BB7
.BB6:
	movq	$2, -32(%rbp)
	mov	-32(%rbp), %rax
	mov	%rax, -48(%rbp)
	jmp	.BB7
.BB7:
	# call to output_int64_t
	# get outparam
	movq	-48(%rbp), %rax
	# %rdi is the first function argument
	movq	%rax, %rdi
	call	output_int64_t@PLT
	# set main's return value
	movl	$0, %eax
	# epilogue, restore stack pointer, restore old base pointer
	mov	%rbp, %rsp
	pop	%rbp
	ret
