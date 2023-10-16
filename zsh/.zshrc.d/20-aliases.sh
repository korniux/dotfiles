#!/usr/bin/env zsh

[[ "$(which nvim)" ]] && alias vim="$(which nvim)"

if [[ "$(which eza)" ]];
then
  alias ls='eza'
  alias la='ls -la'
  alias ll='ls -l'
else
  export LSCOLORS="Gxfxcxdxbxegedabagacad"
  alias lsa='ls -lah'
  alias la='ls -lah'
  alias ll='ls -lh'
fi
