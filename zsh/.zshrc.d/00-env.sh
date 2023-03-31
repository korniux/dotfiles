#!/usr/bin/env zsh

setopt hist_ignore_space
setopt promptsubst

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

[[ -a "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -d "$HOME/.local/bin" ]] && export PATH=$PATH:$HOME/.local/bin

[[ "$(which nvim)" ]] && export EDITOR=$(which nvim)
