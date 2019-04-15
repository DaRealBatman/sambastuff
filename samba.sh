#!/bin/bash
# lefuttatása: sudo ./sambascript.sh
# FURÁN MŰKÖDIK, NE HASZNÁLD!
echo samba >/etc/hostname
echo "127.0.0.1    localhost" >/etc/hosts
echo "127.0.1.1    samba" >>/etc/hosts
apt-get update&&apt-get install samba -y
mkdir /srv/kozos
chmod 777 /srv/kozos
mkdir /srv/readonly
chmod 755 /srv/readonly
mv /etc/samba/smb.conf /etc/samba/smb.conf.old
cp ./smb.conf /etc/samba/smb.conf
service smbd restart
testparm
sudo adduser user2 --gecos "user2,,," --disabled-password
echo "user2:user2jelszo" | sudo chpasswd
mkdir /srv/user2
chown user2 /srv/user2
chmod 700 /srv/user2
# felhasználó felvétele kézzel (sudo smbpasswd -a user2, majd bekéri a jelszót)
# sudo service smbd restart
# teszt kliensről: smb://ipcim/user2
