#include <sys/types.h>
#include <unistd.h>

ssize_t ft_read(int fildes, void *buf, size_t nbyte) {
    return read(fildes, buf, nbyte);
}