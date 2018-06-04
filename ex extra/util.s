.data

.Lfmt01:  .string "%ld\n"
.Lfmt02:  .string "%lu\n"
.Lfmt03:  .string "%d\n"
.Lfmt04:  .string "%u\n"
.Lfmt05:  .string "%p\n"
.Lfmt06:  .string "%s\n"

.Lbuf: .zero 1024

#-----------------------------------------------------------------------
.text

.globl read_int_to_eax
.globl read_long_to_rax
.globl read_string_to_rax

.globl print_rax_as_string
.globl print_rax_as_long
.globl print_rax_as_ulong
.globl print_rax_as_hex
.globl print_eax_as_int
.globl print_eax_as_uint

#-----------------------------------------------------------------------
read_int_to_eax:
   subq  $128, %rsp

   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)

   movq  $.Lbuf, %rdi
   movq   $1024, %rsi
   movq   stdin, %rdx
   call fgets
   
   movl     $0, %eax
   movq $.Lbuf, %rdi
   call atoi
   
   #movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
read_long_to_rax:
   subq  $128, %rsp

   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)

   movq  $.Lbuf, %rdi
   movq $1024, %rsi
   movq stdin, %rdx
   call fgets
   
   movl   $0, %eax
   movq $.Lbuf, %rdi
   call atol
   
   #movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
read_string_to_rax:
   subq  $128, %rsp

   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)
   movq %r12, 80(%rsp)

   movq  %rax, %r12

   movq  %rax, %rdi
   movq  $128, %rsi
   movq stdin, %rdx
   call fgets

#--- remove '\n'
   movl $0, %ecx
.L1:
   cmpl $128, %ecx
   je   .L2

   xorq %rax,   %rax
   movb (%r12), %al
   cmpb $10,    %al
   jne  .L3
   movb $0, (%r12)
.L3:
   incq %r12
   incl %ecx
   jmp  .L1
.L2:
#---

   movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   movq 80(%rsp), %r12

   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
print_rax_as_string:
   subq  $128, %rsp
   
   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)
   
   movq $.Lfmt06, %rdi
   movq   %rax, %rsi
   movl     $0, %eax
   call printf
   
   movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
print_rax_as_long:
   subq  $128, %rsp
   
   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)
   
   movq $.Lfmt01, %rdi
   movq   %rax, %rsi
   movl     $0, %eax
   call printf
   
   movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
print_rax_as_ulong:
   subq  $128, %rsp
   
   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)
   
   movq $.Lfmt02, %rdi
   movq   %rax, %rsi
   movl     $0, %eax
   call printf
   
   movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
print_eax_as_int:
   subq  $128, %rsp
   
   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)
   
   movq $.Lfmt03, %rdi
   movl   %eax, %esi
   movl     $0, %eax
   call printf
   
   movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
print_eax_as_uint:
   subq  $128, %rsp
   
   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)
   
   movq $.Lfmt04, %rdi
   movl   %eax, %esi
   movl     $0, %eax
   call printf
   
   movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret

#-----------------------------------------------------------------------
print_rax_as_hex:
   subq  $128, %rsp
   
   movq %rax,  8(%rsp)
   movq %rcx, 16(%rsp)
   movq %rdx, 24(%rsp)
   movq  %r8, 32(%rsp)
   movq  %r9, 40(%rsp)
   movq %r10, 48(%rsp)
   movq %r11, 56(%rsp)
   movq %rdi, 64(%rsp)
   movq %rsi, 72(%rsp)
   
   movq $.Lfmt05, %rdi
   movq   %rax, %rsi
   movl     $0, %eax
   call printf
   
   movq  8(%rsp), %rax
   movq 16(%rsp), %rcx
   movq 24(%rsp), %rdx
   movq 32(%rsp), %r8
   movq 40(%rsp), %r9
   movq 48(%rsp), %r10
   movq 56(%rsp), %r11
   movq 64(%rsp), %rdi
   movq 72(%rsp), %rsi
   
   addq $128, %rsp
   ret
