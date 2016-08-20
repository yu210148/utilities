#!/bin/bash

# remove known good entries from /var/log/openwrt.log
sed -f /etc/log_trim.sed /var/log/openwrt.log > /tmp/2openwrt.log

# rotate log
mv /tmp/2openwrt.log /var/log/openwrt.log

# restart logging
service rsyslog restart
