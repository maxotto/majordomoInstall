wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list
sudo upt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
pause
sudo apt-get install mysql-server mysql-client
sudo apt-get install apache2 apache2-utils
sudo apt-get install php5-cgi php5-cli libapache2-mod-php5 php5 php-pear php5-xcache php5-curl
sudo apt-get install phpmyadmin
sudo mod_rewrite sudo a2enmod rewrite
sudo nano /etc/apache2/sites-available/000-default.conf
sudo apache2ctl restart
sudo apt-get install unzip
sudo apt-get install mosquitto
wget https://github.com/sergejey/majordomo/archive/master.zip
unzip master.zip
#sudo mkdir /var/www/html
sudo rm -rf /var/www/html
mv majordomo-master html
sudo cp -R html /var/www/html
rm -rf html
rm master.zip
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 777 /var/www/html
