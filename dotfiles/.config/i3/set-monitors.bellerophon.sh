#!/bin/bash

set -eu

xrandr --output DP-0 --primary \
	--output DP-3 --right-of DP-0 \
	--output HDMI-0 --left-of DP-0
