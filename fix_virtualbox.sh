#!/bin/bash
########################################
# A script to get VirtualBox to boot
# guest VMs after a kernel upgrade
#
# This script is released under GPLv2 or
# later.
#
# 2014-02-22 Kevin Lucas
# yu210148@gmail.com
########################################

apt-get install linux-headers-`uname -r`
#sudo dpkg-reconfigure virtualbox-dkms
#sudo dpkg-reconfigure virtualbox
#aptitude reinstall virtualbox-4.3
apt-get install linux-headers-amd64
#/etc/init.d/vboxdrv setup
/sbin/vboxconfig

