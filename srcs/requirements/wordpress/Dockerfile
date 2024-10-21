FROM debian:bullseye

RUN apt-get update > /dev/null 2>&1

RUN apt-get install -y php7.3 php-fpm php-mysql > /dev/null 2>&1

RUN apt install -y curl redis-server php-redis > /dev/null 2>&1

COPY ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["sh","/script.sh"]
