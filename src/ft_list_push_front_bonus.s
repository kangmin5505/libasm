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

    section .text
    global  _ft_list_push_front

_ft_list_push_front:
    push    rbp
    mov     rbp, rsp

    pop     rbp
    ret