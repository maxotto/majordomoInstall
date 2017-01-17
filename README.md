# majordomoInstall
Helps to install Majordomo Smart House system on Raspberry PI Paspbian Jessie
##Step 1 - preparations
1 - `git clone https://github.com/maxotto/majordomoInstall.git`
2 - `cd majordomoInstall`
3 - `bash 1-updateUpgradeReboot.sh`
Then Raspberry reboots. To prevent it, edit script `nano 1-updateUpgradeReboot.sh`

##Step 2 - installation
First, edit 2-lampMajordomo.sh and set DB_PASSWORD="myDBPassword". Use this password during MySql and PhpMyAdmin installation
`cd majordomoInstall`
`bash 2-lampMajordomo.sh`

