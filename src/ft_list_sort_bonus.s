;   pesudo code for list_sort
;
;   typedef struct s_list {
;       void    *data;
;       struct s_list   *next;
;   }                   t_list;
;

;   t_list *split_list(t_list *node) {
;       t_list *prev = NULL;
;       t_list *slow = node;
;       t_list *fast = node;
;
;       while (fast && fast->next) {
;           fast = fast->next->next;
;           prev = slow;
;           slow = slow->next;
;       }
;       if (prev)
;           prev->next = NULL;  
;       return slow;
;   }

;   t_list *merge_list(t_list *left_node, t_list *right_node, int (*cmp)()) {
;       if (left_node == NULL)
;           return right_node;
;       if (right_node == NULL)
;           return left_node;   
;       if ((*cmp)(left_node->data, right_node->data) <= 0) {
;           left_node->next = merge_list(left_node->next, right_node, cmp);
;           return left_node;
;       } else {
;           right_node->next = merge_list(left_node, right_node->next, cmp);
;           return right_node;
;       }
;   }

;   t_list *merge_sort(t_list *node, int (*cmp)()) {
;       if (node->next == NULL)
;           return node;    
;       t_list *middle_node = split_list(node);
;       node = merge_sort(node, cmp);
;       middle_node = merge_sort(middle_node, cmp);
;       return merge_list(node, middle_node, cmp);
;   }

;   void    ft_list_sort(t_list **begin_list, int (*cmp)()) {
;       *begin_list = merge_sort(*begin_list, cmp);
;   }
section .text
global  _ft_list_sort
    
_ft_list_sort:
    push    rbp
    mov     rbp, rsp

    push    rdi
    sub     rsp, 8

    ;   call merge_sort(*begin_list, cmp)
    mov     rdi, [rbp - 8]
    mov     rdi, [rdi]
    call    .merge_sort

    add     rsp, 8     
    pop     rdi
    mov     [rdi], rax

    pop     rbp
    ret

.merge_sort:
    push    rbp
    mov     rbp, rsp

    push    rdi
    push    rsi
    sub     rsp, 16

    ;   if node->next == NULL
    cmp     qword [rdi + 8], 0x00
    je      .return_single_node

    ;   call    split_list(node)
    mov     rdi, [rbp - 8]      ; node
    call    .split_list
    mov     [rbp - 24], rax     ; middle_node
    
    ;   call merge_sort(node, cmp)
    mov     rdi, [rbp - 8]
    mov     rsi, [rbp - 16]
    call    .merge_sort
    mov     [rbp - 8], rax

    ;   call merge_sort(middle_node, cmp)
    mov     rdi, [rbp - 24]
    mov     rsi, [rbp - 16]
    call    .merge_sort
    mov     [rbp - 24], rax

    ;   call merge_list(node, middle_node, cmp)
    mov     rdi, [rbp - 8]
    mov     rsi, [rbp - 24]
    mov     rdx, [rbp - 16]
    call    .merge_list

    add     rsp, 32
    pop     rbp
    ret

.return_single_node:
    add     rsp, 24
    pop     rdi
    mov     rax, rdi
    pop     rbp
    ret


.merge_list:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 24
    
    mov     [rbp - 8], rdi      ;   left_node
    mov     [rbp - 16], rsi     ;   right_node
    mov     [rbp - 24], rdx     ;   cmp

    cmp     qword [rbp - 8], 0x00
    je      .merge_list_return_right_node

    cmp     qword [rbp - 16], 0x00
    je      .merge_list_return_left_node

    ;   if (*cmp)(left_node->data, right_node->data) <= 0
    mov     rdi, [rbp - 8]
    mov     rdi, [rdi]
    mov     rsi, [rbp - 16]
    mov     rsi, [rsi]
    call    [rbp - 24]
    jle     .merge_list_left_next

    ;   call merge_list(left_node, right_node->next, cmp)
    mov     rdi, [rbp - 8]
    mov     rsi, [rbp - 16]
    mov     rsi, [rsi + 8]
    mov     rdx, [rbp - 24]
    call    .merge_list

    mov     r8, [rbp - 16]
    mov     [r8 + 8], rax
    jmp     .merge_list_return_right_node

.merge_list_left_next:
    ;   call merge_list(left_node->next, right_node, cmp)
    mov     rdi, [rbp - 8]
    mov     rdi, [rdi + 8]
    mov     rsi, [rbp - 16]
    mov     rdx, [rbp - 24]
    call    .merge_list

    mov     r8, [rbp - 8]
    mov     [r8 + 8], rax
    jmp     .merge_list_return_left_node
    
.merge_list_return_right_node:
    mov     rax, [rbp - 16]

    add     rsp, 24
    pop     rbp
    ret


.merge_list_return_left_node:
    mov     rax, [rbp - 8]

    add     rsp, 24
    pop     rbp
    ret


.split_list:
    push    rbp
    mov     rbp, rsp
    
    sub     rsp, 24
    mov     qword [rbp - 8], 0x00   ;   *prev = NULL
    mov     [rbp - 16], rdi         ;   *slow = node
    mov     [rbp - 24], rdi         ;   *fast = node

.split_list_loop_start:
    cmp     qword [rbp - 24], 0x00
    je      .split_list_loop_end
    mov     rax, [rbp - 24]
    cmp     qword [rax + 8], 0x00
    je      .split_list_loop_end

    ;   fast = fast->next->next
    mov     r8, [rbp - 24]
    mov     r9, [r8 + 8]
    mov     rax, [r9 + 8]
    mov     [rbp - 24], rax
    ;   prev = slow
    mov     r8, [rbp - 16]
    mov     [rbp - 8], r8
    ;   slow = slow->next
    mov     r8, [rbp - 16]
    mov     r9, [r8 + 8]
    mov     [rbp - 16], r9
    
    jmp     .split_list_loop_start

.split_list_loop_end:
    cmp     qword [rbp - 8], 0x00
    je     .split_list_return
    mov     r8, [rbp - 8]
    mov     qword [r8 + 8], 0x00

.split_list_return:
    mov     rax, [rbp - 16]
    add     rsp, 24
    pop     rbp
    ret