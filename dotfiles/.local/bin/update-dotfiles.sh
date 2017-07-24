#!/bin/bash

set -eu

DOTFILES_REPO="${1:-${HOME}/Projects/dotfiles}"
HOSTNAME="$(hostname)"

stow -R -d "${DOTFILES_REPO}" -t ~ dotfiles

if [[ -d "${DOTFILES_REPO}/${HOSTNAME}" ]]; then
	stow -R -d "${DOTFILES_REPO}" -t ~ "${HOSTNAME}"
fi
