.data

nums:  .int    65, -105, 111, 34
Sf:    .string "%d\n"    # string de formato para printf

.text

.globl  main
main:

/*******i*******************************************************/
/* Nao Mexa!!!                                                 */
/* Mantenha este trecho aqui (inicializao da main)             */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)
/***************************************************************/


  movl $0, %eax
  movl     $0, %ebx                          /* ebx = 0        */
  movq  $nums, %r12                          /* r12 = &nums    */
  movl   $0, %edx
  movl $0, %r13d

L1:
  cmpl  $4, %ebx                             /* if (ebx == 4)  */
  je    L2                                   /*    goto L2     */
  
  addl  (%r12), %r13d
  movl  %r13d, %eax

  #movl (%r12), %eax
/***************************************************************/
/* Este trecho imprime o valor de eax na tela:                 */
/*    printf(Sf, eax);                                         */
/*                                                             */              
/* Note que ele coloca zero em eax, para o printf funcionar    */
/*                                                             */
  # movq   $Sf, %rdi               # primeiro parametro (ponteiro)
  # movl  %eax, %esi               # segundo parametro  (inteiro)
  # movl    $0, %eax               # zera eax
  # call  printf                   # chama a funcao da biblioteca
/***************************************************************/

FimL1:
  addl  $1, %ebx                             /* ebx += 1       */
  addq  $4, %r12                             /* r12 += 4       */
  jmp  L1                                    /* goto L1        */



L2:
  movq   $Sf, %rdi               # primeiro parametro (ponteiro)
  movl  %eax, %esi               # segundo parametro  (inteiro)
  movl    $0, %eax               # zera eax
  call  printf                   # chama a funcao da biblioteca
/***************************************************************/
/* Não Mexa!!!                                                 */
/* Mantenha este trecho aqui (finalizacao da main)             */
  movq  $0, %rax               /* %rax = 0  (valor de retorno) */
  movq  -8(%rbp),  %rbx
  movq  -16(%rbp), %r12
  leave
  ret 
