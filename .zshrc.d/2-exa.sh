#!/usr/bin/env bash

if [[ "$(which exa)" ]];
then
  alias ls='exa'
  alias la='ls -la'
  alias ll='ls -l'
else
  export LSCOLORS="Gxfxcxdxbxegedabagacad"
  alias lsa='ls -lah'
  alias la='ls -lah'
  alias ll='ls -lh'
fi
