.PHONY: build


certbot-test:
	@chmod +x ./ssl/register_ssl.sh
	@sudo ./ssl/register_ssl.sh \
								--domains "$(DOMAINS)" \
								--email $(EMAIL) \
								--data-path ./ssl/certbot \
								--staging 1

certbot-prod:
	@chmod +x ./ssl/register_ssl.sh
	@sudo ./ssl/register_ssl.sh \
								--domains "$(DOMAINS)" \
								--email $(EMAIL) \
								--data-path ./ssl/certbot \
								--staging 0

deploy-prod:
	@docker-compose \
					-f docker-compose.yml \
					up -d --build --force-recreate