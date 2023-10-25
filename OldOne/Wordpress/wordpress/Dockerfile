FROM debian:buster

RUN apt-get update
RUN apt-get -y install php7.3 php-mysqli php-fpm wget sendmail

EXPOSE 9000

ENV WP_URL=crendeha.42.fr
ENV WP_TITLE=wordpress

ENV WP_ADMIN_LOGIN=boss
ENV WP_ADMIN_PASSWORD=boss12345
ENV WP_ADMIN_EMAIL=boss@42.fr

ENV WP_USER_LOGIN=crendeha
ENV WP_USER_PASSWORD=12345
ENV WP_USER_EMAIL=crendeha@42.fr

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress_start.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]