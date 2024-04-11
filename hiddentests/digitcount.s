	.file "stdin"
	.text
	.globl main
	.type main, @function
main:
	# prologue, save old base pointer, update stack pointer
	pushq	%rbp
	movq	%rsp, %rbp
	# allocate space for stack local variables
	subq	$192, %rsp
	# prepare args to input_int64_t
	movl 	$0, %eax
	# call returns to %rax
	call	input_int64_t@PLT
	# save return value to inparam
	movq	%rax, -168(%rbp)

.BB0:
	jmp	.BB1


.BB1:
	# x := inparam
	mov	-168(%rbp), %rax
	mov	%rax, -16(%rbp)
	# _t0 := 0
	movq	$0, -112(%rbp)
	# _t2 := x - _t0
	mov	-16(%rbp), %rax
	mov	-112(%rbp), %rbx
	sub	%rbx, %rax
	mov	%rax, -152(%rbp)
	# test _t2 < 0
	mov	-152(%rbp), %rax
	cmp	$0, %rax
	jl	.BB3
	jmp	.BB2


.BB2:
	# _t1 := 0
	movq	$0, -64(%rbp)
	jmp	.BB4


.BB3:
	# _t1 := 1
	movq	$1, -64(%rbp)
	jmp	.BB4


.BB4:
	# test _t1 = 0
	mov	-64(%rbp), %rax
	cmp	$0, %rax
	je	.BB6
	jmp	.BB5


.BB5:
	# _t3 := 0
	movq	$0, -128(%rbp)
	# _t4 := 1
	movq	$1, -40(%rbp)
	# _t5 := _t3 - _t4
	mov	-128(%rbp), %rax
	mov	-40(%rbp), %rbx
	sub	%rbx, %rax
	mov	%rax, -72(%rbp)
	# _t6 := x * _t5
	mov	-16(%rbp), %rax
	mov	-72(%rbp), %rbx
	imul	%rbx, %rax
	mov	%rax, -120(%rbp)
	# x := _t6
	mov	-120(%rbp), %rax
	mov	%rax, -16(%rbp)
	jmp	.BB6


.BB6:
	# _t7 := 0
	movq	$0, -104(%rbp)
	# count := _t7
	mov	-104(%rbp), %rax
	mov	%rax, -80(%rbp)
	jmp	.BB7


.BB7:
	# _t8 := 10
	movq	$10, -96(%rbp)
	# _t10 := x - _t8
	mov	-16(%rbp), %rax
	mov	-96(%rbp), %rbx
	sub	%rbx, %rax
	mov	%rax, -24(%rbp)
	# test _t10 < 0
	mov	-24(%rbp), %rax
	cmp	$0, %rax
	jl	.BB9
	jmp	.BB8


.BB8:
	# _t9 := 1
	movq	$1, -32(%rbp)
	jmp	.BB10


.BB9:
	# _t9 := 0
	movq	$0, -32(%rbp)
	jmp	.BB10


.BB10:
	# test _t9 = 0
	mov	-32(%rbp), %rax
	cmp	$0, %rax
	je	.BB12
	jmp	.BB11


.BB11:
	# _t11 := 10
	movq	$10, -56(%rbp)
	# _t12 := x / _t11
	mov	-16(%rbp), %rax
	mov	-56(%rbp), %rbx
	cdq
	idiv	%rbx
	mov	%rax, -48(%rbp)
	# x := _t12
	mov	-48(%rbp), %rax
	mov	%rax, -16(%rbp)
	# _t13 := 1
	movq	$1, -8(%rbp)
	# _t14 := count + _t13
	mov	-80(%rbp), %rax
	mov	-8(%rbp), %rbx
	add	%rbx, %rax
	mov	%rax, -136(%rbp)
	# count := _t14
	mov	-136(%rbp), %rax
	mov	%rax, -80(%rbp)
	jmp	.BB7


.BB12:
	# _t15 := 1
	movq	$1, -88(%rbp)
	# _t16 := count + _t15
	mov	-80(%rbp), %rax
	mov	-88(%rbp), %rbx
	add	%rbx, %rax
	mov	%rax, -144(%rbp)
	# count := _t16
	mov	-144(%rbp), %rax
	mov	%rax, -80(%rbp)
	# outparam := count
	mov	-80(%rbp), %rax
	mov	%rax, -160(%rbp)
	jmp	.BB13


.BB13:

	# call to output_int64_t
	# get outparam
	movq	-160(%rbp), %rax
	# %rdi is the first function argument
	movq	%rax, %rdi
	call	output_int64_t@PLT
	# set main's return value
	movl	$0, %eax
	# epilogue, restore stack pointer, restore old base pointer
	mov	%rbp, %rsp
	pop	%rbp
	ret
