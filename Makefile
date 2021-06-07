init-tls:
	@./manager.sh init
renew-tls:
	@./manager.sh renew
run:
	@docker-compose up
