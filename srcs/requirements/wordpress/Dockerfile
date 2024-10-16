FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql

RUN apt install -y curl

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["sh","/script.sh"]
