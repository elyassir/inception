#!/bin/bash

mkdir -p /var/run/vsftpd/empty


echo "write_enable=YES" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf

useradd -m -s /bin/bash $FTP_USER

echo $FTP_USER > /etc/vsftpd.userlist

echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER

/usr/sbin/vsftpd /etc/vsftpd.conf