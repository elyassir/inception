# Use the Debian base image
FROM debian:buster

# Install MariaDB Server and other required packages
RUN apt-get update -y && apt-get install mariadb-server -y

# # Expose the default MariaDB port
EXPOSE 3306

ENV db_pass="Wordpress@2022"
ENV db_name="wp_database"
ENV db_user="wp_user"

COPY tools/script.sh /
# COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/ # hta l mn b3d

# # Start MariaDB when the container starts

ENTRYPOINT [ "./script.sh" ]

# # Optionally, you can add a volume for persisting data
# VOLUME ["/var/lib/mysql"]
