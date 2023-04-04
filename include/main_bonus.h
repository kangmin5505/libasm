#ifndef MAIN_BONUS_H_
# define MAIN_BONUS_H_

# include <stdio.h>
# include <stdlib.h>
# include <inttypes.h>

typedef struct s_list {
    void    *data;
    struct s_list   *next;
}   t_list;

int     ft_list_size(t_list *);
void    ft_list_push_front(t_list **begin_list, void *data);
char    *ft_strdup(const char*);
void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
void    ft_list_sort(t_list **begin_list, int (*cmp)());
int     ft_atoi_base(char *str, char *base);


#endif