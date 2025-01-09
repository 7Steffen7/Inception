FROM debian:bullseye-slim

RUN apt-get update && \
	apt-get -y install \
	--no-install-recommends \
	curl \
	netcat \
	php7.4 \
	php-fpm \
	php-mysql &&\
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY /conf/auto_config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/auto_config.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/usr/local/bin/auto_config.sh"]