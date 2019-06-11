#!/bin/sh

: '
QMI installation script by Sixfab

Created By Metin Koc, Nov 2018
Modified by Saeed Johar, 11th June 2019
'

YELLOW='\033[1;33m'
RED='\033[0;31m'
SET='\033[0m'

echo "${YELLOW}Clear Files${SET}"
rm -rf /home/pi/files
rm -rf /home/pi/files.zip

echo "${YELLOW}Change directory to /home/pi${SET}"
cd /home/pi

echo "${YELLOW}Downloading source files${SET}"
wget https://github.com/sixfab/Sixfab_RPi_3G-4G-LTE_Base_Shield/raw/master/tutorials/QMI_tutorial/src/quectel-CM.zip
unzip quectel-CM.zip -d /home/pi/files/ && rm -r quectel-CM.zip


#echo "${YELLOW}Updating rpi${SET}"
#apt-get update

#echo "${YELLOW}Downlading kernel headers${SET}"
#apt-get install raspberrypi-kernel-headers
echo "${YELLOW}Checking Kernel${SET}"

case $(uname -r) in
    4.14*) echo $(uname -r) based kernel found
        echo "${YELLOW}Downloading source files${SET}"
        wget https://github.com/sixfab/Sixfab_RPi_3G-4G-LTE_Base_Shield/raw/master/tutorials/QMI_tutorial/src/4.14.zip -O drivers.zip
        unzip drivers.zip -d /home/pi/files/ && rm -r drivers.zip;;
    4.19*) echo $(uname -r) based kernel found 
        echo "${YELLOW}Downloading source files${SET}"
        wget https://github.com/sixfab/Sixfab_RPi_3G-4G-LTE_Base_Shield/raw/master/tutorials/QMI_tutorial/src/4.19.1.zip -O drivers.zip
        unzip drivers.zip -d /home/pi/files/ && rm -r drivers.zip;;
    *) echo "Driver for $(uname -r) kernel not found";exit 1;

esac

echo "${YELLOW}Installing udhcpc${SET}"
apt-get install udhcpc

echo "${YELLOW}Copying udhcpc default script${SET}"
mkdir -p /usr/share/udhcpc
cp /home/pi/files/quectel-CM/default.script /usr/share/udhcpc/
chmod +x /usr/share/udhcpc/default.script

echo "${YELLOW}Change directory to /home/pi/files/drivers${SET}"
cd /home/pi/files/drivers
make && make install

echo "${YELLOW}Change directory to /home/pi/files/quectel-CM${SET}"
cd /home/pi/files/quectel-CM
make

echo "${YELLOW}After reboot please follow commands mentioned below${SET}"
echo "${YELLOW}go to /home/pi/files/quectel-CM and run sudo ./quectel-CM -s [YOUR APN]${SET}"

read -p "Press ENTER key to reboot" ENTER
reboot