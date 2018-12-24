#!/bin/sh

YELLOW='\033[1;33m'
RED='\033[0;31m'
SET='\033[0m'

	

echo "${YELLOW}Clear Files${SET}"
rm -rf /home/pi/files
rm -rf /home/pi/files.zip

echo "${YELLOW}Change directory to /home/pi${SET}"
cd /home/pi

echo "${YELLOW}Downloading source files${SET}"
wget https://sixfab.com/wp-content/uploads/2018/11/files.zip
unzip files.zip

echo "${YELLOW}Updating rpi${SET}"
apt-get update

#echo "${YELLOW}Downlading kernel headers${SET}"
#apt-get install raspberrypi-kernel-headers

echo "${YELLOW}Installing udhcpc${SET}"
apt-get install udhcpc

echo "${YELLOW}Copying udhcpc default script${SET}"
mkdir -p /usr/share/udhcpc
cp /home/pi/files/quectel-CM/default.script /usr/share/udhcpc/
chmod +x /usr/share/udhcpc/default.script

echo "${YELLOW}Change directory to /home/pi/files/drivers${SET}"
cd /home/pi/files/drivers
make clean && make && make install

echo "${YELLOW}Change directory to /home/pi/files/quectel-CM${SET}"
cd /home/pi/files/quectel-CM
make clean && make

echo "${YELLOW}After reboot please start following command${SET}"
echo "${YELLOW}go to /home/pi/files/quectel-CM and run sudo ./quectel-CM -s [YOUR APN]${SET}"

echo "${YELLOW}Press any key to reboot!${SET}"
read key
reboot