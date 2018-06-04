.text

.globl add
add:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq %r12, -8(%rbp)

	movl $0, %r12d

	addl %edi, %r12d
	addl %esi, %r12d
	addl %edx, %r12d

	movl %r12d, %eax

	movq -8(%rbp), %r12
	leave
	ret