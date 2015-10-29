#!/usr/bin/env bash

# update system
# sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y curl ntp wget ca-certificates acl

# setup time sync
sudo sh -c 'printf "%s\n%s\n%s\n%s\n" "server 0.fr.pool.ntp.org" "server 1.fr.pool.ntp.org" "server 2.fr.pool.ntp.org" "server 3.fr.pool.ntp.org" >> /etc/ntp.conf'
sudo service ntp restart

# setup nfs
sudo apt-get install -y nfs-common portmap cachefilesd
sudo sh -c 'echo "RUN=yes" >> /etc/default/cachefilesd'

# check swap status
count=`sudo swapon -s|wc -l`
if [ $count -eq 1 ]; then 
	sudo dd if=/dev/zero of=/swapfile bs=1024 count=256k;
	sudo mkswap /swapfile;
	sudo swapon /swapfile;
fi

fstab=`cat /etc/fstab|grep swapfile|wc -l`
# add swapfile to fstab
if [ $fstab -eq 0 ]; then
	sudo sh -c 'echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab';
fi