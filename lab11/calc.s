.text

.globl calc
calc: 

	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	
	movq %r12, -8(%rbp)
	movq %r13, -16(%rbp)
	movq %r14, -24(%rbp)
	movq %r15, -32(%rbp)
	movq %rbx, -40(%rbp)
	
	movl $0, %ebx    #guardará a soma de i + j + k

	movl %edi, %r12d # recebe o 1º parametro
	movl %esi, %r13d # recebe o 2º parametro
	movl %edx, %r14d # recebe o 3º parametro
	movl %ecx, %r15d # recebe o 4º parametro
	
	
	addl $1, %edi
	addl $2, %edx
	
	call sum 
	
	addl %eax, %ebx
	
	movl %r13d, %edi
	movl %r15d, %esi
	addl $1, %esi
	movl %r12d, %edx
	movl %r14d, %ecx
	addl $2, %ecx
	
	call sum
	
	addl %eax, %ebx
	
	movl %r12d, %edi
	subl $1, %edi
	movl %r13d, %esi
	movl %r14d, %edx
	subl $2, %edx
	movl %r15d, %ecx
	
	call sum
	
	addl %eax, %ebx
	
	movl %ebx, %eax

	movq -8(%rbp),  %r12 
	movq -16(%rbp), %r13
	movq -24(%rbp), %r14
	movq -32(%rbp), %r15
	movq -40(%rbp), %rbx

	leave
	ret
	
	
	
	 
