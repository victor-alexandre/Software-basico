.section .rodata
tmp01: .double 0.0


.text

.globl calc4
calc4:

	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp 
	
	movq %r12, -8(%rbp)		#//r12 i
	movq %r13, -16(%rbp)	#//r13 n
	movq %r14, -24(%rbp)	#//r14 *a
	
	movl $0, %r12d			#//i = 0;
	
	movl %esi, %r13d
	movq %rdi, %r14		    #//salvo os parametros que entrou na funcao
	
	movsd tmp01, %xmm5      #// inicializo double r = 0.0
	movsd %xmm5, -32(%rbp)  #// salvo esse valor na pilha
	
	for: 
		cmpl %r13d, %r12d
		jge end_for
		
		movsd (%r14), %xmm0 	#// movo conteudo do ponteiro, um vetor de double
		call sin
		
		movsd %xmm0, %xmm5  	#// movo resultado do seno para r 
		addsd -32(%rbp), %xmm5	#//e somo com o valor anterior r= r+sin(*a)
		movsd %xmm5, -32(%rbp)	#//atualizo o valor da pilha
		
		addq $8, %r14			#// a++, ps a é ponteiro
		addl $1, %r12d  		#//i++, ps int é constante
		
		jmp for
						
	end_for:
	
	movq -8(%rbp), %r12	
	movq -16(%rbp), %r13	
	movq -24(%rbp), %r14
	
	
	movsd -32(%rbp), %xmm0	
	
	leave
	ret
	
	
