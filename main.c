#include <string.h>
#include <stdio.h>
#include <sys/mman.h>
#include <err.h>
#include <unistd.h>
#include <sys/errno.h>

ssize_t ft_write(int, void *, size_t);


int main(void)
{
    printf("%zd\n", ft_write(5, "Hello world\n", strlen("Hello world\n") ));
    printf("%d\n", errno);
    printf("%zd\n", write(5, "Hello world\n", strlen("Hello world\n") ));
    printf("%d\n", errno);

    printf("%zd\n", ft_write(1, "Hello world\n", strlen("Hello world\n") ));
    printf("%zd\n", write(1, "Hello world\n", strlen("Hello world\n") ));
}
