.data

S2:    .byte   65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0
Sf:    .string "%c"    /* primeira string de formato para printf */
Sf2:   .string "\n"    /* segunda string de formato para printf  */

.text

.globl  main
main:

/********************************************************/
/* Não mexa!                                            */
/* mantenha este trecho aqui - incializacao da main     */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/


  movq  $S2, %r12         /* r12 = &S2 */

L1:
  cmpb  $0, (%r12)        /* if (*pc == 0) ? */
  je  L2                  /* goto L2 */

  movsbl  (%r12), %eax    /* eax = *r12 (estendendo o  */
                          /* byte para 32 bits)        */

L5: 
  cmpb $97, (%r12)  #aqui eu testo se é "a" se for eu pulo essa etapa, ou seja eu não imprimo ela
  je  incrementa
  
L6: 
  cmpb $65, (%r12) #aqui eu testo se é "A" se for eu pulo essa etapa, ou seja eu não imprimo ela
  je  incrementa   
/*************************************************************/
/* Este trecho imprime o valor de %eax (estraga %eax)        */
  movq   $Sf, %rdi           /* primeiro parametro (ponteiro)*/
  movl  %eax, %esi           /* segundo parametro  (inteiro) */
  movl    $0, %eax
  call  printf               /* chama a funcao da biblioteca */
/*************************************************************/

incrementa:
  addq $1, %r12                                 /* r12 += 1; */
  jmp  L1                                       /* goto L1;  */

L2:
/*************************************************************/
/* Este trecho imprime o '\n' (estraga %eax)                 */
  movq  $Sf2, %rdi           /* primeiro parametro (ponteiro)*/
  movl    $0, %eax
  call  printf               /* chama a funcao da biblioteca */
/*************************************************************/


/*************************************************************/
/* Não mexa!                                                 */
/* mantenha este trecho aqui - finalizacao da main           */
  movq  $0, %rax              /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12     /* recupera r12                */
  movq    -8(%rbp), %rbx      /* recupera rbx                */
  leave
  ret
/*************************************************************/
