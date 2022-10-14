#!/bin/bash

sleep 10
cd /var/www/html/daalmeid.42.fr
wp config create --allow-root --dbname=wordpressdb --dbuser=wordpress --dbpass=wordpress --dbhost=live_mariadb
wp core install --allow-root --url=daalmeid.42.fr --title=Your_Blog_Title --admin_user=username --admin_password=password --admin_email=test@email.com

exec php-fpm7.3 -F -R