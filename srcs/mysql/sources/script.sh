#!/bin/sh
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root -e "CREATE DATABASE wordpress; CREATE USER 'safernan'@'%' IDENTIFIED BY 'safernan';GRANT ALL PRIVILEGES ON *.* TO 'safernan'@'%';"
mysql -u root < wordpress.sql
sed -i "s|.*skip-networking.*|#skip-networking|g" /etc/my.cnf.d/mariadb-server.cnf
/etc/init.d/mariadb stop
/usr/bin/supervisord -c /etc/supervisord.conf