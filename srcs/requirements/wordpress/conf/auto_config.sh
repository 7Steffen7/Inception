#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Configuring Wordpress ..."
	
	wp config create \
		--dbname=your_database_name \
		--dbuser=your_database_user \
		--dbpass=your_database_password \
		--dbhost=your_database_host \
		--path=/var/www/html \
		--allow-root
else
	echo "wp-config.php already exists. Skipping configuration."
fi