.data

.Lname_e:	.string "Ernesto"
.Lname_b:	.string "Borges"
.Lname_c:	.string "Cecilia"
.Lfmt:		.string "%s nasceu no mesmo dia de %s\n"

.text

.globl	main
.globl	compare		# int compare(struct date_t *d1, struct date_t *d2)

compare:
pushq	%rbp
movq	%rsp, %rbp

movl	$0, %eax	# %eax: resp; resp = 0

movb	5(%rdi), %cl	# temp = d1->dia
cmpb	%cl, 5(%rsi)	# if( d1->dia == d20->dia && ...
jne	.Lendif

movb	4(%rdi), %dl	# temp = d1->mes
cmpb	%dl, 4(%rsi)	# if( ... && d1->mes == d20->mes && ...
jne	.Lendif

movl	(%rdi), %r8d	# temp = d1->ano
cmpl	%r8d, (%rsi)	# if( ... && d1->ano == d20->ano )
jne	.Lendif

	movl	$1, %eax	# resp = 1

.Lendif:

leave
ret	# return resp

main:
pushq	%rbp
movq	%rsp, %rbp
subq	$64, %rsp
movq	%rbx, -8(%rbp)
movq	%r12, -16(%rbp)

# %ebx: int i
# %r12d: int j
# -64(%rbp): struct pessoa_t p, -48(%rbp): p[1], -32(%rbp): p[2]

movq	$.Lname_e, -64(%rbp)	# p[0].nome = "Ernesto"
movl	$2002, -56(%rbp)	# p[0].nascimento.ano = 2002
movb	$3, -52(%rbp)		# p[0].nascimento.mes = 3
movb	$15, -51(%rbp)		# p[0].nascimento.dia = 15

movq	$.Lname_b, -48(%rbp)	# p[1].nome = "Borges"
movl	$2002, -40(%rbp)	# p[1].nascimento.ano = 2002
movb	$3, -36(%rbp)		# p[1].nascimento.mes = 3
movb	$15, -35(%rbp)		# p[1].nascimento.dia = 15

movq	$.Lname_c, -32(%rbp)	# p[2].nome = "Cecilia"
movl	$2001, -24(%rbp)	# p[2].nascimento.ano = 2001
movb	$8, -20(%rbp)		# p[2].nascimento.mes = 8
movb	$2, -19(%rbp)		# p[2].nascimento.dia = 2

movl	$0, %ebx	# for (i = 0; i < 3 ; i++)
.Lfor:
cmpl	$3, %ebx	# for (i = 0; i < 3 ; i++)
jge	.Lendfor

	movl	$0, %r12d	# for (j = 0; j < 3 ; j++)
	.Lfor2:
	cmpl	$3, %r12d	# for (i = 0; i < 3 ; i++)
	jge	.Lendfor2

		cmpl	%ebx, %r12d	# if(i == j)
		jne	.Lendif2

			jmp	.Lcontinuefor2

		.Lendif2:

		leaq	-56(%rbp), %rdi		# arg1: &p[0].nascimento
		movl	%ebx, %eax		# temp = i
		imull	$16, %eax		# temp = i*sizeof(p[0])
		addq	%rax, %rdi		# arg1: &p[i].nascimento

		leaq	-56(%rbp), %rsi		# arg2: &p[0].nascimento
		movl	%r12d, %ecx		# temp = j
		imull	$16, %ecx		# temp = j*sizeof(p[0])
		addq	%rcx, %rsi		# arg2: &p[j].nascimento

		call	compare		# compare(&p[i].nascimento, &p[j].nascimento)
		cmpl	$0, %eax	# if(compare(&p[i].nascimento, &p[j].nascimento))
		je	.Lendif3

			movq	$.Lfmt, %rdi		# arg1: "%s nasceu no mesmo dia de %s\n"

			leaq	-64(%rbp), %r8		# temp = &p[0].nome
			movl	%ebx, %r9d		# temp2 = i
			imull	$16, %r9d		# temp2 = i*sizeof(p[0])
			addq	%r9, %r8		# temp = &p[i].nome
			movq	(%r8), %rsi		# arg2: p[i].nome

			leaq	-64(%rbp), %r10		# temp = &p[0].nome
			movl	%r12d, %r11d		# temp2 = j
			imull	$16, %r11d		# temp2 = j*sizeof(p[0])
			addq	%r11, %r10		# temp = &p[j].nome
			movq	(%r10), %rdx		# arg3: p[j].nome

			movl	$0, %eax
			call	printf	# printf("%s nasceu no mesmo dia de %s\n", p[i].nome, p[j].nome)

		.Lendif3:

	.Lcontinuefor2:
	incl	%r12d		# for (i = 0; i < 3 ; i++)
	jmp	.Lfor2
	.Lendfor2:

incl	%ebx		# for (i = 0; i < 3 ; i++)
jmp	.Lfor
.Lendfor:

movl	$0, %eax	# return 0

movq	-8(%rbp), %rbx
movq	-16(%rbp), %r12
leave
ret