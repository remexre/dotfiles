export EDITOR="nvim"
export GOPATH="${HOME}/go"
export GPG_TTY="$(tty)"
export OFTLISP_HOME="${HOME}/oftlisp"

export NPM_PACKAGES="${HOME}/.npm-packages"
export MANPATH="${NPM_PACKAGES}/share/man:$(manpath)"
export PATH="${NPM_PACKAGES}/bin:${HOME}/bin:${HOME}/.cargo/bin:${HOME}/.local/bin:${HOME}/.gem/ruby/2.4.0/bin:${HOME}/.yarn/bin:${GOPATH}/bin:${PATH}"
export RUST_SRC_PATH="${HOME}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
export TERMINAL="urxvt"
export WINIT_UNIX_BACKEND="x11"

if [[ -z "${DISPLAY}" ]] && [[ "$(tty)" = /dev/tty1 ]]; then
	# Start the keyring.
	eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
	export GNOME_KEYRING_CONTROL
	export SSH_AUTH_SOCK

	# Map the Caps Lock to Super.
	# setxkbmap -option caps:super
	export XKB_DEFAULT_OPTIONS="caps:super"

	# Start the WM.
	exec sway -d 2> /tmp/sway-${$}.log
fi

[[ -e "${HOME}/.opam/opam-init/init.zsh" ]] && source "${HOME}/.opam/opam-init/init.zsh" >/dev/null 2>/dev/null || true
