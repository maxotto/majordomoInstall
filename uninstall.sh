#UNINSTALL All made before
sudo service apache2 stop 
sudo rm -rf /var/www/

sudo apt-get purge phpmyadmin -y
sudo apt-get autoremove
whereis phpmyadmin 
read -rsp $'Press enter to continue...\n'
clear

sudo apt-get purge php5-cgi php5-cli libapache2-mod-php5 php5 php-pear php5-xcache php5-curl -y
sudo apt-get autoremove
whereis php 
read -rsp $'Press enter to continue...\n'
clear

sudo apt-get purge apache2 apache2-utils -y
sudo apt-get autoremove
whereis apache2 
read -rsp $'Press enter to continue...\n'
clear

sudo apt-get purge mysql-server mysql-client -y
sudo apt-get autoremove
whereis mysql 
read -rsp $'Press enter to continue...\n'
clear

