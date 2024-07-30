NAME = libft.a
CFLAGS    = -Wall -Wextra -Werror
OBJS    = $(SOURCES:.c=.o)
OBJDIR = ./
SRCDIR = ./
INCDIR  = ./libft.h
FILES = ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_strchr.c ft_strdup.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_tolower.c ft_toupper.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c
B_FILES = ft_lstadd_back_bonus.c ft_lstadd_front_bonus.c ft_lstclear_bonus.c ft_lstdelone_bonus.c ft_lstiter_bonus.c ft_lstlast_bonus.c ft_lstmap_bonus.c ft_lstnew_bonus.c ft_lstsize_bonus.c
SOURCES = $(addprefix $(SRCDIR)/, $(FILES))
BONUS_SRCS = $(addprefix $(SRCDIR)/, $(B_FILES))
BONUS_OBJS = $(BONUS_SRCS:.c=.o)


ifdef WITH_BONUS
OBJS += $(BONUS_OBJS)
endif

.c.o: $(OBJS)
	$(CC) $(CFLAGS) -I $(INCDIR) -c $< -o $@

all: $(NAME)

$(NAME) : $(OBJS)
	ar -rcs $(NAME) $(OBJS)

bonus:
	make WITH_BONUS=1

clean:
	$(RM) *.o

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all, clean, fclean, re, bonus