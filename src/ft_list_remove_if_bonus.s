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

section .text
_ft_list_remove_if:
    push    rbp
    mov     rbp, rsp

    sub     rsp, 32         ;   t_list dummy
    mov     r8, [rdi]
    mov     [rbp - 8], r8   ;   dummy.next
    mov     [rbp - 16], rbp ;   t_list *prev
    mov     [rbp - 24], r8  ;   t_list *curr

.loop_start:
    cmp     qword [rbp - 24], 0x00
    je      .loop_end

    mov     rdi, [rbp - 24]
    call    rdx
    cmp     eax, 0x00
    je      .remove_node

    mov     r8, [rbp - 24]
    mov     [rbp - 16], r8  ;   prev = curr
    mov     r8, [rbp - 24]
    mov     r9, [r8 + 8]  
    mov     [rbp - 24], r9  ;   curr = curr->next;
    jmp     .loop_start

.remove_node: 
    mov     r8, [rbp - 24]
    mov     rdx, [r8 + 8]
    mov     [rbp - 16], rdx
    mov     r8, [rbp - 24]
    mov     rdi, [r8]
    call    rcx
    mov     rdi, [rbp - 24]
    call    _free

.loop_end:
    mov     r8, [rbp - 8]
    mov     [rdi], r8       ;   *begin_list = dummy.next

    add     rsp, 32
    pop     rbp
    ret