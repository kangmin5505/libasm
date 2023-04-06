NAME=libasm.a
AS=nasm
ASFLAGS=-fmacho64
AR=ar
CC=clang++
CFLAGS=-std=c++17 -Wall -Wextra -Werror
TEST=test
LDDIR=.
LDFLAGS=-lasm -arch x86_64
MAIN=main.cpp
MAIN_BONUS=main_bonus.cpp
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
	@echo '[!] make all: make $(NAME)'

%.o : %.s
	@$(AS) $(ASFLAGS) $< -o $@

.PHONY: clean
clean:
	@$(RM) $(OBJECTS)
	@$(RM) $(BONUS_OBJECTS)
	@echo '[!] make clean: clean object files'

.PHONY: fclean
fclean: clean
	@$(RM) $(NAME)
	@$(RM) -r test*
	@$(RM) -r *.dSYM
	@echo '[!] make fclean: clean all files'

.PHONY: re
re: fclean all

.PHONY: bonus
bonus: 
	@make OBJECTS:="$(OBJECTS) $(BONUS_OBJECTS)" all

.PHONY: test
test: all
	@echo '[!] make test: wait for testing'
	@$(CC) $(CFLAGS) -g -L$(LDDIR) $(LDFLAGS) -I$(INCLUDE_DIR) -o $(TEST) $(MAIN) $(CATCH_SRC)
	@./test
	@echo '[!] make test: done'

.PHONY: test_bonus
test_bonus: bonus
	@echo '[!] make test_bonus: wait for testing'
	@$(CC) $(CFLAGS) -g -L$(LDDIR) $(LDFLAGS) -I$(INCLUDE_DIR) -o $(TEST) $(MAIN_BONUS) $(CATCH_SRC)
	@./test
	@echo '[!] make test_bonus: done'

