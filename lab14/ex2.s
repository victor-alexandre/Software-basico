.data
str: 	.string "sum: %d\n"
.text


sum:
	pushq %rbp
	movq %rsp, %rbp
	
	movq $0, %r11

	while:
		cmpl $0, %esi
		je	end_while

		subl $1, %esi
		imull $8, %esi, %r8d
		
		addq %rdi, %r8
		addq (%r8), %r11

		jmp while
		
	end_while:

	movq %r11, %rax

	leave
	ret


.globl main
main:
	
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp

	movq %r12, -8(%rbp)
	movq %r13, -16(%rbp)
	



	movl $5, -64(%rbp)
	movq $2, -56(%rbp)
	movq $2, -48(%rbp)
	movq $3, -40(%rbp)
	movq $3, -32(%rbp)
	movq $4, -24(%rbp)
	
	leaq -56(%rbp), %rdi
	movl -64(%rbp), %esi

	call sum

	movq %rax, %r13

	movq $str, %rdi
	movq %r13, %rsi
	movl $0, %eax
	call printf

	movl $0, %eax


	movq -16(%rbp), %r13
	movq -8(%rbp),  %r12

	leave
	ret
