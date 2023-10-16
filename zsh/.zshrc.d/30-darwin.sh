#!/usr/bin/env zsh

if [[ `uname | awk '{print tolower($0)}'` == 'darwin' ]]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
  [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
  export PATH="$PATH:/usr/local/sbin"
fi
