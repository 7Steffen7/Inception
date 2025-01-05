FROM debian:bullseye


RUN apt-get update && \
	apt-get install mariadb-server -y
	# mkdir -p /run/mysql && \
	# mkdir -p /var/lib/mysql && \
	# chown mysql:mysql /var/lib/mysql

COPY conf/script.sh /usr/local/bin/script.sh
# COPY conf/script.sh /
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /usr/local/bin/script.sh

CMD ["/usr/local/bin/script.sh"]
