export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="ys"

plugins=(cargo compleat dircycle git git-extras npm pip python redis-cli screen sudo tmux)

command_exists() {
	command -v ${1} >/dev/null;
};
retry() {
	($@) || retry $@
};

command_exists nvim && export EDITOR="nvim";

if [[ -d ~/.zfunc ]]; then
	fpath+=~/.zfunc
fi;

source $ZSH/oh-my-zsh.sh

command_exists pandoc && command_exists xclip && alias copy-as-markdown="(pandoc | xclip -selection clipboard -t text/html)"
command_exists curl && alias paste.rs="curl --data-binary @- https://paste.rs/";
command_exists docker && alias afl.rs="docker run --rm -v $(pwd):/source -it corey/afl.rs sh -c 'cargo build --features fuzz'"
command_exists exa && alias ls="exa";
command_exists hexdump && alias hd="hexdump -C";
command_exists nvim && alias vim="nvim"
command_exists pygmentize && alias c="pygmentize -g";
command_exists rg && alias findtodo="rg TODO";
command_exists thefuck && eval $(thefuck --alias)
command_exists trash && alias rm="trash";

alias la="ls -la";
alias lh="ls -lh";
alias ll="ls -l";

command_exists npm && {
};

export GPG_TTY=$(tty);

[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
