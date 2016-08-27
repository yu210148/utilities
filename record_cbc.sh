#!/bin/bash
rm -rf /var/www/html/cbc_recording/cbc.asf
# commened out below line 2016-08-27 --KL
#mplayer -playlist http://playerservices.streamtheworld.com/pls/CBC_R1_TOR_H.pls -dumpstream -dumpfile /var/www/html/cbc_recording/cbc.asf

#mplayer http://14163.live.streamtheworld.com:80/CBC_R1_TOR_H_SC -dumpstream -dumpfile /var/www/cbc_recording/cbc.asf
#mplayer http://6093.live.streamtheworld.com:80/CBC_R1_TOR_H_SC -dumpstream -dumpfile /var/www/cbc_recording/cbc.asf

# on 2016-08-27 it appears that the cbc have changed their stream so I've commented
# out the above line and put this one in pointing at their new stream --KL
mplayer http://cbc_r1_tor.akacast.akamaistream.net/7/632/451661/v1/rc.akacast.akamaistream.net/cbc_r1_tor -dumpstream -dumpfile /var/www/html/cbc_recording/cbc.asf
