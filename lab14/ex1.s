.data

Str:	.string "val1: %d\nval2: %ld\n" 

.text

			
swap:
	pushq %rbp
	movq %rsp, %rbp
	
	movq 8(%rdi), %r9 #long temp = value->value2
	movsbq (%rdi), %r8
	movq %r8, 8(%rdi)
	movb %r9b, (%rdi)	
	
	leave
	ret
	
.globl main	
main:	
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
		

	
	movb $127, -16(%rbp)
	movq $1025, -8(%rbp)
	
	leaq -16(%rbp), %rdi
	call swap
	
	movq $Str, %rdi
	movsbl -16(%rbp), %esi
	movq -8(%rbp), %rdx
	movl $0, %eax
	
	call printf
	
	movl $0, %eax
				
	
	leave
	ret
	
	
	
	 
	
	
