
.text

.globl foo

foo:
    pushq %rbp
    movq %rsp, %rbp

    #%esi == n
    #rdi == int a[]; observe que ele é um ponteiro por isso tem que ser o rdi

    movl $0, %ecx   #i
    movl $0, %edx    #s

loop_for:
    cmpl %esi, %ecx
    jge end_for

    movl %ecx, %r8d             #r8 recebe um endereco
    imull $4, %r8d, %r8d        #r8d contem a[i]
    addq %rdi, %r8
    addl (%r8), %edx

if:
    cmpl $0, (%r8)
    jne end_if


    movl %edx, (%r8)
    movl $0, %edx

end_if:
    incl %ecx            #PARTE DE INCREMENTAR O FOR
    jmp loop_for

end_for:
    leave
    ret
