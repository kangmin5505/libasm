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


    section .text
    global  _ft_list_size


_ft_list_size:
    push    rbp
    mov     rbp, rsp

    pop     rbp
    ret