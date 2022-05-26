#/usr/bin/env zsh

setopt hist_ignore_space
setopt promptsubst

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

[[ "$(which vim)" ]] && export EDITOR=$(which vim)
[[ -d "$HOME/.local/bin" ]] && export PATH=$PATH:$HOME/.local/bin
