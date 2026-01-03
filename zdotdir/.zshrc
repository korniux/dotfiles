#!/usr/bin/env zsh

[[ ! $ZDOTDIR ]] && exit 2

[[ -e ${ZDOTDIR}/.zstyles ]] && source ${ZDOTDIR}/.zstyles

if [[ ! -d ${ZDOTDIR}/.antidote ]]; then
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR}/.antidote
fi

antidote_path=${ZDOTDIR}/.antidote

source $antidote_path/antidote.zsh
antidote load

for _rc in ${ZDOTDIR}/.zshrc.d/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc
