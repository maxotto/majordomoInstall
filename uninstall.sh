#UNINSTALL All made before
sudo service apache2 stop 
sudo rm -rf /var/www/

sudo apt-get purge phpmyadmin -y
whereis phpmyadmin 
read -rsp $'Press enter to continue...\n'
clear

sudo apt-get purge php5-cgi php5-cli libapache2-mod-php5 php5 php-pear php5-xcache php5-curl -y
whereis php 
read -rsp $'Press enter to continue...\n'
clear

sudo apt-get purge apache2 apache2-utils -y
whereis apache2 
read -rsp $'Press enter to continue...\n'
clear

sudo apt-get purge mysql-server mysql-client -y
whereis mysql 
read -rsp $'Press enter to continue...\n'
clear

sudo apt-get autoremove 

