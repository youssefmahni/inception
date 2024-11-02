FROM debian:bullseye

RUN apt update -y
# RUN apt upgrade -y
RUN apt install -y wget cmake curl git bash \
zlib1g-dev uuid-dev libmnl-dev gcc make pkg-config \
autoconf autogen automake libuv1-dev > /dev/null 2>&1

EXPOSE 19999

COPY script.sh /script.sh
RUN chmod +x /script.sh

CMD ["sh","/script.sh"]