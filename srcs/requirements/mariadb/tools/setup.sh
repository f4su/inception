#!/bin/bash

service mysql start
mysql -sfu root <<EOS
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS WordPressDB;
CREATE OR REPLACE USER 'jgainza-'@'%' IDENTIFIED BY "$MYSQL_PASSWORD";
GRANT ALL ON WordPressDB.* TO 'jgainza-'@'%' IDENTIFIED BY "$MYSQL_PASSWORD";
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD";
EOS


killall mysqld
mysqld_safe
