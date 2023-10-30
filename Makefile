COLLEEN	=	Colleen
GRACE	=	Grace
SULLY	=	Sully

OBJ_DIR		=	./objs
SRCC_DIR	=	./srcs_c
SRCASM_DIR	=	./srcs_asm

SRC_C	=	Colleen.c \
			Grace.c \
			Sully.c
SRC_ASM	=	Colleen_asm.s \
			Grace_asm.s
			# Sully_asm.s

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

all: $(COLLEEN) $(GRACE) $(SULLY)

clean:
	$(RM) $(OBJ_DIR)
	$(RM) tmp tmp_asm a.out
	$(RM) $(GRACE)_kid.c $(GRACE)_kid.s
	$(RM) $(SULLY)_4.c $(SULLY)_4
	$(RM) $(SULLY)_3.c $(SULLY)_3
	$(RM) $(SULLY)_2.c $(SULLY)_2
	$(RM) $(SULLY)_1.c $(SULLY)_1
	$(RM) $(SULLY)_0.c $(SULLY)_0
	$(RM) $(SULLY)_4.s $(SULLY)_4
	$(RM) $(SULLY)_3.s $(SULLY)_3
	$(RM) $(SULLY)_2.s $(SULLY)_2
	$(RM) $(SULLY)_1.s $(SULLY)_1
	$(RM) $(SULLY)_0.s $(SULLY)_0

fclean: clean
	$(RM) $(COLLEEN) $(COLLEEN)_asm
	$(RM) $(GRACE) $(GRACE)_asm
	$(RM) $(SULLY) $(SULLY)_asm

re: fclean all

$(COLLEEN): $(OBJS_C) $(OBJS_ASM)
	$(CC) $(CFLAGS) -o $(COLLEEN) $(OBJ_DIR)/$(COLLEEN).o
	$(CC) $(ASMFLAGS) -o $(COLLEEN)_asm $(OBJ_DIR)/$(COLLEEN)_asm.o

$(GRACE): $(OBJS_C) $(OBJS_ASM)
	$(CC) $(CFLAGS) -o $(GRACE) $(OBJ_DIR)/$(GRACE).o
	$(CC) $(ASMFLAGS) -o $(GRACE)_asm $(OBJ_DIR)/$(GRACE)_asm.o

$(SULLY): $(OBJS_C) $(OBJS_ASM)
	$(CC) $(CFLAGS) -o $(SULLY) $(OBJ_DIR)/$(SULLY).o
#	$(CC) $(ASMFLAGS) -o $(SULLY)_asm $(OBJ_DIR)/$(SULLY)_asm.o

diff: $(COLLEEN) $(GRACE) $(SULLY)
	./$(COLLEEN) > tmp
	./$(COLLEEN)_asm > tmp_asm
	-$(DIFF) $(SRCC_DIR)/$(COLLEEN).c tmp
	-$(DIFF) $(SRCASM_DIR)/$(COLLEEN)_asm.s tmp_asm
	./$(GRACE)
	./$(GRACE)_asm
	-$(DIFF) $(SRCC_DIR)/$(GRACE).c $(GRACE)_kid.c
	-$(DIFF) $(SRCASM_DIR)/$(GRACE)_asm.s $(GRACE)_kid.s
	./$(SULLY)
#	./$(SULLY)_asm
	-$(DIFF) $(SRCC_DIR)/$(SULLY).c $(SULLY)_4.c
	-$(DIFF) $(SRCC_DIR)/$(SULLY).c $(SULLY)_3.c
	-$(DIFF) $(SRCC_DIR)/$(SULLY).c $(SULLY)_2.c
	-$(DIFF) $(SRCC_DIR)/$(SULLY).c $(SULLY)_1.c
	-$(DIFF) $(SRCC_DIR)/$(SULLY).c $(SULLY)_0.c
	-$(DIFF) $(SULLY)_3.c $(SULLY)_2.c
	# -$(DIFF) $(SRCASM_DIR)/$(SULLY)_asm.s $(SULLY)_4.s
	# -$(DIFF) $(SRCASM_DIR)/$(SULLY)_asm.s $(SULLY)_3.s
	# -$(DIFF) $(SRCASM_DIR)/$(SULLY)_asm.s $(SULLY)_2.s
	# -$(DIFF) $(SRCASM_DIR)/$(SULLY)_asm.s $(SULLY)_1.s
	# -$(DIFF) $(SRCASM_DIR)/$(SULLY)_asm.s $(SULLY)_0.s
	# -$(DIFF) $(SULLY)_3.s $(SULLY)_2.s

$(OBJ_DIR)/%.o: $(SRCC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ -c $<

$(OBJ_DIR)/%.o: $(SRCASM_DIR)/%.s
	$(NA) $(NAFL) -o $@ $<

$(OBJS_C): | $(OBJ_DIR)

$(OBJS_ASM): | $(OBJ_DIR)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

.PHONY: all clean fclean re test
