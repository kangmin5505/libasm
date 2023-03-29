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

    pop     rbp
    ret