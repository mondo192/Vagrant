#!/usr/bin/env bash

PASSWORD='12345678'
sudo apt-get update &&  \
sudo apt-get -y --with-new-pkgs upgrade && \
sudo apt-get -y autoremove && sudo apt-get autoclean

sudo apt-get install -y php7.4

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server
sudo apt-get install php7.4-mysql

sudo systemctl restart mysql