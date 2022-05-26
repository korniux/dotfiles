#!/usr/bin/env bash

for f in ~/.zshrc.d/*; do source $f; done
[[ -e "$HOME/.profile" ]] && source ~/.profile
[[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"