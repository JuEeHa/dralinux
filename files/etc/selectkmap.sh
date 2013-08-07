#!/bin/sh

while true
do
	echo -n 'Select keymap: '
	read LINE
	if test -n "$(ls /kmap | grep "^$LINE.kmap$")"
	then
		echo "$LINE" > /etc/kmap.conf
		exit 0
	else
		echo "Available keymaps: "$(ls /kmap | sed 's/.kmap$//')
	fi
done
