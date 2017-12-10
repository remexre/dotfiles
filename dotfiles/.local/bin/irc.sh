#!/bin/bash

FONT="xft:Go Mono Nerd Font:pixelsize=20"

exec urxvt \
	-fn "${FONT}" \
	-fb "${FONT}" \
	-fi "${FONT}" \
	-fbi "${FONT}" \
	-e weechat
