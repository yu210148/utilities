#!/usr/bin/php
<?php
$stationUrl = "/var/www/html/cbc_recording/cbc.asf";


function stop_player(){
    $command = "killall vlc";
    $command = escapeshellcmd($command);
    return 0;
}

function return_seconds(){
    // a helper function to take the system time 'now', subtract 3 hours, then
    // return the number of seconds between 5:30am eastern and 'now' for passing
    // in to the start_player_west_coast() function
    // NOTE: the use case for this is time shifting the Toronto morning
    // radio show for the west coast of North America so although this should
    // work for any time zone where the file that you want to play was recorded 
    // server side already (I've got a cron job that records the show to a webserver
    // on my lan) the variable names suggest the 3 hour difference between Eastern
    // and Pacific time.

    //$systemTimeZone = date_default_timezone_get();
    //$timezoneOffsetSeconds = get_timezone_offset('America/New_York', $systemTimeZone);
    
    // the the unix time 'now' using the system's time zone
    $unixTimeNow = time();
    //$unixTimeThreeHoursAgo = strtotime($timezoneOffsetSeconds . ' seconds', $unixTimeNow); 
    $unixTimeFiveThirtyEastern = strtotime(date('Y-m-d') . " 05:30");
    
    // we're getting up a bit later than we used to so I'm going to start this an hour earlier so we get more of the show --KL
    $unixTimeFiveThirtyEastern = strtotime(date('Y-m-d') . " 06:30");
    
    //$unixTimeFiveThirtyEastern = $unixTimeFiveThirtyEastern - $timezoneOffsetSeconds;
    //$fiveThirty = date('Y-m-d H:i:s', $unixTimeFiveThirtyEastern);
    
    // seconds between now -3 hours and 5:30am
    //$secondsIntoFileToStart = $unixTimeFiveThirtyEastern - $unixTimeThreeHoursAgo;
    //return $secondsIntoFileToStart;
    
    // I seem to be making this more complicated than it needs to be.
    // Take the unix time now and subtract the unix time at 5:30am from it
    // to get the number of seconds in to the file to start
    $secondsIntoFileToStart = $unixTimeNow - $unixTimeFiveThirtyEastern;    
    return $secondsIntoFileToStart;
}

function start_player_west_coast($stationUrl, $secondsIntoFile){
    // a function to start playing a station on a 3 hour delay 
    // note this only works when a recording of the station exists somewhere
    // it doesn't do the recording itself. --KL 2015-03-22
    
    // sanity check: if the secondsIntoFile value is negative we cannot proceed
    if ($secondsIntoFile < 0){
        // start playing at the beginning
        print "<br>I can't start playing $secondsIntoFile into the program.  I'll start at the beginning.<br>";
        $secondsIntoFile = 0;
    } // end if
    
    // stop the player in case it's running
    stop_player();
    //$stationUrl = urldecode($stationUrl);
    // starting vlc with a web interface to control it from
    $command = "vlc --intf http --http-port 9090 --http-password password --start-time $secondsIntoFile $stationUrl";
    $command = escapeshellcmd($command);
    exec($command . " > /dev/null &");
    //print $command;
    
    return 0;
}

function main($stationUrl){
    $secondsIntoFile = return_seconds();
    start_player_west_coast($stationUrl, $secondsIntoFile);
}

main($stationUrl);