#!/bin/sh -

service stackdriver-agent restart
sleep 20

pid=$(pgrep stackdriver)

while kill -0 $pid
do
sleep 100
done
exit 1
