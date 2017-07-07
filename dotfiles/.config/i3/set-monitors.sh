#!/bin/bash

set -eu

CONFIG_FILE="set-monitors.$(hostname).sh"
if [[ -x "${CONFIG_FILE}" ]]; then
	source ${CONFIG_FILE}
else
	echo "No set-monitors.sh found: ${CONFIG_FILE}"
fi
