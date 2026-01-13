# Set locale settings for character encoding and collation
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set GPG_TTY to the current terminal device
export GPG_TTY=$(tty)

# Set the terminal type to xterm-256color
export TERM=xterm-256color

# Set XDG base directories if they are not already set
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_PROJECTS_DIR=${XDG_PROJECTS_DIR:-$HOME/Development}

# Set ZDOTDIR to the zsh configuration directory
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Add local bin directory to PATH if it exists
[[ -d "$HOME/.local/bin" ]] && export PATH=$PATH:$HOME/.local/bin

# Source cargo environment variables if they exist
[[ -a "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Set EDITOR to nvim if it is installed
[[ "$(which nvim)" ]] && export EDITOR=$(which nvim)

# Add zsh completions directory to fpath if it exists
[[ -d "$ZSH_CACHE_DIR/completions" ]] && fpath=("$ZSH_COMPLETIONS_DIR" $fpath)

# Ensure that path and fpath are unique arrays
typeset -gU path fpath
