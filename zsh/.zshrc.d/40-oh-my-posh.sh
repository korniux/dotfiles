#!/usr/bin/env zsh

if [[ -z "$(which oh-my-posh)" ]];
then
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
else 
  eval "$(oh-my-posh init zsh --config $HOME/.omp/theme.omp.json)"
fi