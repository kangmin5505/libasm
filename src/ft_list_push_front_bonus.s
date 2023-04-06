;   pesudo code for list_push_front
;
;   typedef struct s_list {
;       void    *data;
;       struct s_list   *next;
;   }                   t_list;
;
;   void    ft_list_push_front(t_list **begin_list, void *data) {
;       t_list *new_list = malloc(sizeof(t_list));
;       if (!new_list)
;           return;
;
;       new_list->data = data;
;       new_list->next = *begin_list;
;       *begin_list = new_list;
;   }

struc   s_list
    data_qword:   resq    1
    next_qword:   resq    1
endstruc

global  _ft_list_push_front
extern  _malloc

section .text
_ft_list_push_front:
    push    rbp
    mov     rbp, rsp

    push    rdi         ;   **begin_list
    push    rsi         ;   *data
    mov     rdi, s_list_size
    call    _malloc
    mov     rdx, rax    ;   *new_list

    pop     rsi
    pop     rdi

    cmp     rdx, 0x00
    je      .return

    mov     [rdx], rsi      ;   new_list->data = data
    mov     r8, [rdi]
    mov     [rdx + 8], r8   ;   new_list->next = *begin_list
    mov     [rdi], rdx      ;   *begin_list = new_list

.return :
    pop     rbp
    ret