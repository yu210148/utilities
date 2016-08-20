#!/bin/bash
# a little script to check if pulseaudio is running
# Copyright 2016 Kevin Lucas yu210148@gmail.com
# Licence GPLv3 or later.

#FPULSE="$(ps -A | grep pulseaudio | awk '{ print $4})"
#echo "${FPULSE}"

OUTPUT="$(ps -A | grep pulseaudio | awk '{ print $4}')"
#echo "${OUTPUT}"
if [ -z ${OUTPUT} ]; 
then 
    #echo "not found";
    pulseaudio --start
fi
