#!/bin/bash
apt-get install -y build-essential linux-headers-`uname -r`
aptitude reinstall -y nvidia-331 nvidia-331-updates
