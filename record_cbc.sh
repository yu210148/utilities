#!/bin/bash
rm -rf /var/www/html/cbc_recording/cbc.asf
mplayer -playlist http://playerservices.streamtheworld.com/pls/CBC_R1_TOR_H.pls -dumpstream -dumpfile /var/www/html/cbc_recording/cbc.asf
#mplayer http://14163.live.streamtheworld.com:80/CBC_R1_TOR_H_SC -dumpstream -dumpfile /var/www/cbc_recording/cbc.asf
#mplayer http://6093.live.streamtheworld.com:80/CBC_R1_TOR_H_SC -dumpstream -dumpfile /var/www/cbc_recording/cbc.asf
