.text


.globl foo
foo:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	
	
	movq %r12, -8(%rbp)
	movq %r13, -24(%rbp)
	
	movl %esi, %r12d
	movl %edx, %r13d

	
while:
	movl %r12d, %r8d
	subl $1, %r12d
	
	cmpl $0, %r8d
	je  fim
	
	movq %rdi, -16(%rbp)
	movl (%rdi), %edi
	movl %r13d, %esi
	call f
	
	movq -16(%rbp), %rdi
	movl %eax, 4(%rdi)
	
	addq $8, %rdi
	
	jmp while
	
fim:	
	
	
	movq -8(%rbp), %r12
	movq -24(%rbp), %r13
	leave
	ret
