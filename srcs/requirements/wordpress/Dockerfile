FROM debian:bullseye

RUN apt-get update && apt-get upgrade && \
	apt-get -y install wget php7.3 php-fpm \
	php-mysql mariadb-client

# set download destination with -P
RUN wget https://wordpress.org/wordpress-6.7.1.tar.gz -P /var/www 

RUN cd /var/www && tar -xzf wordpress-6.7.1.tar.gz && rm wordpress-6.7.1.tar.gz && \
	chown -R root:root /var/www/wordpress

COPY conf/wp-config.php var/www/wordpress/wp-config.php