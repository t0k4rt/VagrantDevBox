#!/usr/bin/env bash

# ports : 5672, 5671, webui: 15672
if [ ! -e "/etc/apt/sources.list.d/rabbitmq.list" ]; then
	sudo sh -c 'echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list';
fi

wget --quiet -O - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y rabbitmq-server


sudo rabbitmq-plugins enable rabbitmq_management