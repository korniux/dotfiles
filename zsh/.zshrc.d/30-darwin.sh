#!/usr/bin/env zsh

if [[ `uname | awk '{print tolower($0)}'` == 'darwin' ]]; then
  [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
  export PATH="$PATH:/usr/local/sbin"
fi
