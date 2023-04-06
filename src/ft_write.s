global  _ft_write
extern ___error

section .text
_ft_write:
    push    rbp
    mov     rbp, rsp

    mov     rax, 0x2000004   
    syscall
    jc      .return_error

    pop     rbp
    ret

.return_error:
    mov     rdx, rax
    call    ___error
    mov     [rax], rdx

    mov     rax, -1
    pop     rbp
    ret