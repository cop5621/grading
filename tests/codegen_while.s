	.file "stdin"
	.text
	.globl main
	.type main, @function
main:
	# prologue, save old base pointer, update stack pointer
	pushq	%rbp
	movq	%rsp, %rbp
	# allocate space for stack local variables
	subq	$96, %rsp
	# prepare args to input_int64_t
	movl 	$0, %eax
	# call returns to %rax
	call	input_int64_t@PLT
	# save return value to inparam
	movq	%rax, -72(%rbp)
.BB0:
	jmp	.BB1
.BB1:
	movq	$1, -32(%rbp)
	mov	-32(%rbp), %rax
	mov	%rax, -64(%rbp)
	jmp	.BB2
.BB2:
	movq	$1, -48(%rbp)
	mov	-48(%rbp), %rax
	mov	-72(%rbp), %rbx
	sub	%rbx, %rax
	mov	%rax, -40(%rbp)
	mov	-40(%rbp), %rax
	cmp	$0, %rax
	jl	.BB4
	jmp	.BB3
.BB3:
	movq	$0, -24(%rbp)
	jmp	.BB5
.BB4:
	movq	$1, -24(%rbp)
	jmp	.BB5
.BB5:
	mov	-24(%rbp), %rax
	cmp	$0, %rax
	je	.BB7
	jmp	.BB6
.BB6:
	movq	$1, -56(%rbp)
	mov	-72(%rbp), %rax
	mov	-56(%rbp), %rbx
	sub	%rbx, %rax
	mov	%rax, -16(%rbp)
	mov	-16(%rbp), %rax
	mov	%rax, -72(%rbp)
	mov	-64(%rbp), %rax
	mov	-72(%rbp), %rbx
	imul	%rbx, %rax
	mov	%rax, -8(%rbp)
	mov	-8(%rbp), %rax
	mov	%rax, -64(%rbp)
	jmp	.BB2
.BB7:
	# call to output_int64_t
	# get outparam
	movq	-64(%rbp), %rax
	# %rdi is the first function argument
	movq	%rax, %rdi
	call	output_int64_t@PLT
	# set main's return value
	movl	$0, %eax
	# epilogue, restore stack pointer, restore old base pointer
	mov	%rbp, %rsp
	pop	%rbp
	ret
