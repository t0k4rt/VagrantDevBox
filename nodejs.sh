#!/usr/bin/env bash

apt-get install -y curl
curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
sudo apt-get install -y nodejs
sudo npm install npm -g