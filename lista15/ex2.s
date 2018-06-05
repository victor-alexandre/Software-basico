/*
struct date_t
	int ano   0-4
	char mes 4-5
	char dia 5-6

struct pessoa_t
	char *nome  0-8
	struct date_t nascimento 8-16
*/
.data

str1:	.string "Ernesto"
str2:	.string "Borges"
str3:	.string "Cecilia"
str4:	.string "%s nasceu no mesmo dia de %s\n"

.text

.globl compare
compare:
	pushq %rbp
	movq %rsp, %rbp

	movl $0, %eax
	
	if01:
	movb 5(%rdi), %r10b #movi o conteudo da struct para o registrador temp r10b
		cmpb %r10b, 5(%rsi)
		jne end_if
	if02:
	movb 4(%rdi), %r10b #movi o conteudo da struct para o registrador temp r10b
		cmpb %r10b, 4(%rsi)
		jne end_if
	if03:
	movl (%rdi), %r10d #movi o conteudo da struct para o registrador temp r10b
		cmpl %r10d, (%rsi)
		jne end_if

		movl $1, %eax

	end_if:

	leave
	ret

.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	
	movq %r12, -8(%rbp)
	movq %r13, -16(%rbp)

	movq $str1, -64(%rbp) #p[0].nome = "Ernesto";
	movl $2002, -56(%rbp)
	movb $3, -52(%rbp)
	movb $15, -51(%rbp)

	movq $str3, -48(%rbp) # p[1].nome = "Cecilia";
	movl $2001, -40(%rbp)
	movb $8, -36(%rbp)
	movb $2, -35(%rbp)

	movq $str2, -32(%rbp) #p[2].nome = "Borges";
	movl $2002, -24(%rbp)
	movb $3, -20(%rbp)
	movb $15, -19(%rbp)

	movl $0, %r12d #i = 0
	movl $0, %r13d #j = 0

	for01:
		cmpl $3, %r12d
		jge		end_for01

		movl $0, %r13d #j = 0
		
		for02:
			cmpl $3, %r13d
			jge 	end_for02

			if_for02:
				movl %r12d, %r10d #r10d = i
				cmpl %r10d, %r13d  #i == j
					jne 	if02_for02

						jmp continue_for02

				if02_for02:
					leaq -56(%rbp), %rdi
					imull $16, %r12d, %r10d 
					addq %r10, %rdi #rdi = &p[i].nascimento

					leaq -56(%rbp), %rsi
					imull $16, %r13d, %r8d 
					addq %r8, %rsi #rsi = &p[j].nascimento

					call compare

					cmpl $1, %eax
						jne continue_for02

						movq $str4, %rdi

						leaq -64(%rbp), %r8
						imull $16, %r12d, %r10d #rdi = &p[i].nome
						addq %r10, %r8
						movq (%r8), %rsi
						
						leaq -64(%rbp), %r8
						imull $16, %r13d, %r10d #rdi = &p[j].nome
						addq %r10, %r8
						movq (%r8), %rdx
						movl $0, %eax
						call printf


		continue_for02: # incrementa for02
			incl %r13d
			jmp for02

		end_for02:
	
	incl %r12d
	jmp for01	
	
	end_for01:
	movq -8(%rbp), %r12
	movq -16(%rbp), %r13
	movl $0, %eax #return = 0;
	leave
	ret
	