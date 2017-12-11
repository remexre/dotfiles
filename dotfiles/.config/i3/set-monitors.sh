#!/bin/bash

set -eu

cd "$(dirname ${BASH_SOURCE})"
CONFIG_FILE="set-monitors.$(hostname).sh"
if [[ -x "${CONFIG_FILE}" ]]; then
	source ${CONFIG_FILE}
else
	echo "No set-monitors.sh found: ${CONFIG_FILE}"
fi
feh --bg-fill /usr/share/backgrounds/snazzy_2560_1700.png
