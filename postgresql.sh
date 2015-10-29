#!/usr/bin/env bash

# ports : 5432
if [ ! -e "/etc/apt/sources.list.d/pgdg.list" ]; then
	echo "adding pgsql to apt source.list";
	sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list';
fi
sudo apt-get install -y wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.4 postgresql-9.4-postgis-2.1

if [ -e "/tmp/pg_hb.conf" ]; then
	echo "replacing old pg_hba";
	sudo mv /etc/postgresql/9.4/main/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf.bak;
	sudo mv /tmp/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf;
fi

# allow postgresql connection from external app
count=`cat /etc/postgresql/9.4/main/postgresql.conf|grep 'listen_addresses= "*"'|wc -l`
if [ $count -eq 0 ]; then
	sudo sh -c 'echo "listen_addresses = '"'*'"'" >> /etc/postgresql/9.4/main/postgresql.conf';
fi