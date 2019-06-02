#!/bin/bash
# Peatio-repair-installer.sh: Crypto Currency Exchange
# Author: AlgoBasket
# Skype algobasket
# Email algobasket@gmail.com

################################################################
#  Goals of the script:
#  To install the secured crypto currency exchange
#
#  Script by Algobasket.
################################################################
echo -e "\n\n"
echo -e "\033[34;7mInstalling Ruby Build\e[0m"

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL &
sudo apt-get update
rbenv install -v 2.2.1
rbenv global 2.2.1

echo -e "\n\n"
echo -e "\033[34;7mInstalling Gem\e[0m"
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler -v 1.17.3
rbenv rehash

echo -e "\n\n"
echo -e "\033[34;7mInstalling MYSQL\e[0m"

sudo apt-get -y install mysql-server  mysql-client  libmysqlclient-dev

echo -e "\n\n"
echo -e "\033[34;7mInstalling REDIS\e[0m"

sudo apt install -y redis-server

echo 'SECOND PART INSTALLED SUCCESSFULLY !'
echo 'NOW USE THIRD PART PEATIO-INSTALLER-THREE.sh'
echo -e "\n\n"
