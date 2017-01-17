# majordomoInstall
Helps to install Majordomo Smart House system on Raspberry PI Paspbian Jessie
##Step 1 - preparations
It is better to use fresh Raspbian OS installation. I use [NOOBS](https://www.raspberrypi.org/downloads/noobs/ "download page"). Set up Raspberry according to your wish. Set WiFi connection, timezone, locale and so on. Then:

1 - `git clone https://github.com/maxotto/majordomoInstall.git`

2 - `cd majordomoInstall`

3 - `bash 1-updateUpgradeReboot.sh`

At finish Raspberry reboots. To prevent it, edit script `nano 1-updateUpgradeReboot.sh` and comment last line.
Make full backup image of the SD card (recomended)

##Step 2 - installation
First, edit `nano 2-lampMajordomo.sh` and set DB_PASSWORD="YourLovelyPassWord". Use this password during MySql and PhpMyAdmin installation. Then:

`cd majordomoInstall`

`bash 2-lampMajordomo.sh`

Read the script to see which utilities are going to be installed (mc, vlc, mosquitto and so on). Edit according to your taste.

During installation you will be asked to create `crontab` file. Use `crontab.example` as example or use comments in `2-lampMajordomo.sh` script

Pay attentionon last string of the script is `sudo /usr/bin/php /var/www/html/cycle.php`. We need to run it to create some folders with right rights.

Then open a browser, go to 127.0.0.1. Majordomo setup page should appear.
Reboot by `sudo reboot` to check main cycle is starting at boot time. File `reboot.txt` should appear in home folder. Majordomo should be silent about errors in main cycle.
