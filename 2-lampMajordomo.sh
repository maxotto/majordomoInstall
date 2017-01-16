# LAMP
sudo apt-get install mysql-server mysql-client -y
sudo apt-get install apache2 apache2-utils -y
sudo apt-get install php5-cgi php5-cli libapache2-mod-php5 php5 php-pear php5-xcache php5-curl -y
sudo apt-get install phpmyadmin -y
sudo a2enmod rewrite
sudo nano /etc/apache2/sites-available/000-default.conf
sudo apache2ctl restart
# UTILS
sudo apt-get install mosquitto -y
sudo apt-get install vsftpd
sudo service vsftpd restart
sudo apt-get install mplayer -y
sudo apt-get install mc -y 
sudo apt-get install vlc -y 
# MAJORDOMO
git clone https://github.com/sergejey/majordomo.git
sudo rm -rf /var/www/html
mv majordomo html
sudo cp -R html /var/www/html
rm -rf html
# RIGHTS
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 777 /var/www/html
sudo usermod -a -G audio www-data
# MAIN CYCLE
# @reboot /usr/bin/php /var/www/html/cycle.php &
# @reboot echo "hi" > /home/pi/reboot.txt 2>&1
# @reboot /usr/bin/php /var/www/cycle.php
# @reboot /usr/sbin/ntpdate -s ntp.time.in.ua > /dev/null
sudo nano /etc/crontab -e