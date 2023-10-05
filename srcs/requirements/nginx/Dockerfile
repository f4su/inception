FROM	debian:buster

RUN	apt-get update && apt-get install -y nginx

RUN	rm -f /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default

COPY	conf/nginx.conf /etc/nginx/conf.d/
COPY	tools/certificate.crt /etc/nginx/
COPY	tools/certificate.key /etc/nginx/

CMD	[ "nginx","-g","daemon off;" ]
