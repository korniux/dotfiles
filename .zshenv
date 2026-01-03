export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export TERM=xterm-256color

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Development}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

[[ -d "$HOME/.local/bin" ]] && export PATH=$PATH:$HOME/.local/bin
[[ -a "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ "$(which nvim)" ]] && export EDITOR=$(which nvim)
[[ -d "$ZSH_CACHE_DIR/completions" ]] && fpath=("$ZSH_COMPLETIONS_DIR" $fpath)

typeset -gU path fpath
