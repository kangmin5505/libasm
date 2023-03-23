#include <sys/types.h>
#include <unistd.h>

ssize_t ft_write(int fildes, const void *buf, size_t nbyte) {
    return write(fildes, buf, nbyte);
}
