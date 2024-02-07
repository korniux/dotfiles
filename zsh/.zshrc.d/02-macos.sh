#!/usr/bin/env zsh

if [[ `uname | awk '{print tolower($0)}'` == 'darwin' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="$PATH:/usr/local/sbin"
  [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
fi
