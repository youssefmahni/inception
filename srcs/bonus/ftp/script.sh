#!/bin/sh

useradd -m $FTP_USER
echo "$FTP_USER:$FTP_PW" | chpasswd
echo $FTP_USER >> /etc/vsftpd.user_list

mkdir -p /var/ftp
mkdir -p /var/run/vsftpd/empty

chmod 755 /var/ftp
chown -R $FTP_USER:$FTP_USER /var/ftp

exec vsftpd /etc/vsftpd.conf