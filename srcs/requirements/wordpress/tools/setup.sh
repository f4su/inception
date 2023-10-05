#!/bin/sh

mkdir -p /var/www/html/

cd /var/www/html

wp core download --locale=es_ES --allow-root

wp --path=/var/www/html config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --locale=es_ES --allow-root --skip-check

wp core install --path=/var/www/html  --url=${DOMAIN_NAME} --title="esto es una pagina test asi es" --admin_name=${WP_ADMIN_USER} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email="jgainza-@student.42urduliz.com" --skip-email --allow-root

wp user create --allow-root --path=/var/www/html ${WP_USER} testmail@hotmail.com --user_pass=${WP_PASSWORD} --role="author"
