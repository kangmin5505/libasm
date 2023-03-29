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

    section .text
    global  _ft_list_remove_if

_ft_list_remove_if:
    push    rbp
    mov     rbp, rsp

    pop     rbp
    ret