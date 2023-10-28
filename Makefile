COLLEEN	=	Colleen
GRACE	=	Grace
SULLY	=	Sully

OBJ_DIR		=	./objs
SRCC_DIR	=	./srcs_c
SRCASM_DIR	=	./srcs_asm

SRC_C	=	Colleen.c
SRC_ASM	=	Colleen_asm.s

OBJ_C	=	$(SRC_C:.c=.o)
OBJS_C	=	$(OBJ_C:%=$(OBJ_DIR)/%)

OBJ_ASM		=	$(SRC_ASM:.s=.o)
OBJS_ASM	=	$(OBJ_ASM:%=$(OBJ_DIR)/%)

NAFL	=	-f elf64
NA	=	nasm

RM	=	rm -rf
ECHO	=	echo

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror

ASMFLAGS	=	-Wall -Wextra -Werror -z noexecstack
ASM_LDFLAGS	=	-L.
ASM_LDLIBS	=	-l asm

all: $(COLLEEN)

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(COLLEEN)
	$(RM) $(COLLEEN)_asm

re: fclean all

$(COLLEEN): $(OBJS_C) $(OBJS_ASM)
	$(CC) $(CFLAGS) -o $(COLLEEN) $(OBJS_C)
	$(CC) $(ASMFLAGS) -o $(COLLEEN)_asm $(OBJS_ASM)

$(OBJ_DIR)/%.o: $(SRCC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<

$(OBJ_DIR)/%.o: $(SRCASM_DIR)/%.s
	$(NA) $(NAFL) -o $@ $<

$(OBJS_C): | $(OBJ_DIR)

$(OBJS_ASM): | $(OBJ_DIR)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

.PHONY: all clean fclean re test
