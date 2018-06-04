.data

nums:  .int    10, -21, -30, 45
Sf:    .string "%d\n"    # string de formato para printf
#Sf1:    .string "%d\n"    # string da soma
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


  movl     $0, %eax                          /* eax = 0  soma dos bagulho*/
  movl     $0, %ebx                          /* ebx = 0      indice i do loop */
 
  movl     $0, %r13d                         /* ecx = 0     variavel para a soma  */
 
  movq  $nums, %r12                          /* r12 = &nums   assume o vetor de ints */

L1:
  cmpl  $4, %ebx                             /* if (ebx == 4)  condicao de teste do loop*/
  je    L2                                   /*    goto L2   sai do loop  */
  addl  (%r12), %eax                         /* eax = *r12  + EAX   */
 
  #addl  (%r12), %r13d                        /* variavel soma recebe ecx + o numero que esta em r12*/

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


  # movq   $Sf1, %rdi              # primeiro parametro (ponteiro)
  # movl  %r13d, %esi              # segundo parametro  (inteiro)
  # movl    $0, %eax               # zera eax 
  # call  printf                   # chama a funcao da biblioteca




/***************************************************************/

  addl  $1, %ebx                             /* ebx += 1       */
  addq  $4, %r12                             /* r12 += 4       */
  jmp  L1                                    /* goto L1        */

L2:

  movq   $Sf, %rdi               # primeiro parametro (ponteiro)
  movl  %eax, %esi               # segundo parametro  (inteiro)
  movl    $0, %eax               # zera eax
  call  printf 

/***************************************************************/
/* Não Mexa!!!                                                 */
/* Mantenha este trecho aqui (finalizacao da main)             */
  movq  $0, %rax               /* %rax = 0  (valor de retorno) */
  movq  -8(%rbp),  %rbx
  movq  -16(%rbp), %r12
  leave
  ret 
