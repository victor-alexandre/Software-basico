.data

nums:  .byte    1,6,-2,9
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



  movl     $0, %ebx                          /* ebx = 0        */ # ele recebe um número, aqui ele está sendo um contador
  movq  $nums, %r12                          /* r12 = &nums    */ #observe que tem que ser movq pq o registrador é 64 bits, ele aponta para o endereço de de nums
                                                                  # r12 aqui é um ponteiro, ele sempre é 64bits, não posso chamar r12b, r12d e etc, APENAS r12 pois ele é um ponteiro *ptr
                                                                  # o que eu vou alterar é na sintaxe movb, movl, addb, addl e etc 
L1:
  cmpl  $4, %ebx                             /* if (ebx == 4)  */
  je    L2

  movb  (%r12), %al                         /* al = *r12     */   # aqui eu movo o valor apontado por r12 para um endereço de 1byte que é o al 
  movsbl %al, %eax                                                # aqui eu faço um casting COM SINALLL int = char;

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
  addq  $1, %r12                             /* r12 += 1       */#aritmética de ponteiro preciso mostrar isso em addq, mas eu ando só 1byte pq r12 aponta para um vetor de inteiros
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
