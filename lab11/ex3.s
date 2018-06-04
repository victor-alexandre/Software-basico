.data

str: .String "color: %ld\n"

.align 8
c1: 
	.int 0  #int x
	.int 0  #int y
	.int 0  #int r
	.byte 0 #char filled
	.zero 3 #padding
	.quad 0 #long color; 

.text

.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq %r12, -8(%rbp)

	movq $c1, %r12

	movl $10, (%r12)
	movl $20, -4(%r12)
	movl $40, -8(%r12)
	movl $1, -12(%r12)

if:
	cmpl $30, -8(%r12) #if  c1.r > 30
	jle else

	movq $2, -16(%r12) #c1.color = RED

else:
	movq $1, -16(%r12) #c1.color = BLUE


	movq %str, %rdi
	movl %eax, %esi
	movl $0, %eax
	call printf