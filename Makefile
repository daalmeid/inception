################## Program #################

NAME	=		Inception

################## .yml FILE ################

YML		=		srcs/docker_compose.yml

################## RULES ###################

all: $(NAME)

$(NAME):
	docker compose -f $(YML) up -d

################## CLEAN ###################

stop:
	docker compose -f $(YML) stop

clean:
	docker compose -f $(YML) down

fclean:
	docker compose -f $(YML) down --rmi all --volumes

re: fclean all

.PHONY: all clean fclean re stop