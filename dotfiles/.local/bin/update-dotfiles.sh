#!/bin/bash

set -eu

DOTFILES_REPO="${1:-${HOME}/Projects/dotfiles}"
stow -R -d "${DOTFILES_REPO}" -t ~ dotfiles
