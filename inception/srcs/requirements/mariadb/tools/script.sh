#!/bin/bash

service mysql start
# add IF NOT EXISTS
# wa0ila Wordpress@2022 is password
echo "CREATE DATABASE $db_name ;" > tmp.txt
echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_pass';" >> tmp.txt
echo "GRANT ALL ON $db_name.* TO '$db_user'@'%';" >> tmp.txt
#echo "ALTER USER 'root'@'%' IDENTIFIED BY '12345' ;" >> tmp.txt
echo "FLUSH PRIVILEGES;" >> tmp.txt

mysql < tmp.txt

# to keep the container running run this command in CMD in your Dockerfile /usr/bin/mysqld_safe

/usr/bin/mysqld_safe

# mysqld_safe Starting mysqld daemon with databases from /var/lib/mysql