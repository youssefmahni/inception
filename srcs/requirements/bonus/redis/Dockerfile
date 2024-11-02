FROM debian:bullseye

RUN apt update > /dev/null 2>&1
RUN apt install -y redis-server > /dev/null 2>&1

COPY redis.conf /etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf"]