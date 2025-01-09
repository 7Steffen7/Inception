FROM debian:bullseye-slim


RUN apt-get update && \
	apt-get -y install \
	--no-install-recommends \
	mariadb-server && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

COPY conf/script.sh /usr/local/bin/script.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /usr/local/bin/script.sh

CMD ["/usr/local/bin/script.sh"]