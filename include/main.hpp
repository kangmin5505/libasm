#ifndef MAIN_H_
# define MAIN_H_

# include <cstring>
# include <unistd.h>
# include <fcntl.h>
# include <errno.h>

extern "C" size_t   ft_strlen(const char*);
extern "C" char     *ft_strcpy(char*, const char*);
extern "C" int      ft_strcmp(const char*, const char*);
extern "C" ssize_t  ft_write(int, const void*, size_t);
extern "C" ssize_t  ft_read(int, void*, size_t);
extern "C" char     *ft_strdup(const char*);

#endif
