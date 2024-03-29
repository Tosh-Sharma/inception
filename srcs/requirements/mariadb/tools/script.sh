#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" >> /test.txt
echo "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" >> /test.txt
echo "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> /test.txt
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" >> /test.txt

service mariadb start;

mariadb -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mariadb -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop;
service mariadb start;
# exec mysqld_safe