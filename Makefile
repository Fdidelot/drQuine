COLLEEN	=	Colleen
GRACE	=	Grace
SULLY	=	Sully

OBJ_DIR		=	./objs
SRCC_DIR	=	./srcs_c
SRCASM_DIR	=	./srcs_asm

SRC_C	=	Colleen.c \
			Grace.c
SRC_ASM	=	Colleen_asm.s \
			Grace_asm.s

OBJ_C	=	$(SRC_C:.c=.o)
OBJS_C	=	$(OBJ_C:%=$(OBJ_DIR)/%)

OBJ_ASM		=	$(SRC_ASM:.s=.o)
OBJS_ASM	=	$(OBJ_ASM:%=$(OBJ_DIR)/%)

NAFL	=	-f elf64
NA	=	nasm

RM	=	rm -rf
ECHO	=	echo
DIFF	=	diff

CC			=	gcc
CFLAGS		=	-Wall -Wextra -Werror

ASMFLAGS	=	-Wall -Wextra -Werror -z noexecstack
ASM_LDFLAGS	=	-L.
ASM_LDLIBS	=	-l asm

all: $(COLLEEN) $(GRACE)

clean:
	$(RM) $(OBJ_DIR)
	$(RM) tmp tmp_asm a.out
	$(RM) $(GRACE)_kid.c $(GRACE)_kid.s

fclean: clean
	$(RM) $(COLLEEN) $(COLLEEN)_asm
	$(RM) $(GRACE) $(GRACE)_asm


re: fclean all

$(COLLEEN): $(OBJS_C) $(OBJS_ASM)
	$(CC) $(CFLAGS) -o $(COLLEEN) $(OBJ_DIR)/$(COLLEEN).o
	$(CC) $(ASMFLAGS) -o $(COLLEEN)_asm $(OBJ_DIR)/$(COLLEEN)_asm.o

$(GRACE): $(OBJS_C) $(OBJS_ASM)
	$(CC) $(CFLAGS) -o $(GRACE) $(OBJ_DIR)/$(GRACE).o
	$(CC) $(ASMFLAGS) -o $(GRACE)_asm $(OBJ_DIR)/$(GRACE)_asm.o

diff: $(COLLEEN) $(GRACE)
	./$(COLLEEN) > tmp
	./$(COLLEEN)_asm > tmp_asm
	-$(DIFF) $(SRCC_DIR)/$(COLLEEN).c tmp
	-$(DIFF) $(SRCASM_DIR)/$(COLLEEN)_asm.s tmp_asm
	./$(GRACE)
	./$(GRACE)_asm
	-$(DIFF) $(SRCC_DIR)/$(GRACE).c $(GRACE)_kid.c
	-$(DIFF) $(SRCASM_DIR)/$(GRACE)_asm.s $(GRACE)_kid.s

$(OBJ_DIR)/%.o: $(SRCC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<

$(OBJ_DIR)/%.o: $(SRCASM_DIR)/%.s
	$(NA) $(NAFL) -o $@ $<

$(OBJS_C): | $(OBJ_DIR)

$(OBJS_ASM): | $(OBJ_DIR)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

.PHONY: all clean fclean re test
