# !/bin/sh

rm -f *.o

clang -c -o ft_read.o ft_read.c
clang -c -o ft_strcmp.o ft_strcmp.c
clang -c -o ft_strcpy.o ft_strcpy.c
clang -c -o ft_strdup.o ft_strdup.c
clang -c -o ft_strlen.o ft_strlen.c
clang -c -o ft_write.o ft_write.c
clang -c -o main.o main.c

objconv -fnasm ft_read.o
objconv -fnasm ft_strcmp.o
objconv -fnasm ft_strcpy.o
objconv -fnasm ft_strdup.o
objconv -fnasm ft_strlen.o
objconv -fnasm ft_write.o
objconv -fnasm main.o

rm -f *.o
