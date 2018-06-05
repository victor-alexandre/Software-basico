.data
str1: .string "%d/%d/%d"
str2: .string "Nome: %s, nascido %s\n"
nome: .string "Ernesto"
.text

.globl format
format:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq %rsi, -8(%rbp)


	#movq (%rdi), %rdi
	movq $str1, %rsi
	movq -8(%rbp), %rax

	movzbl 5(%rax), %edx #dia
	movzbl 4(%rax), %ecx #mes
	movl (%rax), %r8d #ano
	movl $0, %eax
	call sprintf

	leave
	ret

.globl show
show:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq %r12, -32(%rbp)
	movq %rdi, %r12 # r12 = struct pessoa_t *p

	leaq -11(%rbp), %rdi #char data[11]
	leaq 8(%r12), %rsi
	call format

	movq $str2, %rdi
	movq (%r12), %rsi
	leaq -11(%rbp), %rdx
	movl $0, %eax
	call printf

	movq -32(%rbp), %r12
	leave
	ret

.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	#movq $nome, %r9
	movq $nome, -16(%rbp)
	movl $2002, -8(%rbp)
	movb $3, -4(%rbp)
	movb $15, -3(%rbp)

	leaq -16(%rbp), %rdi
	call show

	movl $0, %eax
	leave
	ret
