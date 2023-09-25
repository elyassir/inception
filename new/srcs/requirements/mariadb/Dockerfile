FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/tmp;

CMD ["mysqld"]


# f 50-server.cnf you need to change the bind-address to i gs
# in 50-server.cnf you need to change the #port = 3306 to port = 3306
# in tmp , i gs you dont need to add root 


# mysql -u yel-mass -p
# 12345
# SHOW DATABASES;
# USE wordpress;
# SHOW TABLES;
# SELECT * FROM wp_users;
# SELECT * FROM wp_comments;
# SELECT * FROM wp_posts;


# khask darori thyd hadchi o dir script 
# bash t3tih mn .env