#ifndef MAIN_BONUS_H_
# define MAIN_BONUS_H_

# include <stdio.h>
# include <stdlib.h>
# include <inttypes.h>

typedef struct s_list {
    void    *data;
    struct s_list   *next;
}   t_list;

extern "C" int     ft_list_size(t_list *);
extern "C" void    ft_list_push_front(t_list **begin_list, void *data);
extern "C" void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(void*, void*), void (*free_fct)(void *));
extern "C" void    ft_list_sort(t_list **begin_list, int (*cmp)(void*, void*));
extern "C" int     ft_atoi_base(char *str, char *base);


#endif