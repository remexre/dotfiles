#!/bin/bash

set -eu

# Perform the requested action.
case "${1}" in
	media-next)
		playerctl next
		;;
	media-pause)
		playerctl pause
		;;
	media-play)
		playerctl play
		;;
	media-previous)
		playerctl previous
		;;
	mute)
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		;;
	volume-up)
		pactl set-sink-volume @DEFAULT_SINK@ +10%
		;;
	volume-down)
		pactl set-sink-volume @DEFAULT_SINK@ -10%
		;;
	*)
		echo "Unknown action: ${1}" >&2
		exit 1
		;;
esac

# Update i3blocks.
SIGNUM="$(python -c 'import signal; print(signal.SIGRTMIN+10)')"
pkill "-${SIGNUM}" i3blocks
