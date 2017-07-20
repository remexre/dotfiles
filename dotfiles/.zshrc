export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="ys"

plugins=(cargo common-aliases compleat dircycle git git-extras npm pip python redis-cli screen sudo tmux)

command_exists() {
	command -v ${1} >/dev/null;
};
retry() {
	($@) || retry $@
};

command_exists nvim && export EDITOR="nvim";
export GOPATH="${HOME}/go";
export PATH="${HOME}/bin:${HOME}/.cargo/bin:${HOME}/.local/bin:${GOPATH}/bin:/usr/local/bin:/usr/bin:/bin";
export RUST_SRC_PATH="${HOME}/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src";

if [[ -d ~/.zfunc ]]; then
	fpath+=~/.zfunc
fi;

source $ZSH/oh-my-zsh.sh

command_exists pandoc && command_exists xclip && alias copy-as-markdown="(pandoc | xclip -selection clipboard -t text/html)"
command_exists curl && alias paste.rs="curl --data-binary @- https://paste.rs/";
command_exists docker && alias afl.rs="docker run --rm -v $(pwd):/source -it corey/afl.rs sh -c 'cargo build --features fuzz'"
command_exists hexdump && alias hd="hexdump -C";
command_exists nvim && alias vim="nvim"
command_exists pygmentize && alias c="pygmentize -g";
command_exists rg && alias findtodo="rg TODO";
command_exists thefuck && eval $(thefuck --alias)
command_exists trash && alias rm="trash";

if [[ -e ${HOME}/.opam/opam-init/init.zsh ]]; then
	. ${HOME}/.opam/opam-init/init.zsh >/dev/null 2>/dev/null || true
fi;

command_exists ruby && export PATH="$(ruby -rubygems -e "puts Gem.user_dir")/bin:${PATH}";

command_exists npm && {
	export NPM_PACKAGES="${HOME}/.npm-packages";
	export PATH="${NPM_PACKAGES}/bin:${PATH}";
	# export MANPATH="${NPM_PACKAGES}/share/man:$(manpath)";
};

export GPG_TTY=$(tty);

codi() {
	local syntax="${1:-python}";
	shift;
	nvim -c \
		"let g:startify_disable_at_vimenter = 1 |\
		 set bt=nofile ls=0 noru nonu nornu |\
		 hi ColorColumn ctermbg=NONE |\
		 hi VertSplit ctermbg=NONE |\
		 hi NonText ctermfg=0 |\
		 Codi $syntax" "$@";
};

[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# added by travis gem
[ -f /home/nathan/.travis/travis.sh ] && source /home/nathan/.travis/travis.sh
