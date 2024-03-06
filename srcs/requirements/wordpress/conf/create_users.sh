#!/bin/sh

if [ -f "/var/www/wp-config.php" ]
then 
	echo "wordpress already downloaded"
else
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --allow-root --version=latest --force

	mv wp-config-sample.php wp-config.php

	sed -i "s/username_here/$DB_USER/g" wp-config.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config.php
	sed -i "s/localhost/mariadb/g" wp-config.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config.php

	wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${DB_USER} --admin_password=${DB_PASSWORD} --admin_email=${WP_MAIL} --skip-email

	wp user create --allow-root --path=/var/www $WP_USER $WP_MAIL_USER --role=contributor --user_pass=$WP_PASSWORD
	
fi
exec $@
