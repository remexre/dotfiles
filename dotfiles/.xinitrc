#!/bin/sh

if [[ -e /sys/devices/virtual/dmi/id/product_name ]]; then
	if [[ "$(< /sys/devices/virtual/dmi/id/product_name)" = "Samus" ]]; then
		xrdb -merge .hidpi.d/.Xresources
	fi
fi

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3 | tee -a /tmp/${USER}.$(date +%s).i3.log
