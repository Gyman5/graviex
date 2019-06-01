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

echo 'SECOND PART INSTALLED SUCCESSFULLY !'
echo 'NOW USE THIRD PART PEATIO-INSTALLER-THREE.sh'
echo -e "\n\n"

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

echo -e "\n\n"
echo -e "\033[34;7mInstalling RabbitMQ\e[0m"

echo 'deb http://www.rabbitmq.com/debian/ testing main' | sudo tee /etc/apt/sources.list.d/rabbitmq.list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install rabbitmq-server

sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server restart
wget http://localhost:15672/cli/rabbitmqadmin
chmod +x rabbitmqadmin
sudo mv rabbitmqadmin /usr/local/sbin

echo -e "\n\n"
echo -e "\033[34;7mInstalling nginx and passenger\e[0m"
sudo apt-get install -y nginx-extras passenger

sudo rm /etc/nginx/passenger.conf
touch /etc/nginx/passenger.conf

cat <<EOF > /etc/nginx/passenger.conf
passenger_root /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini;
passenger_ruby /home/deploy/.rbenv/shims/ruby;
EOF

sudo sed -i 's+# include /etc/nginx/passenger.conf;+include /etc/nginx/passenger.conf;+g' /etc/nginx/nginx.conf

echo -e "\n\n"
echo -e "\033[34;7mInstalling JavaScript Runtime\e[0m"

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs

echo -e "\n\n"
echo -e "\033[34;7mInstalling ImageMagick\e[0m"

sudo apt-get -y install imagemagick gsfonts

echo -e "\n\n"
echo -e "\033[34;7mSetup production environment variable\e[0m"

echo "export RAILS_ENV=production" >> ~/.bashrc
source ~/.bashrc
