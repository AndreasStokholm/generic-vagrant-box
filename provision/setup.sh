#!/bin/bash

# Some sensible stuff
set -e # Exit on first error

echo "Added comment"
echo "Updating packages"
sudo apt-get update -y

echo "Installing Nginx"
sudo apt-get install nginx -y > /dev/null

echo "Configuring Nginx"
cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost > /dev/null
ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default

sudo service nginx restart