#Variables
NAME	= minishell
NAME_B	= minishell_bonus
SRC_DIR	= src/
B_DIR	= src_bonus/
OBJ_DIR	= obj/
OBJ_DIR_B = obj_bonus/
CFLAGS	=  -g -Werror -Wall -Wextra -I include/
CC		= gcc
RM		= rm -f

#Libft
LIBFT_A		= libft.a
LIBFT_DIR	= libft/
LIBFT		= $(addprefix $(LIBFT_DIR), $(LIBFT_A))

#ReadLIne
RD_A		= libreadline.a
RDH_A		= libhistory.a
RD_DIR		= lib/
RD			= $(addprefix $(RD_DIR), $(RD_A))
RDH			= $(addprefix $(RD_DIR), $(RDH_A))

#Sources Files
SRC_FILES =	minishell ft_expansion ft_parsing_meta ft_reading\
			ft_quoting start_builtins utils_builtins start_exec\
			ft_utils ft_init_cmd start_childs utils_childs ft_sigaction \
			ft_utils_token start_redir next_builtins ft_heredoc start_env \
			ft_utils_here ft_expansion_here utils_2buil wildcards \
			wild_utils wild_utils2 wild_utils3 utils_3buil \

B_FILES	  = minishell ft_expansion ft_parsing_meta ft_reading\
			ft_quoting start_builtins utils_builtins start_exec\
			ft_utils ft_init_cmd start_childs utils_childs ft_sigaction \
			ft_utils_token start_redir next_builtins ft_heredoc start_env \
			ft_utils_here ft_expansion_here utils_2buil wildcards \
 			wild_utils wild_utils2 wild_utils3 utils_3buil ft_utils_2token \
			next_start_exec ft_utils_3tokens \

#SRC MANDA
SRC		=	$(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ		=	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))
OBJF	=	.cache_exists

#SRC BONUS 
B_SRC	=	$(addprefix $(B_DIR), $(addsuffix .c, $(B_FILES)))
OBJ_B	=	$(addprefix $(OBJ_DIR_B), $(addsuffix .o, $(B_FILES)))
OBJF_B	=	obj_bonus/

####

all	: $(NAME)

$(NAME):	$(OBJ)
			make -C $(LIBFT_DIR)
			$(CC) $(OBJ) $(LIBFT) $(RD) $(RDH) -lcurses -lreadline -o $(NAME)

$(NAME_B): 	$(OBJ_B)
			make -C $(LIBFT_DIR)
			$(CC) $(OBJ_B) $(LIBFT) $(RD) $(RDH) -lcurses -lreadline -o $(NAME_B)

$(OBJ_DIR)%.o : $(SRC_DIR)%.c | $(OBJF)
				$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR_B)%.o : $(B_DIR)%.c | $(OBJF_B)
				$(CC) $(CFLAGS) -c $< -o $@

bonus: 		$(NAME_B)

$(OBJF)	:
			@mkdir -p $(OBJ_DIR)

$(OBJF_B)	:
			@mkdir -p $(OBJ_DIR_B)

clean	:
			$(RM) -r $(OBJ_DIR) $(OBJ_DIR_B)
			make -C $(LIBFT_DIR) clean
			$(RM) $(OBJF) $(OBJF_B) 

fclean	:	clean
			$(RM) $(NAME) $(NAME_B)
			make -C $(LIBFT_DIR) fclean

norm	:	
		@norminette libft/src/* src/* src_bonus/* include/m* include/c*

re		: fclean all

