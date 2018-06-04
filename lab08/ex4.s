.data

nums:  .int    10, -21, -30, 45
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


  
  movl     $0, %ebx                          /* ebx = 0        */
  movq  $nums, %r12                          /* r12 = &nums    */
  movl $0, %r13d
  
loopfor01:
  cmpl  $4, %ebx                             /* if (ebx == 4)  */
  je    endfor01                                   /*    goto L2     */
  
  movl  %ebx, %eax
  imull $4, %eax, %eax
  movl  %eax, %r14d             #esse cara é o indice que vamos multiplicar
  
  addq %r14, %r12
  movl  (%r12), %eax              # imprime eax
 # movl %r13d, %eax                         /* eax = *r12     */

/***************************************************************/
/* Este trecho imprime o valor de eax na tela:                 */
/*    printf(Sf, eax);                                         */
/*                                                             */              
/* Note que ele coloca zero em eax, para o printf funcionar    */
/*                                                             */
  movq   $Sf, %rdi               # primeiro parametro (ponteiro)
  movl  %eax, %esi               # segundo parametro  (inteiro)
  movl    $0, %eax               # zera eax
  call  printf                   # chama a funcao da biblioteca
/***************************************************************/

  addl  $1, %ebx                             /* ebx += 1       */
  #addq  $4, %r12                             /* r12 += 4       */
  jmp  loopfor01                                    /* goto L1        */

endfor01:

/***************************************************************/
/* Não Mexa!!!                                                 */
/* Mantenha este trecho aqui (finalizacao da main)             */
  movq  $0, %rax               /* %rax = 0  (valor de retorno) */
  movq  -8(%rbp),  %rbx
  movq  -16(%rbp), %r12
  leave
  ret 
