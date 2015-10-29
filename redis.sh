#!/usr/bin/env bash

#port 6379

sudo apt-get install -y python-software-properties

sudo add-apt-repository -y ppa:chris-lea/redis-server

sudo apt-get update
sudo apt-get install -y redis-server