#!/bin/sh

echo "DB_NAME is ${DB_NAME}\n DB_USER=${DB_USER}\n DB_PASSWORD=${DB_PASSWORD}" >> /test.txt

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root --version=latest --force

mv wp-config-sample.php wp-config.php

# if [ ! -f "/var/www/wp-config.php" ]; then
# cat << EOF > /var/www/wp-config.php
# <?php
# define( 'DB_NAME', '${DB_NAME}' );
# define( 'DB_USER', '${DB_USER}' );
# define( 'DB_PASSWORD', '${DB_PASSWORD}' );
# define( 'DB_HOST', 'mariadb' );
# define( 'DB_CHARSET', 'utf8' );
# define( 'DB_COLLATE', '' );
# define('FS_METHOD','direct');
# \$table_prefix = 'wp_';
# define( 'WP_DEBUG', false );
# if ( ! defined( 'ABSPATH' ) ) {
# define( 'ABSPATH', __DIR__ . '/' );}
# define( 'WP_REDIS_HOST', 'redis' );
# define( 'WP_REDIS_PORT', 6379 );
# define( 'WP_REDIS_TIMEOUT', 1 );
# define( 'WP_REDIS_READ_TIMEOUT', 1 );
# define( 'WP_REDIS_DATABASE', 0 );
# require_once ABSPATH . 'wp-settings.php';
# EOF
# fi

sed -i "s/username_here/superman/g" wp-config.php
sed -i "s/password_here/batman123/g" wp-config.php
sed -i "s/localhost/mariadb/g" wp-config.php
sed -i "s/database_name_here/wordpress/g" wp-config.php

# sleep 10;
# sleep 10;

# wp core install \
# 	--allow-root \
# 	--url=${DOMAIN_NAME} \
# 	--title=\'${WP_TITLE}\' \
# 	--admin_user=\'${WP_ADMIN}\' \
# 	--admin_password=${WP_ADMIN_PASSWORD} \
# 	--admin_email=${WP_MAIL} \
# 	--skip-email

# wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${DB_USER} --admin_password=${DB_PASSWORD} --admin_email=${WP_MAIL} --skip-email

# wp user create --allow-root --path=/var/www $WP_USER $WP_MAIL_USER --role=contributor --user_pass=$WP_PASSWORD
