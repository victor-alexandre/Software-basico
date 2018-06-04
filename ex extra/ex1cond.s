#------------------------------------------------------------------
.data
nums:  .int    0, 0, 0
str01:    .string " Aprovado \n"    # string de formato para printf
str02:    .string " Reprovado \n"    # string de formato para printf
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
	movl %eax, (%r12)
	
	call read_int_to_eax	
	movl %eax, 4(%r12)

	call read_int_to_eax	
	movl %eax, 8(%r12)


L1:
	cmpl  $3, %ebx                             /* if (ebx == 3)  */
    je    LF     

L2: cmpl $6, (%r12)								/* if (*r12 > 6)  */
	jgE    L1A

	movl (%r12), %eax
	call print_eax_as_int
	
	movq $str02, %rax
	call print_rax_as_string

L1end:
	addl  $1, %ebx                             /* ebx += 1       */
    addq  $4, %r12                             /* r12 += 4       */
    jmp   L1                                    /* goto L1        */

L1A:
	movl (%r12), %eax
	call print_eax_as_int

	movq $str01, %rax
	call print_rax_as_string
	jmp L1end


LF:


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