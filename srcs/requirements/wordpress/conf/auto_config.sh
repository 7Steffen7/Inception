#!/bin/bash

# create PHP runtime directory
if [ ! -d /run/php ]; then
	mkdir -p /run/php
fi

if [ ! -d "/var/www/html" ]; then
    mkdir -p /var/www/html
fi
chown -R www-data:www-data /var/www/html

# Wait for Database/mariaDB
echo "Waiting for database to start..."
# while ! mysqladmin -u "${DB_USER}" -p"${DB_PASS}" ping -h"${DB_HOST}" --silent; do
until nc -z "${DB_HOST}" 3306; do
	echo "waiting..."
	sleep 2
done
echo "Database is up and running"

# Download WP-CLI
if ! command -v wp >/dev/null 2>&1; then
	echo "Downloading WP-CLI..."
	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp
	chmod +x /usr/local/bin/wp
	echo "WP-CLI successfully installed"
fi

# Download WP-CORE
if [ ! -f "/var/www/html/wp-settings.php" ]; then
	echo "Downloading Wordpress core..."
	wp core download --allow-root
fi

# create wp-config.php
if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "Creating wp-config.php..."
	wp config create \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASS \
	--dbhost=$DB_HOST \
	--allow-root
fi

# Install WP
if ! wp core is-installed --allow-root >/dev/null 2>&1; then
	echo "Installing WordPress..."
	wp core install \
	--url="sparth.42.fr" \
	--title="Inception" \
	--admin_name=$ADMIN_NAME \
	--admin_password=$ADMIN_PASSWORD \
	--admin_email=$ADMIN_EMAIL \
	--allow-root
	
	echo "Creating WordPress User..."
	wp user create $USER_NAME $USER_EMAIL \
	--user_pass=$USER_PASS \
	--allow-root
fi


echo "Test Wordpress"
php-fpm7.4 -F