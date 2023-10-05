FROM	debian:buster

COPY	tools/setup.sh /tmp
COPY	tools/start.sh /tmp

RUN	apt-get update
RUN	apt-get install -y mariadb-server

RUN	chmod +x /tmp/setup.sh && chmod +x /tmp/start.sh && ./tmp/start.sh

CMD [ "./tmp/setup.sh" ]
