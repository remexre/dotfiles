export EDITOR="nvim"
export GOPATH="${HOME}/go"
export GPG_TTY="$(tty)"
export OFTLISP_HOME="${HOME}/oftlisp"

export NPM_PACKAGES="${HOME}/.npm-packages"
export MANPATH="${NPM_PACKAGES}/share/man:$(manpath)"
export PATH="${NPM_PACKAGES}/bin:${HOME}/bin:${HOME}/.cargo/bin:${HOME}/.local/bin:${HOME}/.yarn/bin:${GOPATH}/bin:/usr/local/bin:/usr/bin:/bin"
export RUST_SRC_PATH="${HOME}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
export TERMINAL="urxvt"

if [[ -z "${DISPLAY}" ]] && [[ "$(tty)" = /dev/tty1 ]]; then
	# Start the keyring.
	eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
	export GNOME_KEYRING_CONTROL
	export SSH_AUTH_SOCK

	# Start gestures support.
	libinput-gestures-setup start

	# Start the WM.
	exec sway
fi
