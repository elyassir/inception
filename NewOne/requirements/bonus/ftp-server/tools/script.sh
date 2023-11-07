#!/bin/bash

mkdir -p /var/run/vsftpd/empty
# this step is to create a directory for vsftpd to store its pid file

echo "write_enable=YES" >> /etc/vsftpd.conf
# This is to allow the ftp user to upload files to the server
echo "userlist_enable=YES" >> /etc/vsftpd.conf
# This is to enable the userlist feature
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
# This is to specify the path of the userlist file
# echo "userlist_deny=NO" >> /etc/vsftpd.conf
# # This is to specify whether to deny or allow login to users in the userlist file, NO means allow

# TEST pasv_enable=NO
echo "pasv_enable=YES" >> /etc/vsftpd.conf
# This is to enable the passive mode, passive mode is used for data transfer
# port 20 is used for control 
# passive_ports is for data transfer
echo "pasv_min_port=21000" >> /etc/vsftpd.conf
echo "pasv_max_port=21010" >> /etc/vsftpd.conf

echo "chroot_local_user=YES" >> /etc/vsftpd.conf
# This is to specify whether to jail the user in its home directory, YES means jail
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
# This is to specify whether to allow the user to write to its home directory

useradd $FTP_USER

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
# This is to change the owner of the home directory of the ftp user to the ftp user itself
# -R means recursive, which means to change the owner of all the files and directories in the home directory of the ftp user

echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

echo $FTP_USER > /etc/vsftpd.userlist

vsftpd /etc/vsftpd.conf