#ifndef LIBFT_H
# define LIBFT_H

# include <sys/types.h>

ssize_t ft_read(int fildes, void *buf, size_t nbyte);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strcpy(char *dst, const char *src);
char    *ft_strdup(const char *s1);
size_t  ft_strlen(const char *s);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);

#endif // LIBFT_H