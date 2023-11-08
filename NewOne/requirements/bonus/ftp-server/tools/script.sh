#!/bin/bash

FTP_USER=user
FTP_PASSWORD=pass

mkdir -p /var/run/vsftpd/empty
# this step is to create a directory for vsftpd to store its pid file

useradd $FTP_USER

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
# This is to change the owner of the home directory of the ftp user to the ftp user itself
# -R means recursive, which means to change the owner of all the files and directories in the home directory of the ftp user

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

echo $FTP_USER > /etc/vsftpd.userlist

vsftpd /etc/vsftpd.conf