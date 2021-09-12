#!/bin/bash

volume_rl=$(pulsemixer --get-volume)
volume=($volume_rl)
volume=${volume[0]}
muted=$(pulsemixer --get-mute)

headphones_connected=$(pulsemixer --list-sinks \
	| grep 'Default' \
	| grep -E 'Headset|HD Audio Controller Analog')

if [[ $muted -eq 1 ]]; then
	echo "婢 $volume"
elif [[ $headphones_connected != "" ]]; then
	echo " $volume"
elif [[ $volume -eq 0 ]]; then
	echo " $volume"
elif [[ $volume -lt 65 ]]; then
	echo " $volume"
else
	echo " $volume"
fi
