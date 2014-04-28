#!/usr/bin/env bash

# First, add/fetch latest repositories
apt-get update && apt-get install -qy python-software-properties build-essential git-core htop vim
add-apt-repository ppa:ondrej/php5
apt-get update

# Apache
apt-get install -qy apache2
a2enmod rewrite
echo "ServerName localhost" >> /etc/apache2/apache2.conf
# Run as vagrant user. Hacky, but it's easiest way to fix perms
sudo sed -i 's/www-data/vagrant/g' /etc/apache2/envvars
cp /vagrant/vagrant/vhost.tpl /etc/apache2/sites-available/000-default.conf
rm -rf /var/www && ln -fs /vagrant /var/www
service apache2 restart

# PHP and MySQL
export DEBIAN_FRONTEND=noninteractive
apt-get install -qy libapache2-mod-php5 curl mysql-server-5.5 php5-cli php5-mysql php5-curl php5-mcrypt php5-xdebug

# Composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Laravel
cd /var/www
composer install --dev
echo "CREATE DATABASE IF NOT EXISTS piclib" | mysql
php artisan migrate --env=local
php artisan db:seed --env=local

# Zsh
cd ~
apt-get install -qy zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
cp /vagrant/vagrant/zsh.conf /home/vagrant/.zshrc
mv /root/.oh-my-zsh /home/vagrant/
chsh -s `which zsh` vagrant

echo "Hurrah! All done."
