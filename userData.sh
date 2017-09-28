#!/bin/bash

yum update -y
yum install -y httpd24 php56 mysql55-server php56-mysqlnd
service httpd start
chkconfig httpd on
groupadd www
usermod -a -G www vagrant
chown -R root:www /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} +
find /var/www -type f -exec chmod 0664 {} +
cd /var/www/
rm -rf html
wget https://s3.eu-west-2.amazonaws.com/qacfridayexample/html.zip
unzip html
