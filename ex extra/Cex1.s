#------------------------------------------------------------------
.data
nums:  .int    0, 0, 0
str:      .string  "Media: "
str01:    .string "Aprovado "    # string de formato para printf
str02:    .string "Reprovado "    # string de formato para printf
# Variáveis aqui...
.text
.globl main
main:

#-- Inicializacao: não mexa -------------------------------------
pushq %rbp
movq  %rsp,  %rbp
subq  $128,  %rsp
movq %rax,   8(%rsp) ; movq %rbx,  16(%rsp) ; movq %rcx, 24(%rsp)
movq %rdx,  32(%rsp) ; movq %rsi,  40(%rsp) ; movq %rdi, 48(%rsp)
movq  %r8,  56(%rsp) ; movq  %r9,  64(%rsp) ; movq %r10, 72(%rsp)
movq %r11,  80(%rsp) ; movq %r12,  88(%rsp) ; movq %r13, 96(%rsp)
movq %r14, 104(%rsp) ; movq %r15, 112(%rsp)
#----------------------------------------------------------------


    movl     $0, %ebx                          /* ebx = 0        */
    movq  $nums, %r12                          /* r12 = &nums    */
    movl $0, %r13d


	call read_int_to_eax	
	addl %eax, %r13d
	
	call read_int_to_eax	
	addl %eax, %r13d

	call read_int_to_eax	
	addl %eax, %r13d


	movl $0, %edx
	movl %r13d, %eax 
	movl $3, %ebx
	idivl %ebx
	movl %eax, %r13d                          /* r13d recebe a nota final, que é a soma dividido por 3*/
	

	movq $str, %rax
	call print_rax_as_string
	
	movl %r13d, %eax                          /* r13d recebe a nota final, que é a soma dividido por 3*/
	
	call print_eax_as_int          /*nota final*/
	

	

L2: cmpl $6, %r13d								/* if (r13d >= 6)  */
	jge    Ap
	
	movq $str02, %rax
	call print_rax_as_string
	jmp Fim

Ap:
	movq $str01, %rax
	call print_rax_as_string


Fim:


#-- Finalizacao: não mexa ---------------------------------------
movq   8(%rsp), %rax ; movq  16(%rsp), %rbx ; movq 24(%rsp), %rcx
movq  32(%rsp), %rdx ; movq  40(%rsp), %rsi ; movq 48(%rsp), %rdi
movq  56(%rsp), %r8  ; movq  64(%rsp), %r9  ; movq 72(%rsp), %r10
movq  80(%rsp), %r11 ; movq  88(%rsp), %r12 ; movq 96(%rsp), %r13
movq 104(%rsp), %r14 ; movq 112(%rsp), %r15
movl $0, %eax
leave
ret
#------------------------------------------------------------------