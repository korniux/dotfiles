#!/usr/bin/env zsh

SCRIPT_PATH="${0:A:h}"

if [[ "$(which asdf)" ]];
then
  [[ ! -e "$SCRIPT_PATH/cache/asdf.sh" ]] && curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/asdf/asdf.plugin.zsh > $SCRIPT_PATH/cache/asdf.sh
  source $SCRIPT_PATH/cache/asdf.sh
else
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi
