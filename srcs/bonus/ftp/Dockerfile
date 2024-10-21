FROM debian:bullseye

RUN apt update > /dev/null 2>&1
RUN apt install -y vsftpd > /dev/null 2>&1
RUN apt-get clean && rm -rf /var/lib/apt/lists/* > /dev/null 2>&1

COPY vsftpd.conf /etc/vsftpd.conf
EXPOSE 2121 21000-21010

COPY script.sh /script.sh
RUN chmod +x /script.sh

CMD ["sh","/script.sh"]