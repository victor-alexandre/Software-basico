#------------------------------------------------------------------
.data
nums:  .int    0, 0, 0
str:      .string "\n"
str01:    .string "="    # string de formato para printf
str02:    .string "^"    # string de formato para printf
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


    movl     $1, %ebx                          /* ebx = 0        */
    movl $0, %r13d
    movl $0, %r14d

	call read_int_to_eax	
	movl %eax, %r14d                /*contador*/


L1:
	cmpl  %r14d, %ebx                             /* if (ebx > r14d)  */
    jg    LF     

    movl %ebx, %r12d
    shll  $31, %r12d

L2: cmpl $0, %r12d								/* if (*r12d != 0 )  */
	jne    L1add

	movl %ebx, %eax
	call print_eax_as_int
	
	movq $str02, %rax
	call print_rax_as_string

	movl %ebx, %eax
	call print_eax_as_int

	movq $str01, %rax
	call print_rax_as_string

    movl %ebx, %r12d
    imul %r12d, %r12d	

    movl %r12d, %eax
	call print_eax_as_int

	movq $str, %rax
	call print_rax_as_string

L1add:
	addl  $1, %ebx                             /* ebx += 1       */
    jmp   L1                                    /* goto L1        */



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