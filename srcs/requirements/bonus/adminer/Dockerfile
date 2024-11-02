FROM debian:bullseye

RUN apt-get update > /dev/null 2>&1
RUN apt-get install -y php-cli php-json php-mysqli php-curl php-mbstring wget > /dev/null 2>&1
RUN mkdir -p  /var/www/html
RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/index.php > /dev/null 2>&1
RUN apt-get clean && rm -rf /var/lib/apt/lists/* > /dev/null 2>&1

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]