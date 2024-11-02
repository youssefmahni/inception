#!/bin/sh

sleep 3

mkdir -p /var/www/html/wordpress/public_html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wpcli

cd /var/www/html/wordpress/public_html

wpcli core download --path=/var/www/html/wordpress/public_html --allow-root

mv wp-config-sample.php wp-config.php

wpcli config set DB_NAME $DB_NAME --allow-root
wpcli config set DB_USER $DB_USER_NAME --allow-root
wpcli config set DB_PASSWORD $DB_USER_PASS --allow-root
wpcli config set DB_HOST $DB_HOST --allow-root

wpcli core install --url=${DOMAIN_NAME} --title=${SITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --allow-root --path=/var/www/html/wordpress/public_html
wpcli user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=${WORDPRESS_PASSWORD} --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:3030/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php/
chmod 755 /run/php/

wpcli config set WP_REDIS_HOST $REDIS_HOST --allow-root
wpcli config set WP_REDIS_PORT $REDIS_PORT --raw --allow-root 
wpcli config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
wpcli config set WP_CACHE true --raw --allow-root
wpcli config set WP_REDIS_DISABLE_DROPIN_CHECK true --raw --allow-root
wpcli plugin install redis-cache --activate --allow-root
wpcli redis enable --allow-root

exec php-fpm7.4 -F