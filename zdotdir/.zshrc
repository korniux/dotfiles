#!/usr/bin/env zsh

# Check if ZDOTDIR is set, and exit with status 2 if not.
[[ ! $ZDOTDIR ]] && exit 2

# Source the .zstyles file if it exists in ZDOTDIR.
[[ -e ${ZDOTDIR}/.zstyles ]] && source ${ZDOTDIR}/.zstyles

# Check if the .antidote directory does not exist in ZDOTDIR.
if [[ ! -d ${ZDOTDIR}/.antidote ]]; then
  # Clone the antidote repository into the .antidote directory.
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR}/.antidote
fi

# Source the antidote.zsh file from the antidote installation directory.
source ${ZDOTDIR}/.antidote/antidote.zsh

# Load plugins and configurations using antidote.
antidote load

# Loop through all .zsh files in the .zshrc.d directory within ZDOTDIR.
for _rc in ${ZDOTDIR}/.zshrc.d/*.zsh; do
  # Ignore files that start with a tilde (~).
  if [[ $_rc:t != '~'* ]]; then
    # Source each file that does not start with a tilde.
    source "$_rc"
  fi
done

# Unset the _rc variable to clean up.
unset _rc
