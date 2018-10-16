# Raspberry Pi Kernel update for Sixfab 3G/LTE shield's usb drivers

Original Raspbian Jessie kernel version 4.4  doesn't support Quectel EC25/UC20 modules,  you can update your Raspberry Pi's kernel.

1. Run `sudo rpi-update` command and update kernel your Raspberry pi

2. Reboot your machine
  
3. You can use your modem with /dev/ttyUSB3

Issues:

1. If ttyUSB3 does not appear under folder /dev/ when the 3G ( UC20 ) module is plugged in, and 'device not accepting device address XXX, error -71'  appears on the 'dmesg' output, please change your USB cable.
