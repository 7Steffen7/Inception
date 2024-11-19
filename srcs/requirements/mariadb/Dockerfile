FROM debian:bullseye


RUN apt-get update && \
	apt-get install mariadb-server -y && \
	mkdir -p /run/mysql && \
	mkdir -p /var/lib/mysql && \
	chown mysql:mysql /var/lib/mysql

COPY script.sh /
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /script.sh

CMD ["/script.sh"]
