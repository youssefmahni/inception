FROM debian:bullseye

RUN apt-get update > /dev/null 2>&1
RUN apt-get install -y mariadb-server > /dev/null 2>&1

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /

RUN chmod +x /script.sh

CMD ["sh","/script.sh"]