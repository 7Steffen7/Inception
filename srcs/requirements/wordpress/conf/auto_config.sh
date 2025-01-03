#!/bin/bash

sleep 10

cd /var/www/html
curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
chmod +x /usr/local/bin/wp

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Configuring Wordpress ..."
	
	wp config create \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--path=/var/www/html \
		--allow-root
else
	echo "wp-config.php already exists. Skipping configuration."
fi