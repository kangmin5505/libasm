global  _ft_read
extern ___error

section .text
_ft_read:
    push    rbp
    mov     rbp, rsp

    mov     rax, 0x2000003   
    syscall
    jc      .error

    pop     rbp
    ret

.error:
    mov     rdx, rax
    call    ___error
    mov     [rax], rdx

    mov     rax, -1
    pop     rbp
    ret