;   pesudo code for list_size
;
;   typedef struct s_list {
;       void    *data;
;       struct s_list   *next;
;   }                   t_list;
;
;   int     ft_list_size(t_list *begin_list) {
;       int size = 0;
;
;       while (begin_list) {
;           ++size;
;           begin_list = begin_list->next;
;       };
;       return size;
;   }
global  _ft_list_size

section .text
_ft_list_size:
    push    rbp
    mov     rbp, rsp

    xor     rax, rax

.loop_start:
    cmp     rdi, 0x00
    je      .loop_end
    inc     rax
    mov     rdi, [rdi + 8]
    jmp     .loop_start

.loop_end:
    pop     rbp
    ret