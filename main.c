#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <inttypes.h>
#include <string.h>

typedef struct s_list {
    void    *data;
    struct s_list   *next;
}   t_list;


int     ft_list_size(t_list *);
void    ft_list_push_front(t_list **begin_list, void *data);
char    *ft_strdup(const char*);
void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
void    ft_list_sort(t_list **begin_list, int (*cmp)());
int     ft_strlen(char *str);
int	ft_atoi_base(char *str, char *base);


// int    skip_space(char *str) {
//     int idx = 0;

//     while (str[idx]) {
//         if (str[idx] != 32 || str[idx] < 9 || str[idx] > 13)
//             break;
//         ++idx;
//     }
//     return idx;
// }

// bool    is_possible(char *base, int base_len)
// {
// 	if (base_len == 0 || base_len == 1)
// 		return false;

// 	int	    i = 0;
// 	bool    check[256];

// 	while (i < 256)
// 		check[i++] = false;

//     while (*base) {
//         if (check[(int)(*base)] == true)
//             return false;
//         if (*base == '+' || *base == '-')
//             return false;
//         if (*base == 32 || (9 <= *base && *base <= 13))
//             return false;
//         ++base;
//     }
//     return true;
// }

// int	ft_atoi_base(char *str, char *base)
// {
// 	int idx = skip_space(str);
//     int sign = -1;
//     int base_len = ft_strlen(base);
//     int check_idx = 0;
//     int num = 0;
//     int flow_check = INT_MAX / 10;

    // if (str[idx] == '-' || str[idx] == '+') {
    //     if (str[idx] == '-')
    //         sign = 1;
    //     ++idx;
    // }

// 	if (!is_possible(base, base_len))
// 		return 0;

// 	while (str[idx]) 
// 	{
// 		check_idx = 0;
// 		while (check_idx < base_len)
// 		{
// 			if (str[idx] == base[check_idx])
// 			{
//                 if (sign == -1 && (num > flow_check || (-num == flow_check && check_idx > 7)))
//                     return 0;
//                 if (sign == 1 && (num > flow_check || (-num == flow_check && check_idx > 8)))
//                     return 0;
//                  num = num * base_len - check_idx;
// 				break;
// 			}
// 			check_idx++;
// 		}

// 		if (check_idx == base_len)
// 			break;
// 		idx++;
// 	}
// 	return sign * num;
// }


// t_list *split_list(t_list *node) {
//     t_list *prev = NULL;
//     t_list *slow = node;
//     t_list *fast = node;

//     while (fast && fast->next) {
//         fast = fast->next->next;
//         prev = slow;
//         slow = slow->next;
//     }
//     if (prev)
//         prev->next = NULL;

//     return slow;
// }

// t_list *merge_list(t_list *left_node, t_list *right_node, int (*cmp)()) {
//     if (left_node == NULL)
//         return right_node;
//     if (right_node == NULL)
//         return left_node;

//     if ((*cmp)(left_node->data, right_node->data) <= 0) {
//         left_node->next = merge_list(left_node->next, right_node, cmp);
//         return left_node;
//     } else {
//         right_node->next = merge_list(left_node, right_node->next, cmp);
//         return right_node;
//     }
// }

// t_list *merge_sort(t_list *node, int (*cmp)()) {
//     if (node->next == NULL)
//         return node;

//     t_list *middle_node = split_list(node);
//     node = merge_sort(node, cmp);
//     middle_node = merge_sort(middle_node, cmp);
//     return merge_list(node, middle_node, cmp);
// }

// void    ft_list_sort(t_list **begin_list, int (*cmp)()) {
//     *begin_list = merge_sort(*begin_list, cmp);
// }

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
    printf("%d\n", *(int*)data);
    free(data);
    return;
}

int main(void)
{
    // int *num0 = malloc(sizeof(int));
    // *num0 = 0;
    // t_list *begin_list = creat_list(num0);
    // int *num1 = malloc(sizeof(int));
    // *num1 = 1;
    // ft_list_push_front(&begin_list, num1);

    // int *num2 = malloc(sizeof(int));
    // *num2 = 2;
    // ft_list_push_front(&begin_list, num2);
    // int *num3 = malloc(sizeof(int));
    // *num3 = 3;
    // ft_list_push_front(&begin_list, num3);
    // int *num4 = malloc(sizeof(int));
    // *num4 = 4;
    // ft_list_push_front(&begin_list, num4);
    
    // int *num5 = malloc(sizeof(int));
    // *num5 = -5;
    // ft_list_push_front(&begin_list, num5);
    // int *num6 = malloc(sizeof(int));
    // *num6 = -100;
    // ft_list_push_front(&begin_list, num6);
    // int *num7 = malloc(sizeof(int));
    // *num7 = 100;
    // ft_list_push_front(&begin_list, num7);

    // print_all_list(begin_list);
    // printf("%d\n", ft_list_size(begin_list));

    // int num = 4;
    // printf("%p\n", *begin_list);
    // ft_list_remove_if(&begin_list, &num, &compare, &free_function);
    // int remove_num = 0;
    // ft_list_remove_if(&begin_list, &remove_num, &compare, &free_function);
    // printf("%p\n", *begin_list);

    // printf("-------------\n");
    // print_all_list(begin_list);
    // printf("%d\n", ft_list_size(begin_list));


    // ft_list_sort(&begin_list, compare);
    // print_all_list(begin_list);

    printf("result : %d\n", ft_atoi_base("-134423kj", "0123456789"));
    printf("atoi : %d %d\n", atoi("2147483647"), atoi("-2147483648"));
    printf("check underflow : %d %d \n", ft_atoi_base("2147483647", "0123456789"), ft_atoi_base("2147483648", "0123456789"));
    printf("check overflow : %d %d\n", ft_atoi_base("-2147483648", "0123456789"), ft_atoi_base("-2147483649", "0123456789"));

    // system("leaks main");
    return 0;
}
