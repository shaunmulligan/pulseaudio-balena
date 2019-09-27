#!/bin/bash

# Start pulseaudio
pulseaudio --log-level=1 --log-target=stderr --disallow-exit=true --exit-idle-time=180 --realtime  & > /dev/null 2>&1

# Test ble
btmgmt find -l

# Test bluetooth
hciconfig hci0 up
hciconfig
hcitool dev

# Test GPIO input buttons
evtest /dev/input/event1

while :
do
	echo "Just chilling..."
	sleep 30
done