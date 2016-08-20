#!/bin/bash
# a simple script to ping hosts on a network and return ones that respond
# change the ip address below to suit your needs
# this script is free sofware GPL licenced.

seq 1 254 | parallel -j0 ping -c 1 192.168.40.{} | grep "64 bytes"