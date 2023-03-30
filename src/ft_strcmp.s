;   psuedo code for strcmp
;
;   int ft_strcmp(const char *s1, const char *s2) {
;       while (*s1 && *s1 == *s2) {
;           ++s1;
;           ++s2;
;       }
;       return ((unsigned char)*s1 - (unsigned char)*s2);
;   }
global  _ft_strcmp

section .text
_ft_strcmp:
    push    rbp
    mov     rbp, rsp

.loop_start:
    cmp     byte [rdi], 0x00
    je      .loop_end

    mov     dl, [rsi]
    cmp     [rdi], dl
    jne     .loop_end
    inc     rdi
    inc     rsi
    jmp     .loop_start

.loop_end:
    xor     rax, rax
    mov     al, byte [rdi]
    sub     al, byte [rsi]
    movsx   rax, al

    pop     rbp
    ret