#include "main_bonus.h"


void    print_all_list(t_list *begin_list) {
    t_list *temp = begin_list;
    printf("----- print all list -----\n");
    while (temp) {
        printf("data : %d\n", *((int *)temp->data));
        temp = temp->next;
    }
    printf("list size : %d\n", ft_list_size(begin_list));
    printf("--------------------------\n");
}

t_list* creat_list(void *data) {
    t_list *new_list = (t_list *)malloc(sizeof(t_list));
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
    return;
}

int main(void)
{
    int *num0 = (int *)malloc(sizeof(int));
    *num0 = 0;
    t_list *begin_list = creat_list(num0);
    int *num1 = (int *)malloc(sizeof(int));
    *num1 = 1;
    ft_list_push_front(&begin_list, num1);

    int *num2 = (int *)malloc(sizeof(int));
    *num2 = 2;
    ft_list_push_front(&begin_list, num2);
    int *num3 = (int *)malloc(sizeof(int));
    *num3 = 3;
    ft_list_push_front(&begin_list, num3);
    int *num4 = (int *)malloc(sizeof(int));
    *num4 = 4;
    ft_list_push_front(&begin_list, num4);
    
    int *num5 = (int *)malloc(sizeof(int));
    *num5 = -5;
    ft_list_push_front(&begin_list, num5);
    int *num6 = (int *)malloc(sizeof(int));
    *num6 = -100;
    ft_list_push_front(&begin_list, num6);
    int *num7 = (int *)malloc(sizeof(int));
    *num7 = 100;
    ft_list_push_front(&begin_list, num7);

    print_all_list(begin_list);
    printf("%d\n", ft_list_size(begin_list));

    printf("----- ft_list_remove_if number 100, 0, -1 -----\n");
    int remove_num1 = 100;
    ft_list_remove_if(&begin_list, &remove_num1, &compare, &free_function);
    int remove_num2 = 0;
    ft_list_remove_if(&begin_list, &remove_num2, &compare, &free_function);
    int remove_num3 = -1;
    ft_list_remove_if(&begin_list, &remove_num3, &compare, &free_function);

    print_all_list(begin_list);

    ft_list_sort(&begin_list, compare);
    print_all_list(begin_list);

    printf("strtol : %ld, ft_atoi_base %d\n", strtol("0", NULL, 2), ft_atoi_base("0", "01"));
    printf("strtol : %ld, ft_atoi_base %d\n", strtol("1", NULL, 2), ft_atoi_base("1", "01"));
    printf("strtol : %ld, ft_atoi_base %d\n", strtol("-1", NULL, 10), ft_atoi_base("-1", "01"));
    printf("strtol : %ld, ft_atoi_base %d\n", strtol("2147483647", NULL, 2), ft_atoi_base("-1001", "01"));
    printf("strtol : %ld, ft_atoi_base %d\n", strtol("2147483648", NULL, 2), ft_atoi_base("1001", "01"));
    printf("strtol : %ld, ft_atoi_base %d\n", strtol("-2147483648", NULL, 16), ft_atoi_base("7fffffff", "0123456789abcdef"));
    printf("strtol : %ld, ft_atoi_base %d\n", strtol("-2147483649", NULL, 16), ft_atoi_base("-80000000", "0123456789abcdef"));

    return 0;
}
