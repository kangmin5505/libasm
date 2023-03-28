;   psuedo code for strcpy
;
;   char *ft_strcpy(char *dst, const char *src) {
;       char *ret = dst;
;       while (*src) {
;           *dst++ = *src++;
;       }
;       *dst = '\0';
;       return ret;
;   }


    section .text
    global  _ft_strcpy

_ft_strcpy:
    push    rbp
    mov     rbp, rsp

    mov    rax, rdi

.loop_start:
    cmp     byte [rsi], 0x00
    je      .loop_end
    mov     dl, [rsi]
    mov     [rdi], dl
    inc     rdi
    inc     rsi
    jmp     .loop_start

.loop_end:
    mov     byte [rdi], 0x00
    
    pop     rbp
    ret