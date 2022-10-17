################## Program #################

NAME	=		Inception

################## RULES ###################

all: $(NAME)

$(NAME):
	docker compose -f docker_compose.yml up -d

################## CLEAN ###################

clean:
	docker compose -f docker_compose.yml down

fclean: clean
	docker rmi mariadb_explore:latest  wordpress_barebones:1.0  nginx_server:2.0
	docker volume rm wp_data

re: fclean all

.PHONY: all clean fclean re