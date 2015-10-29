#!/usr/bin/env bash

# php 5.5
sudo apt-get install -y python-software-properties

sudo add-apt-repository -y ppa:ondrej/php5
sudo apt-get update
sudo apt-get install -y php5-fpm php5-common php5-curl php5-xdebug php5-intl php5-apcu php5-gd


#count=`php5 -i | grep memcache|wc -l`
memcached=`which memcached|wc -l`
postgresql=`which psql|wc -l`
mongo=`which mongod|wc -l`


# install php memcached extension
if [ $memcached -ne 0 ]
then
     sudo apt-get install -y php5-memcached
fi

# install php pgsql extension
if [ $postgresql -ne 0 ]
then
     sudo apt-get install -y php5-pgsql
fi

# install php mongodb extension
if [ $mongo -ne 0 ]
then
     sudo apt-get install -y php5-mongo
fi

# composer global install
if [ ! -e "/usr/local/bin/composer" ]; then
	curl -sS https://getcomposer.org/installer | sudo php5 -- --install-dir=/usr/local/bin --filename=composer;
else
	sudo composer self-update;
fi