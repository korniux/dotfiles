#!/usr/bin/env zsh

# bare minimum for zsh -l

if [[ -d "$HOME/.zshrc.d" ]]; then
  zshrcd="$HOME/.zshrc.d"
  source "$zshrcd/00-env.sh"
  source "$zshrcd/01-asdf.sh"
  source "$zshrcd/02-macos.sh"
  source "$zshrcd/10-zint.sh"
fi

