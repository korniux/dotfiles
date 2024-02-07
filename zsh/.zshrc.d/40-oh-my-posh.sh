#!/usr/bin/env zsh

if [[ "$(which oh-my-posh)" ]];
then
  eval "$(oh-my-posh init zsh --config $HOME/.omp/theme.omp.json)"
else 
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
fi