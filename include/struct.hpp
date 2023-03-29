#ifndef STRUCT_H_
# define STRUCT_H_

typedef struct  s_list {
  void *data;
  struct s_list *next;
}                 t_list;

#endif