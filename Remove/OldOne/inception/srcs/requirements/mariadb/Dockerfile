# Use the Debian base image
FROM debian:buster

# Install MariaDB Server and other required packages

RUN apt-get update && apt-get install \
	mariadb-server -y && \
	rm -rf /var/lib/apt/lists/*


# # Expose the default MariaDB port
EXPOSE 3306

ENV db_pass="Wordpress@2022"
ENV db_name="wp_database"
ENV db_user="wp_user"
ENV db_root_password="root"


RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/script.sh /
RUN chmod +x script.sh
RUN bash ./script.sh

RUN rm -rf create_user.sh


ENTRYPOINT [ "mysqld_safe" ]