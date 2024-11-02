#!/bin/bash

cd /etc/nginx/sites-enabled

ln -s ../sites-available/wordpress.conf .

nginx -g "daemon off;"