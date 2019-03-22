#!/bin/sh

while true; do

	ping -I wwan0 -c 1 8.8.8.8

	if [ $? -eq 0 ]; then
		echo "Connection up, reconnect not required..."
	else
		echo "Connection down, reconnecting..."
		sudo ./quectel-CM -s #APN
	fi

	sleep 1
done
