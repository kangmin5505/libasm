;   pesudo code for list_remove_if
;
;   typedef struct s_list {
;       void    *data;
;       struct s_list   *next;
;   }                   t_list;
;
;   void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *)) {
;       t_list dummy;
;       dummy.next = *begin_list;
;       t_list *prev = &dummy;
;       t_list *curr = *begin_list;
;
;       while (curr) {
;           if ((*cmp)(curr->data, data_ref) == 0) {
;               prev->next = curr->next;
;               (*free_fct)(curr->data);
;               free(curr);
;               break;
;           }
;           prev = curr;
;           curr = curr->next;
;       }
;       *begin_list = dummy.next;
;   }

struc   s_list
    data:   resq    1
    next:   resq    1
endstruc

global  _ft_list_remove_if
extern  _free

section .data
    my_struct:
        istruc s_list
            at data, dq 0x00
            at next, dq 0x00
        iend

section .text
_ft_list_remove_if:
    push    rbp
    mov     rbp, rsp

    push    rdi
    push    rsi
    push    rdx
    push    rcx
    sub     rsp, 16         ;   t_list dummy

    mov     r8, [rdi]
    mov     [rel my_struct + 8], r8   ;   dummy.next
    lea     rax, [rel my_struct]
    mov     [rbp - 32], rax ;   t_list *prev
    mov     [rbp - 40], r8  ;   t_list *curr

.loop_start:
    cmp     qword [rbp - 40], 0x00
    je      .loop_end

    ;   if (*cmp)(curr->data, data_ref) == 0
    mov     rdi, [rbp - 40]
    mov     rdi, [rdi]
    call    [rbp - 24]
    cmp     eax, 0x00
    je      .remove_node

    mov     rax, [rbp - 40]
    mov     [rbp - 32], rax  ;   prev = curr
    mov     r8, [rbp - 40]
    mov     rax, [r8 + 8]  
    mov     [rbp - 40], rax  ;   curr = curr->next;
    jmp     .loop_start

.remove_node: 
    mov     r8, [rbp - 40]
    mov     r9, [r8 + 8]    ; curr->next

    mov     r8, [rbp - 32]
    mov     [r8 + 8], r9    ;   prev->next

    mov     r8, [rbp - 40]
    mov     rdi, [r8]
    call    [rbp - 24]
    mov     rdi, [rbp - 40]
    call    _free

.loop_end:
    lea     r8, [rel my_struct + 8]
    mov     rax, [r8]
    mov     r8, [rbp - 8]
    mov     [r8], rax       ;   *begin_list = dummy.next

    add     rsp, 48
    pop     rbp
    ret