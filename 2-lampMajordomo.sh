sudo apt-get install mysql-server mysql-client -y
sudo apt-get install apache2 apache2-utils -y
sudo apt-get install php5-cgi php5-cli libapache2-mod-php5 php5 php-pear php5-xcache php5-curl -y
sudo apt-get install phpmyadmin -y
sudo mod_rewrite sudo a2enmod rewrite
sudo nano /etc/apache2/sites-available/000-default.conf
sudo apache2ctl restart
sudo apt-get install mosquitto -y
git clone https://github.com/sergejey/majordomo.git
sudo rm -rf /var/www/html
mv majordomo html
sudo cp -R html /var/www/html
rm -rf html
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 777 /var/www/html
