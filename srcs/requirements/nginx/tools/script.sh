#!/bin/bash

cd /etc/nginx/sites-enabled

ln -s ../sites-available/wordpress.conf .


echo "Starting Nginx"
nginx -g "daemon off;"