.text

.globl fat 
fat:
	pushq %rbp 
	movq %rsp, %rbp 
	subq $16, %rsp

	cmpl $0, %edi #parametro da função fat(int n) 
	jne else_if
	
	movl $1, %eax 
	jmp end_if


else_if: 
	movq %rdi, -8(%rbp) #salva na pilha o valor do n, pq nesse momento essa função é a caller 
	subl $1, %edi 
	call fat 
	movq -8(%rbp), %rdi 
	imull %edi, %eax


end_if:
	leave 
	ret