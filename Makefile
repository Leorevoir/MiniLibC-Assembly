##
## EPITECH PROJECT, 2025
## asm
## File description:
## build
##

NAME = libasm.so

OBJ_DIR = object
SRC_DIR = src

SRC = $(wildcard src/*.asm)
OBJ = $(SRC:$(SRC_DIR)/%.asm=$(OBJ_DIR)/%.o)

CC = gcc
CFLAGS = -Wall -Wextra -Werror -pedantic -no-pie -z noexecstack -fno-builtin
ASM = nasm
LD = ld
ASMFLAGS = -f elf64
LDFLAGS = -shared -z noexecstack

all: $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm
	@mkdir -p $(OBJ_DIR)
	$(ASM) $(ASMFLAGS) -o $@ $<

$(NAME): $(OBJ)
	printf "[\033[1;33mINFO\033[0m] LD Linking %s...\n" $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^
	printf "[\033[1;32mSUCCESS\033[0m] LD Linked %s!\n" $(NAME)

clean:
	printf "[\033[1;33mINFO\033[0m] Removing %s...\n" $(OBJ)
	rm -rf $(OBJ_DIR)
	printf "[\033[1;32mSUCCESS\033[0m] Removing object files!\n"

fclean: clean
	rm -f $(NAME)
	rm -f test_*
	printf "[\033[1;32mSUCCESS\033[0m] Removing all build artifacts!\n"

re: fclean all

.PHONY: all clean fclean re
.SILENT:
