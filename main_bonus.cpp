#include "catch2/catch_amalgamated.hpp"
#include "main_bonus.hpp"


void    print_all_list(t_list *begin_list) {
    t_list *temp = begin_list;
    printf("----- print all list -----\n");
    while (temp) {
        printf("data : %d\n", *((int *)temp->data));
        temp = temp->next;
    }
    printf("list size : %d\n", ft_list_size(begin_list));
    printf("--------------------------\n");
}

t_list* creat_list(void *data) {
    t_list *new_list = (t_list *)malloc(sizeof(t_list));
    new_list->next = NULL;
    new_list->data = data;

    return new_list;
}

int compare(void *p1, void *p2) {
    if (*(int *)p1 == *(int *)p2)
        return 0;
    return *(int *)p1 - *(int *)p2;
}

void free_function(void *data) {
    free(data);
}

bool is_sorted(t_list *begin_list) {
    while (begin_list && begin_list->next) {
        if (*(int*)begin_list->data > *(int*)begin_list->next->data)
            return false;
        begin_list = begin_list->next;
    }
    return true;
}

TEST_CASE( "[ft_list_*]", "[BONUS]" ) {
    t_list *begin_list = NULL;
    const int NUM_SIZE = 10;

    for (int i = 0; i < NUM_SIZE; ++i) {
        int *num = (int *)malloc(sizeof(int));
        *num = i;
        ft_list_push_front(&begin_list, num);
    }
    // print_all_list(begin_list);
    REQUIRE( ft_list_size(begin_list) == NUM_SIZE );

    int remove_num1 = 100;
    ft_list_remove_if(&begin_list, &remove_num1, &compare, &free_function);
    int remove_num2 = 0;
    ft_list_remove_if(&begin_list, &remove_num2, &compare, &free_function);
    int remove_num3 = 9;
    ft_list_remove_if(&begin_list, &remove_num3, &compare, &free_function);
    int remove_num4 = 5;
    ft_list_remove_if(&begin_list, &remove_num4, &compare, &free_function);

    // print_all_list(begin_list);
    ft_list_sort(&begin_list, compare);
    // print_all_list(begin_list);
    REQUIRE( is_sorted(begin_list) == true );
}


TEST_CASE( "[ft_atoi_base]", "[BONUS]" ) {
    // ERROR
    REQUIRE( ft_atoi_base((char*)"0", (char*)"") == 0 );
    REQUIRE( ft_atoi_base((char*)"30", (char*)"012") == 0 );
    REQUIRE( ft_atoi_base((char*)"0", (char*)"011") == 0 );
    REQUIRE( ft_atoi_base((char*)"0", (char*)"01-") == 0 );
    REQUIRE( ft_atoi_base((char*)"0", (char*)"01\n") == 0 );
    REQUIRE( ft_atoi_base((char*)"-2147483649", (char*)"0123456789") == 0 );    // underflow
    REQUIRE( ft_atoi_base((char*)"2147483648", (char*)"0123456789") == 0 );     // overflow

    REQUIRE( (int)strtol((char*)"2147483647", NULL, 10) == ft_atoi_base((char*)"2147483647", (char*)"0123456789") );
    REQUIRE( (int)strtol((char*)"-2147483648", NULL, 10) == ft_atoi_base((char*)"-2147483648", (char*)"0123456789") );
    REQUIRE( (int)strtol((char*)"-1001", NULL, 2) == ft_atoi_base((char*)"-1001", (char*)"01") );
    REQUIRE( (int)strtol((char*)"100", NULL, 2) == ft_atoi_base((char*)"100", (char*)"01") );
    REQUIRE( (int)strtol((char*)"7fffffff", NULL, 16) == ft_atoi_base((char*)"7fffffff", (char*)"0123456789abcdef") );
    REQUIRE( (int)strtol((char*)"-7fffffff", NULL, 16) == ft_atoi_base((char*)"-7fffffff", (char*)"0123456789abcdef") );
}