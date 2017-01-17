DB_NAME="db_terminal"
DB_USER="root"
DB_PASSWORD="myDBPassword"

# LAMP CORE
sudo apt-get install mysql-server mysql-client -y
sudo apt-get install apache2 apache2-utils -y
sudo apt-get install php5-cgi php5-cli libapache2-mod-php5 php5 php-pear php5-xcache php5-curl -y

# PHP CONFIG
ERROR_REPORTING="E_ALL \& ~E_NOTICE \& ~E_WARNING \& ~E_STRICT"
sed -i "s/^error_reporting = .*/error_reporting = ${ERROR_REPORTING}/" /etc/php5/apache2/php.ini

sed -i "s/^display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini
sed -i "s/^memory_limit = .*/memory_limit = 1024M/" /etc/php5/apache2/php.ini
sed -i "s/^upload_max_filesize = .*/upload_max_filesize = 30M/" /etc/php5/apache2/php.ini
sed -i "s/^max_execution_time = .*/max_execution_time = 90/" /etc/php5/apache2/php.ini
sed -i "s/^date.timezone = .*/date.timezone = Europe\x2FMoscow/" /etc/php5/apache2/php.ini

# PHPMYADMIN INSTALL
sudo apt-get install phpmyadmin -y

# APACHE CONFIG
sudo a2enmod rewrite

# Add ServerName to httpd.conf
# echo "ServerName localhost" > /etc/apache2/httpd.confapdate

VHOST=$(cat <<EOF
<VirtualHost *:80>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	#ServerName www.example.com

	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/html
	<Directory "/var/www/html">
	    Options FollowSymLinks
	    AllowOverride All
	</Directory>

	# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
	# error, crit, alert, emerg.
	# It is also possible to configure the loglevel for particular
	# modules, e.g.
	#LogLevel info ssl:warn

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF
)
echo "${VHOST}" > etc/apache2/sites-available/000-default.conf
sudo apache2ctl restart

# UTILS
sudo apt-get install mosquitto -y
sudo apt-get install vsftpd -y
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

# MAIN CYCLE AUTOSTART. PUT THIS ROWS AT THE END OF CRONTAB
# @reboot /usr/bin/php /var/www/html/cycle.php &
# @reboot echo "hi" > /home/pi/reboot.txt 2>&1
# @reboot /usr/sbin/ntpdate -s ntp.time.in.ua > /dev/null
sudo nano /etc/crontab -e

# DB SETUP

$ECHO $n "CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;" >> sql.sql
sudo mysql --user=$DB_USER --password=$DB_PASSWORD < sql.sql
rm sql.sql
sudo mysql  --user=$DB_USER --password=$DB_PASSWORD $DB_NAME < /var/www/html/$DB_NAME.sql
cp /var/www/html/config.php.sample /var/www/html/config.php
sudo sed -i "s/^Define('DB_PASSWORD'.*/Define('DB_PASSWORD', '$DB_PASSWORD');" /var/www/html/config.php
sudo nano /var/www/html/config.php
