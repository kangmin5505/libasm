;   pseudo code for ft_strdup
;
;   #include <string.h>
;   #include <stdlib.h>
;
;   char *ft_strdup(const char *s1) {
;       char *s2 = malloc(strlen(s1) + 1);
;       if (s2 == NULL) {
;           return NULL;
;       }
;       char *ret = s2;
;       while (*s1) {
;           *s2++ = *s1++;
;       }
;       *s2 = '\0';
;       return ret;
;   }
    section .text
    global  _ft_strdup
    extern  _malloc
    extern  _ft_strlen

_ft_strdup:
    push    rbp
    mov     rbp, rsp

    push    rdi             
    call    _ft_strlen
    inc     rax
    mov     rdi, rax
    call    _malloc
    mov     rdx, rax        ;   rdx = s2

    cmp     rdx, 0x00
    je      .null_error

    mov     rsi, [rsp]        ;   rsi = s1
    mov     rcx, rdx        ;   rcx = ret

.loop_start:
    cmp     byte [rsi], 0x00
    je      .loop_end
    mov     r8b, [rsi]
    mov     [rdx], r8b
    inc     rsi
    inc     rdx    
    jmp     .loop_start

.loop_end:
    mov     byte [rdx], 0x00
    mov     rax, rcx

    add     rsp, 8
    pop     rbp
    ret

.null_error:
    mov     rax, 0x00

    add     rsp, 8
    pop     rbp
    ret