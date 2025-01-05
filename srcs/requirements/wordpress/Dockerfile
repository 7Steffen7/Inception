FROM debian:bullseye

RUN apt-get update && apt-get upgrade && \
	apt-get -y install curl php7.4 php-fpm \
	php-mysql mariadb-client && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# set download destination with -P
# RUN wget https://wordpress.org/wordpress-6.7.1.tar.gz -P /var/www 

# RUN cd /var/www && tar -xzf wordpress-6.7.1.tar.gz && rm wordpress-6.7.1.tar.gz && \
	# chown -R root:root /var/www/wordpress

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	# chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# COPY conf/wp-config.php /var/www/wordpress/wp-config.php
COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY /conf/auto_config.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/auto_config.sh

WORKDIR /var/www/html

EXPOSE 9000

# CMD ["auto_config.sh"]
CMD ["sh", "/usr/local/bin/auto_config.sh"]