#!/bin/sh

if [[ -e /sys/devices/virtual/dmi/id/product_name ]]; then
	if [[ "$(< /sys/devices/virtual/dmi/id/product_name)" = "Samus" ]]; then
		xrdb -merge .hidpi.d/.Xresources
	fi
fi

# Start the GNOME Keyring Daemon
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL
export SSH_AUTH_SOCK

# Start i3.
exec i3
