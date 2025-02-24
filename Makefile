help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  restart-nginx                  Restart Nginx web server"
	@echo "  open-nginx                     Interactive mode on nginx image"
	@echo "  open-php                       Interactive mode on php image"
	@echo "  open-mysql                     Interactive mode on mysql image"
	
restart-nginx:
	@docker exec web-nginx nginx -s reload
	
open-nginx:
	@docker exec -it web-nginx /bin/bash

open-php:
	@docker exec -it web-php /bin/bash

open-mysql:
	@docker exec -it web-mysql /bin/bash	