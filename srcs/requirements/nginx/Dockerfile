FROM debian:bullseye

RUN apt update -y

RUN apt install -y nginx openssl > /dev/null 2>&1

RUN mkdir -p /var/www/html/wordpress/public_html

RUN openssl req -x509 -nodes -days 1024 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/C=MA/ST=Khouribga/L=1337KhouribgaCompus/O=1337CodingSchool/OU=DevOpsDepartment/CN=ymahni.42.fr/emailAddress=ymahni@student.42.fr"

COPY conf/self-signed.conf /etc/nginx/snippets/

COPY conf/wordpress.conf /etc/nginx/sites-available

COPY tools/script.sh /

RUN chmod +x /script.sh

CMD ["sh", "/script.sh"]