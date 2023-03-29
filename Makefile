NAME=libasm.a
AS=nasm
ASFLAGS=-fmacho64
AR=ar
CC=clang++
CFLAGS=-std=c++17
TEST=test
LDDIR=.
LDFLAGS=-lasm -arch x86_64
MAIN=main.cpp
CATCH_SRC=catch2/catch_amalgamated.cpp

SOURCES:=$(wildcard src/*.s)
OBJECTS=$(SOURCES:.s=.o)

.PHONY: all
all: $(NAME)

$(NAME): $(OBJECTS)
	@$(AR) rcs $(NAME) $^

%.o : %.s
	@$(AS) $(ASFLAGS) $< -o $@

.PHONY: clean
clean:
	@$(RM) $(OBJECTS)

.PHONY: fclean
fclean: clean
	@$(RM) $(NAME)
	@$(RM) -r test*

.PHONY: re
re: fclean all

.PHONY: test
test: $(NAME)
	@$(CC) $(CFLAGS) -L$(LDDIR) $(LDFLAGS) -o $(TEST) $(MAIN) $(CATCH_SRC)

.PHONY: debug
debug: $(NAME)
	@$(CC) $(CFLAGS) -g -L$(LDDIR) $(LDFLAGS) -o $(TEST) $(MAIN) $(CATCH_SRC)
