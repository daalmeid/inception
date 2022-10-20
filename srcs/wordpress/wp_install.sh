#!/bin/bash

LOOPS=0

cd /var/www/html/daalmeid.42.fr
while [ $LOOPS -lt 10 ] ; do
    if  (nc -w 3 -zv $DB_HOST.$NETWORK_NAME 3306) ; then
        wp config create --allow-root \
        --dbname=$WP_DATABASE \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASSWORD \
        --dbhost=$DB_HOST
        wp core install --allow-root \
        --url=daalmeid.42.fr \
        --title="Awesome Inception" \
        --admin_user=$ADMIN_USER \
        --admin_password=$ADMIN_PASSWORD \
        --admin_email=$ADMIN_EMAIL
        wp user create --allow-root \
        $WP_USER $WP_U_EMAIL \
        --user_pass=$WP_U_PASS
        break
    else
        sleep 1
        ((LOOPS++))
    fi
    done
if [ $LOOPS -eq 10 ] ; then
    echo "Server connection time-out: took longer than 10 seconds!" >&2
else
    exec "$@"
fi