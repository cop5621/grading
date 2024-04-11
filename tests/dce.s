	.file "tests/dce.while"
	.text
	.globl main
	.type main, @function
main:
	# prologue, save old base pointer, update stack pointer
	pushq	%rbp
	movq	%rsp, %rbp
	# allocate space for stack local variables
	subq	$32, %rsp
	# prepare args to input_int64_t
	movl 	$0, %eax
	# call returns to %rax
	call	input_int64_t@PLT
	# save return value to inparam
	movq	%rax, -16(%rbp)
.BB0:
	jmp	.BB1
.BB1:
	movq	$17, -8(%rbp)
	jmp	.BB2
.BB2:
	# call to output_int64_t
	# get outparam
	movq	-8(%rbp), %rax
	# %rdi is the first function argument
	movq	%rax, %rdi
	call	output_int64_t@PLT
	# set main's return value
	movl	$0, %eax
	# epilogue, restore stack pointer, restore old base pointer
	mov	%rbp, %rsp
	pop	%rbp
	ret
