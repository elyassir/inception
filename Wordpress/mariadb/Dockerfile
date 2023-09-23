FROM alpine:latest

# Install MariaDB Server and other required packages
RUN  apk update \
 && apk add mariadb mariadb-client

EXPOSE 3306

ENV WP_URL=crendeha.42.fr
ENV WP_TITLE=wordpress

ENV WP_ADMIN_LOGIN=boss
ENV WP_ADMIN_PASSWORD=boss12345
ENV WP_ADMIN_EMAIL=boss@42.fr

ENV WP_USER_LOGIN=crendeha
ENV WP_USER_PASSWORD=12345
ENV WP_USER_EMAIL=crendeha@42.fr

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/initial_db.sql /var/www/


# RUN service mysql start && mysql < /var/www/initial_db.sql 
# RUN rm -f /var/www/initial_db.sql;

CMD ["mysqld"]