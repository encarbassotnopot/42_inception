#!/bin/sh

php84 wp-cli.phar core install --url=$DOMAIN_NAME --title=Inception --admin_user=$WP_USER --admin_password=$WP_PASS --path=wordpress --admin_email="$WP_USER@student.42barcelona.com"

php84 wp-cli.phar user exists editor --path=wordpress

if [ $? -ne 0 ]; then
	php84 wp-cli.phar user create editor editor@42.fr --path=wordpress;
fi

php-fpm84 -FO
