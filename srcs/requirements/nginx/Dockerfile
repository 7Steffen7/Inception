FROM debian:bullseye-slim


RUN apt update && \
	apt -y install \
	nginx\
	curl\
	openssl && \
	mkdir -p \
	/etc/nginx/ssl \
	/var/run/nginx && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=DE/ST=BW/L=Heilbronn/O=42HN/OU=student/CN=sparth.42.fr"

RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

# curl = client for url
# ssl = SSL certificate 
# openseel req = create SSL certificate
# -x509 = type of certificate
# -nodes = no password (avoids prompt)
# -out path to store certificate
# -key path to store key
# -subj avoids prompt and pre-fill certificate