#include "catch2/catch_amalgamated.hpp"

#include <cstring>
#include <unistd.h>
#include <fcntl.h>
extern "C" size_t   ft_strlen(const char*);
extern "C" char     *ft_strcpy(char*, const char*);
extern "C" int      ft_strcmp(const char*, const char*);
extern "C" ssize_t  ft_write(int, const void*, size_t);
extern "C" ssize_t  ft_read(int, void*, size_t);

TEST_CASE( "[ft_strlen]", "[Mandatory]") {
    REQUIRE( ft_strlen("") == strlen("") );
    REQUIRE( ft_strlen("Hello world!") == strlen("Hello world!") );
    REQUIRE( ft_strlen("42seoul") == strlen("42seoul") );
    REQUIRE( ft_strlen("kangkim libasm") == strlen("kangkim libasm") );
}

TEST_CASE( "[ft_strcpy]", "[Mandatory]") {
    char arr[20];
    REQUIRE( ft_strcpy(arr, "") == strcpy(arr, "") );
    REQUIRE( ft_strcpy(arr, "Hello world!") == strcpy(arr, "Hello world!") );
    REQUIRE( ft_strcpy(arr, "42seoul") == strcpy(arr, "42seoul") );
    REQUIRE( ft_strcpy(arr, "kangkim libasm") == strcpy(arr, "kangkim libasm") );
}

TEST_CASE( "[ft_strcmp]", "[Mandatory]") {
    REQUIRE( ft_strcmp("Hello world!", "Hello world!") == strcmp("Hello world!", "Hello world!") );
    REQUIRE( ft_strcmp("Hello world!", "") > 0 );
    REQUIRE( ft_strcmp("", "Hello world!") < 0 );
    REQUIRE( ft_strcmp("kangkim libasm", "kangkim libasm2") < 0 );
}

TEST_CASE( "[ft_write]", "[Mandatory]") {
    REQUIRE( ft_write(-1, "Hello world\n", strlen("Hello")) == \
        write(-1, "Hello world\n", strlen("Hello")) );
    REQUIRE( ft_write(STDOUT_FILENO, "Hello world\n", strlen("Hello world\n")) == \
        write(STDOUT_FILENO, "Hello world\n", strlen("Hello world\n")) );
    REQUIRE( ft_write(STDOUT_FILENO, "Hello world\n", strlen("Hello")) == \
        write(STDOUT_FILENO, "Hello world\n", strlen("Hello")) );
    REQUIRE( ft_write(STDOUT_FILENO, "", strlen("Hello world\n")) == \
        write(STDOUT_FILENO, "", strlen("Hello world\n")) );
}

TEST_CASE( "[ft_read]", "[Mandatory]") {
    char arr[50];
    int fd1 = open("text.txt", O_RDONLY);
    int fd2 = open("text.txt", O_RDONLY);
    REQUIRE( ft_read(-1, arr, 50) == read(-1, arr, 50) );
    REQUIRE( ft_read(fd1, arr, 50) == read(fd2, arr, 50) );
}