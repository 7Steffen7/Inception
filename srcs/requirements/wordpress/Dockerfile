FROM debian:bullseye-slim

RUN apt-get update && \
	apt-get -y install \
	--no-install-recommends \
	curl \
	ca-certificates \
	netcat \
    	php7.4 \
    	php7.4-fpm \
    	php7.4-mysql \
    	php7.4-gd \
    	php7.4-xml \
   	php7.4-mbstring \
    	php7.4-curl \
    	php7.4-zip \
    	php7.4-json \
    	php7.4-opcache \
	php-mysql && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY /conf/auto_config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/auto_config.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/usr/local/bin/auto_config.sh"]
