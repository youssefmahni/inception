#!/bin/sh

# Start MariaDB
echo "Starting MariaDB..."
mysqld_safe --datadir=/var/lib/mysql &

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to start..."
while ! mysqladmin ping --silent; do
    sleep 1
done

# Create database
echo "Creating database $DB_NAME..."
mysql -u root -p"$DB_ROOT_PASS" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;" || { echo "Failed to create database"; exit 1; }

# Create user and grant privileges
echo "Creating user $DB_USER_NAME..."
mysql -u root -p"$DB_ROOT_PASS" -e "CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS';" || { echo "Failed to create user"; exit 1; }

echo "Granting privileges to $DB_USER_NAME..."
mysql -u root -p"$DB_ROOT_PASS" -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER_NAME'@'%';" || { echo "Failed to grant privileges"; exit 1; }

# Flush privileges
echo "Flushing privileges..."
mysql -u root -p"$DB_ROOT_PASS" -e "FLUSH PRIVILEGES;" || { echo "Failed to flush privileges"; exit 1; }

# Stop MariaDB gracefully
echo "Stopping MariaDB..."
mysqladmin -u root -p"$DB_ROOT_PASS" shutdown || { echo "Failed to stop MariaDB"; exit 1; }

# Restart MariaDB
echo "Restarting MariaDB..."
exec mysqld