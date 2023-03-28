;   psuedo code for ft_strlen
;
;   #include <sys/types.h>
;
;   size_t  ft_strlen(const char *s) {
;       size_t len = 0;
;
;       while (s[len])
;           len++;
;       return len;
;   }

    section .text
    global  _ft_strlen
    
_ft_strlen:
    push    rbp
    mov     rbp, rsp

    xor     rax, rax
    
.loop_start:
    cmp     byte [rdi + rax], 0x00
    je      .loop_end
    inc     rax
    jmp     .loop_start
    
.loop_end:
    pop     rbp
    ret