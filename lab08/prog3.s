.data

nums:  .int    1,2,3,4,5,6,7,8,9,10
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


  #movl $0, %ecx                              /* ecx = 1        */
  movl     $0, %ebx                          /* ebx = 0        */
  #movq  $nums, %r12                          /* r12 = &nums    */

L1:
  cmpl  $10, %ebx                             /* if (ebx == 10)  */
  je    L2                                   /*    goto L2     */
  
  movl   %ebx, %ecx
  addl  $1, %ecx
  movl  %ecx, %eax                         /* eax = *r12     */
  #imul %eax, %eax                            /* eax = eax * eax    */
  #movl %ecx, %eax                             /* eax = ecx       */
  imul %eax, %eax                            /* eax = eax * eax    */
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
  #addl  $1, %ecx                             /* ecx += 1       */
  addl  $1, %ebx                             /* ebx += 1       */
  #addq  $4, %r12                             /* r12 += 4       */
  jmp  L1                                    /* goto L1        */

L2:

/***************************************************************/
/* Não Mexa!!!                                                 */
/* Mantenha este trecho aqui (finalizacao da main)             */
  movq  $0, %rax               /* %rax = 0  (valor de retorno) */
  movq  -8(%rbp),  %rbx
  movq  -16(%rbp), %r12
  leave
  ret 
