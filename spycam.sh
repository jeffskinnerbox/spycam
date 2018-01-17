#!/bin/bash

SpyCam Video Streamer - captures the video from the camera and streams it to a designated port on its localhost
SpyCam WebSocket Relay - consumes the streaming video, process the video, and forwards it to a 
SpyCam WebServer - 

# port 8080 used by SpyCam WebServer to stream the video to the world
# port 8081 WebServer uses it to listen for incoming MPEG-TS streaming video from SpyCam Video Streamer
# port 8082 is websocket connection establish by WebSocket Relay to be used by the WebServer

# Parse command line options
#USAGE="Usage: `basename $0` [-h] -t title -m message"
#while getopts ht:m: OPT; do
#    case "$OPT" in
#        h)
#            echo $USAGE
#            exit 0
#            ;;
#        t)
#            TITLE=$OPTARG
#            ;;
#        m)
#            MESSAGE=$OPTARG
#            ;;
#        \?)
#            # getopts issues an error message
#            echo $USAGE >&2
#            exit 1
#            ;;
#    esac
#done



############################ SpyCam WebSocket Relay ############################

# start the websocket relay
node ~/src/jsmpeg/websocket-relay.js password 8081 8082 &
echo "websocket-relay $!" > ~/src/spycam/spycam.pid
sleep 3



############################## # SpyCam WebServer ##############################

# start the web server so you can connect with the websocket
http-server ~/src/jsmpeg -p 8080 &
echo "http-server $!" >> ~/src/spycam/spycam.pid
sleep 3



########################### # SpyCam Video Streamer ############################

# start ffmpeg to capture video and send it to the websocket relay
ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 -f mpegts \
    -codec:v mpeg1video -s 640x480 -b:v 1000k -bf 0 http://localhost:8081/password &
echo "ffmpeg $!" >> ~/src/spycam/spycam.pid





# ALTENATIVE TO FFMPEG
# start avconv to capture video and send it to the websocket relay
#avconv -f rawvideo -framerate 25 -video_size 640x480 -i /dev/video0 -f mpegts -codec:v mpeg1video -s 640x480 -b:v 1000k -bf 0 http://localhost:8081/password &
#echo "avconv $!" >> ~/src/spycam/spycam.pid

# now go to a browser and view the streaming video
#google-chrome http://desktop:8080/view-stream.html
