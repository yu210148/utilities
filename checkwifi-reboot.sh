#!/bin/bash

#http://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/

ping -c4 192.168.40.1 > /dev/null
if [ $? != 0 ]
then
    sudo /sbin/shutdown -r now
    #/sbin/ifdown 'wlan0'
    #sleep 5
    #/sbin/ifup --force 'wlan0'
fi