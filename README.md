# majordomoInstall
Helps to install Majordomo Smart House system on Raspberry PI Paspbian Jessie
##Step 1 - preparations
1 - `git clone https://github.com/maxotto/majordomoInstall.git`

2 - `cd majordomoInstall`

3 - `bash 1-updateUpgradeReboot.sh`

Then Raspberry reboots. To prevent it, edit script `nano 1-updateUpgradeReboot.sh`

##Step 2 - installation
First, edit `nano 2-lampMajordomo.sh` and set DB_PASSWORD="YourLovelyPassWord". Use this password during MySql and PhpMyAdmin installation. Then:

`cd majordomoInstall`

`bash 2-lampMajordomo.sh`

Pay attentionon last string of the script `sudo /usr/bin/php /var/www/html/cycle.php`. We need to run it to create some folders with right rights.

After that open browser, go to 127.0.0.1. Majordomo setup page should apear.


