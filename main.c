#include <stdlib.h>
#include <stdio.h>

typedef struct s_list {
    void    *data;
    struct s_list   *next;
}   t_list;

int     ft_atoi_base(char *str, char *base) {
    
    return 0;
}

void    ft_list_push_front(t_list **begin_list, void *data) {
    t_list *new_list = malloc(sizeof(t_list));
    if (!new_list)
        return;

    new_list->data = data;
    new_list->next = *begin_list;
    *begin_list = new_list;
}

void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *)) {
    t_list dummy;
    dummy.next = *begin_list;
    t_list *prev = &dummy;
    t_list *curr = *begin_list;

    while (curr) {
        if ((*cmp)(curr->data, data_ref) == 0) {
            prev->next = curr->next;
            (*free_fct)(curr->data);
            free(curr);
            break;
        }
        prev = curr;
        curr = curr->next;
    }
    *begin_list = dummy.next;
}

int     ft_list_size(t_list *begin_list) {
    int size = 0;

    while (begin_list) {
        ++size;
        begin_list = begin_list->next;
    };
    return size;
}

t_list *split_list(t_list *node) {
    t_list *prev = NULL;
    t_list *slow = node;
    t_list *fast = node;

    while (fast && fast->next) {
        fast = fast->next->next;
        prev = slow;
        slow = slow->next;
    }
    if (prev)
        prev->next = NULL;

    return slow;
}

t_list *merge_list(t_list *left_node, t_list *right_node, int (*cmp)()) {
    if (left_node == NULL)
        return right_node;
    if (right_node == NULL)
        return left_node;

    if ((*cmp)(left_node->data, right_node->data) <= 0) {
        left_node->next = merge_list(left_node->next, right_node, cmp);
        return left_node;
    } else {
        right_node->next = merge_list(left_node, right_node->next, cmp);
        return right_node;
    }
}

t_list *merge_sort(t_list *node, int (*cmp)()) {
    if (node->next == NULL)
        return node;

    t_list *middle_node = split_list(node);
    node = merge_sort(node, cmp);
    middle_node = merge_sort(middle_node, cmp);
    return merge_list(node, middle_node, cmp);
}

void    ft_list_sort(t_list **begin_list, int (*cmp)()) {
    *begin_list = merge_sort(*begin_list, cmp);
}

void    print_all_list(t_list *begin_list) {
    while (begin_list) {
        printf("data : %d\n", *((int *)begin_list->data));
        begin_list = begin_list->next;
    }
}

t_list* creat_list(void *data) {
    t_list *new_list = malloc(sizeof(t_list));
    new_list->next = NULL;
    new_list->data = data;

    return new_list;
}

int compare(void *p1, void *p2) {
    if (*(int *)p1 == *(int *)p2)
        return 0;
    return *(int *)p1 - *(int *)p2;
}

void free_function(void *data) {
    free(data);
}

int main(void)
{
    int *num0 = malloc(sizeof(int));
    *num0 = 0;
    t_list *begin_list = creat_list(num0);
    int *num1 = malloc(sizeof(int));
    *num1 = -5;
    ft_list_push_front(&begin_list, num1);

    int *num2 = malloc(sizeof(int));
    *num2 = 2;
    ft_list_push_front(&begin_list, num2);
    int *num3 = malloc(sizeof(int));
    *num3 = -10;
    ft_list_push_front(&begin_list, num3);
    int *num4 = malloc(sizeof(int));
    *num4 = 2;
    ft_list_push_front(&begin_list, num4);

    print_all_list(begin_list);
    printf("%d\n", ft_list_size(begin_list));

    // int num = 3;
    // ft_list_remove_if(&begin_list, &num, &compare, &free_function);
    // printf("-------------\n");
    // print_all_list(begin_list);
    // printf("%d\n", ft_list_size(begin_list));


    ft_list_sort(&begin_list, compare);
    print_all_list(begin_list);

    system("leaks main");
    return 0;
}
