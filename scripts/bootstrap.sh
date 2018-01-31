#!/bin/bash

#
# Add required repositories\
#
sudo add-apt-repository ppa:ondrej/php      -y
sudo apt-add-repository ppa:ansible/ansible -y

sudo apt-get --yes update

sudo apt-get --yes install python-software-properties
sudo apt-get --yes install software-properties-common

sudo apt-get --yes install vim curl wget zsh nmap

sudo apt-get --yes install ansible

#
# Install PHP along with the most important extensions
#
sudo apt-get --yes install php5.6
sudo apt-get --yes install php5.6-pdo php5.6-zip php5.6-curl php5.6-mcrypt php5.6-bcmath php5.6-pgsql php5.6-ssh php5.6-gd
sudo apt-get --yes install php5.6-xml php5.6-dba php5.6-soap php5.6-mysqli php5.6-xmlrpc php5.6-mysql php5.6-pdo php5.6-mbstring

#
# Set PHP 5.6 as a default version of PHP
#
sudo update-alternatives --set php          /usr/bin/php5.6
sudo update-alternatives --set phar         /usr/bin/phar5.6
sudo update-alternatives --set phar.phar    /usr/bin/phar.phar5.6 

#
# Set Apache default settings
#
sudo a2enmod php5.6
sudo a2enmod rewrite
sudo service apache2 restart

#
# Install latets version of Nodejs
#
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get --yes install nodejs

#
# Install MySQL database
#
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password        password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again  password root'
sudo apt-get -y install mysql-server
sudo mysql -proot --execute="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
sudo sed -i -- 's/bind/#bind/g' /etc/mysql/my.cnf
sudo service mysql restart

#
# Clear everything unneeded after installation
#
sudo apt-get --yes autoremove
sudo apt-get --yes -f install

#
# Set Oh-My-Zsh as a default terminal both for root and vagrant user
#
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
