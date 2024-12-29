#!/bin/bash

sleep 10

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