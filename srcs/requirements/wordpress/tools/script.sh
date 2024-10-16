#!/bin/sh

sleep 3

mkdir -p /var/www/html/wordpress/public_html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wpcli

cd /var/www/html/wordpress/public_html

wpcli core download --path=/var/www/html/wordpress/public_html --allow-root

mv wp-config-sample.php wp-config.php

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$DB_NAME' );/" wp-config.php

sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$DB_USER_NAME' );/" wp-config.php

sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$DB_USER_PASS' );/" wp-config.php

sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '$DB_HOST' );/" wp-config.php

wpcli core install --url=${DOMAIN_NAME} --title=${SITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email --allow-root

wpcli user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=${WORDPRESS_PASSWORD} --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php/
chmod 755 /run/php/

exec php-fpm7.4 -F