#------------------------------------------------------------------
.data

# Variáveis aqui...

nums:  .int    1, -45, -30, 2, 78, 3, 105, 4, 0, 5, 6 ,7, 8, 9, 10
Sf:    .string "%d\n"    # string de formato para printf

.text
.globl main
main:
#-- Inicializacao: não mexa -------------------------------------
pushq %rbp
movq %rsp, %rbp
subq $128, %rsp
movq %rax, 8(%rsp) ; movq %rbx, 16(%rsp) ; movq %rcx, 24(%rsp)
movq %rdx, 32(%rsp) ; movq %rsi, 40(%rsp) ; movq %rdi, 48(%rsp)
movq %r8, 56(%rsp) ; movq %r9, 64(%rsp) ; movq %r10, 72(%rsp)
movq %r11, 80(%rsp) ; movq %r12, 88(%rsp) ; movq %r13, 96(%rsp)
movq %r14, 104(%rsp) ; movq %r15, 112(%rsp)
#----------------------------------------------------------------

# Código aqui...

    movl $0, %ebx
    movq $nums, %r12
    
    /* só entra no if se ele for maior que zero, menor que 10, e par*/
    /* se ele for menor ou igual a zero ele pula, se for maior que 10 ele pula, se o ultimo bit não for 0 ele pula */
if: cmpl $15, %ebx
        je    endif  
    
    movl (%r12), %r13d
    cmpl $0, %r13d
        jle    incrementa
        
    cmpl $10, %r13d
        jg     incrementa
    
    testl $1, %r13d
        jne    incrementa

    movl %r13d, %eax
    call print_eax_as_int 
        
incrementa:
    
    addl $1, %ebx
    addq $4, %r12
    jmp if        

endif:


#-- Finalizacao: não mexa ---------------------------------------
movq 8(%rsp), %rax ; movq 16(%rsp), %rbx ; movq 24(%rsp), %rcx
movq 32(%rsp), %rdx ; movq 40(%rsp), %rsi ; movq 48(%rsp), %rdi
movq 56(%rsp), %r8 ; movq 64(%rsp), %r9 ; movq 72(%rsp), %r10
movq 80(%rsp), %r11 ; movq 88(%rsp), %r12 ; movq 96(%rsp), %r13
movq 104(%rsp), %r14 ; movq 112(%rsp), %r15
movl $0, %eax
leave
ret
#------------------------------------------------------------------
