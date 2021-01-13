#!/bin/sh

: '
QMI installation script by Sixfab
This script is strictly for Raspberry Pi OS.

Created By Metin Koc, Nov 2018
Modified by Saeed Johar, 11th June 2019
'

YELLOW='\033[1;33m'
RED='\033[0;31m'
SET='\033[0m'

DIR=/home/pi/files
UDHCPC_DIR=/usr/share/udhcpc

echo "${YELLOW}Clean Old Files${SET}"
if [ -d $DIR ]; then 
    rm -rf $DIR
    rm -rf $DIR.zip ; fi # for old directory

echo "${YELLOW}Change directory to /home/pi${SET}"
cd /home/pi

echo "${YELLOW}Downloading source files${SET}"
wget https://github.com/sixfab/Sixfab_RPi_3G-4G-LTE_Base_Shield/raw/master/tutorials/QMI_tutorial/src/quectel-CM.zip -O quectel-CM.zip
unzip quectel-CM.zip -d $DIR && rm -r quectel-CM.zip

echo "${YELLOW}Checking Kernel${SET}"

case $(uname -r) in
    4.14*) echo $(uname -r) based kernel found
        echo "${YELLOW}Downloading source files${SET}"
        wget https://github.com/sixfab/Sixfab_RPi_3G-4G-LTE_Base_Shield/raw/master/tutorials/QMI_tutorial/src/4.14.zip -O drivers.zip
        unzip drivers.zip -d $DIR && rm -r drivers.zip;;
    4.19*) echo $(uname -r) based kernel found 
        echo "${YELLOW}Downloading source files${SET}"
        wget https://github.com/sixfab/Sixfab_RPi_3G-4G-LTE_Base_Shield/raw/master/tutorials/QMI_tutorial/src/4.19.1.zip -O drivers.zip
        unzip drivers.zip -d $DIR && rm -r drivers.zip;;
    5.4*) echo $(uname -r) based kernel contains driver;;
    5.10*) echo $(uname -r) based kernel contains driver;;

    *) echo "Driver for $(uname -r) kernel not found";exit 1;

esac

echo "${YELLOW}Installing udhcpc${SET}"
apt install udhcpc

echo "denyinterfaces wwan0" >> /etc/dhcpcd.conf
sudo systemctl daemon-reload
sudo systemctl restart dhcpcd

echo "${YELLOW}Copying udhcpc default script${SET}"
mkdir -p $UDHCPC_DIR
cp $DIR/quectel-CM/default.script $UDHCPC_DIR/
chmod +x $UDHCPC_DIR/default.script

if [ -d $DIR/drivers ]; then
    echo "${YELLOW}Change directory to $DIR/drivers${SET}";
    cd $DIR/drivers;
    make && make install;    
fi

echo "${YELLOW}Change directory to $DIR/quectel-CM${SET}"
cd $DIR/quectel-CM
make

chmod 777  $DIR/quectel-CM
echo "${YELLOW}After reboot please follow commands mentioned below${SET}"
echo "${YELLOW}go to $DIR/quectel-CM and run sudo ./quectel-CM -s [YOUR APN]${SET}"

read -p "Press ENTER key to reboot" ENTER
reboot
