#------------------------------------------------------------------
.data
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


# Código aqui...



















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