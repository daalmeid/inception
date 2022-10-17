#!/bin/bash

cd /var/www/html/daalmeid.42.fr
while : ; do
    if  (nc -w 3 -zv live_mariadb.network_exploring 3306) ; then
        wp config create --allow-root \
        --dbname=wordpressdb \
        --dbuser=wordpress \
        --dbpass=wordpress \
        --dbhost=live_mariadb
        wp core install --allow-root \
        --url=daalmeid.42.fr \
        --title="Awesome Inception" \
        --admin_user=username \
        --admin_password=password \
        --admin_email=test@email.com
        wp user create --allow-root \
        $WP_USER daalmeid@inception.com \
        --user_pass=$WP_U_PASS
        break
    fi
    done

exec php-fpm7.3 -F -R