# majordomoInstall
Helps to install Majordomo Smart House system on Raspberry PI Paspbian Jessie
##Step 1 - preparations
It is better to use fresh Raspbian OS installation. I use [NOOBS](https://www.raspberrypi.org/downloads/noobs/ "download page"). Set up Raspberry according to your wish. Set WiFi connection, timezone, locale and so on. Then:

1 - `git clone https://github.com/maxotto/majordomoInstall.git`

2 - `cd majordomoInstall`

3 - `bash 1-updateUpgradeReboot.sh`

At finish Raspberry reboots. To prevent it, edit script `nano 1-updateUpgradeReboot.sh` and comment last line.
Make full backup image of the SD card (recommended)

##Step 2 - installation
`cd majordomoInstall`

First, edit `nano 2-lampMajordomo.sh` and set DB_PASSWORD="YourLovelyPassWord". Use this password during MySql and PhpMyAdmin installation. Then:

`bash 2-lampMajordomo.sh`

Read the script to see which utilities are going to be installed (mc, vlc, mosquitto and so on). Edit according to your taste.

During installation you will be asked to create `crontab` file. Use `crontab.example` as example or use comments in `2-lampMajordomo.sh` script

Pay attentionon, last line of the script is `sudo /usr/bin/php /var/www/html/cycle.php`. We need to run it to create some folders with right rights (777) before WEB subsystem does it itself with wrong rigths(771).

Then open a browser, go to 127.0.0.1. Majordomo setup page should appear.
Reboot by `sudo reboot` to check main cycle is starting at boot time. File `reboot.txt` should appear in home folder. Majordomo WEB interface should be silent about errors in main cycle.

2017/01/22 - `uninstall. sh` added. Intended to purge LAMP components installed by `2-lampMajordomo.sh`
