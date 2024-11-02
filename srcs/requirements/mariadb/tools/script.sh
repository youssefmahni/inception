#!/bin/sh

service mariadb start

while ! mysqladmin ping --silent; do
    echo "Waiting for MariaDB to start..."
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
service mariadb stop
exec mysqld