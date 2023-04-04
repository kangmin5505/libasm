NAME=libasm.a
BONUS_NAME=libasm_bonus.a
AS=nasm
ASFLAGS=-fmacho64
AR=ar
CC=clang++
CFLAGS=-std=c++17 -Wall -Wextra -Werror
TEST=test
LDDIR=.
LDFLAGS=-lasm -arch x86_64
LDFLAGS_BONUS=-lasm_bonus -arch x86_64
MAIN=main.c
MAIN_BONUS=main_bonus.c
CATCH_SRC=catch2/catch_amalgamated.cpp

INCLUDE_DIR=include/
SRC_DIR=src/

SOURCES:= ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
SOURCES:=$(addprefix $(SRC_DIR), $(SOURCES))
BONUS_SOURCES:= ft_atoi_base_bonus.s ft_list_push_front_bonus.s ft_list_size_bonus.s ft_list_sort_bonus.s ft_list_remove_if_bonus.s
BONUS_SOURCES:=$(addprefix $(SRC_DIR), $(BONUS_SOURCES))

OBJECTS=$(SOURCES:.s=.o)
BONUS_OBJECTS=$(BONUS_SOURCES:.s=.o)

.PHONY: all
all: $(NAME)

$(NAME): $(OBJECTS)
	@$(AR) rcs $(NAME) $^

%.o : %.s
	@$(AS) $(ASFLAGS) $< -o $@

.PHONY: clean
clean:
	@$(RM) $(OBJECTS)
	@$(RM) $(BONUS_OBJECTS)

.PHONY: fclean
fclean: clean
	@$(RM) $(NAME)
	@$(RM) $(BONUS_NAME)
	@$(RM) -r test*
	@$(RM) -r *.dSYM


.PHONY: re
re: fclean all

.PHONY: bonus
bonus: $(BONUS_NAME)

$(BONUS_NAME): $(OBJECTS) $(BONUS_OBJECTS)
	@$(AR) rcs $(BONUS_NAME) $^

.PHONY: test
test: $(NAME)
	@$(CC) $(CFLAGS) -L$(LDDIR) $(LDFLAGS) -I$(INCLUDE_DIR) -o $(TEST) $(MAIN) $(CATCH_SRC)
	@./test

.PHONY: test_bonus
test_bonus: $(BONUS_NAME)
	@clang -L$(LDDIR) $(LDFLAGS_BONUS) -I$(INCLUDE_DIR) -o $(TEST) $(MAIN_BONUS)
	@./test

