#!/bin/bash
set -e

echo "Setting up MariaDB directories..."
mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

echo "Starting MariaDB..."
exec mysqld_safe &

echo "Waiting for MariaDB to start..."
until mysqladmin ping --silent; do
	echo "Waiting..."
	sleep 2
done

# if ! mysql -

# startup mysq;
# mkdir -p /var/run/mysqld
# chown -R mysql:mysql /var/run/mysqld
# service mysql start;

# until mysqladmin ping --silent; do
# 	echo "Waiting for MariaDB to start..."
# 	sleep 2
# done
# create table
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
echo "Create Database..."
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
echo "Create User..."
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
echo "Grant all privileges..."
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
echo "alter root"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# mysql -e "FLUSH PRIVILEGES;"
echo "flush privileges"
mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe