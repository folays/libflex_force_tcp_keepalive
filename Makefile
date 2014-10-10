NAME	= libflex_force_tcp_keepalive
PRELOAD	= $(NAME).so
CC	= gcc
RM	= rm -f

CFLAGS	= -fPIC

SRC	= hook.c
OBJ	= $(SRC:.c=.o)

all	: $(NAME)

re	: fclean all

$(NAME)	: $(PRELOAD)

$(PRELOAD) : $(OBJ)
	$(CC) -o $(PRELOAD) -shared $(OBJ)

install	:
	echo "export LD_PRELOAD=$(PWD)/$(PRELOAD)" >> /etc/default/rsyslog

clean	:
	-$(RM) $(OBJ) *~

fclean	: clean
	-$(RM) $(PRELOAD)
