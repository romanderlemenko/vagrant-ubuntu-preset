#!/bin/bash

refresh()
{
    sudo apt-get --yes     update
    sudo apt-get --yes -f  install
    sudo apt-get --yes     autoremove
}

refresh

sudo add-apt-repository ppa:ondrej/php      -y
sudo apt-add-repository ppa:ansible/ansible -y

refresh

sudo apt-get --yes install python-software-properties
sudo apt-get --yes install software-properties-common

sudo apt-get --yes install vim curl git wget

sudo apt-get --yes install ansible

sudo apt-get --yes install php5.6
sudo apt-get --yes install php5.6-pdo php5.6-zip php5.6-curl php5.6-mcrypt php5.6-bcmath php5.6-pgsql php5.6-ssh php5.6-gd
sudo apt-get --yes install php5.6-xml php5.6-dba php5.6-soap php5.6-mysqli php5.6-xmlrpc php5.6-mysql php5.6-pdo php5.6-mbstring

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get --yes install nodejs

refresh
