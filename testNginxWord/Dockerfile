FROM alpine:latest

RUN mkdir /run/mysqld/ 

RUN apk update && apk upgrade && apk add mariadb mariadb-client nginx mysql mysql-client

#mysql_secure_installation << _EOF_
#
#Y
#root4life
#root4life
#Y
#n
#Y
#Y
#_EOF_