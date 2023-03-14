#!/usr/bin/env zsh

_zinit_asdf_postclone() {
  echo"
asdf loaded but required plugins:

asdf plugin add direnv https://github.com/asdf-community/asdf-direnv.git
asdf direnv setup --shell zsh --version latest

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

"
}

zinit ice depth:1 \
    atinit:'export ASDF_DIR="${PWD}"' \
    src:'asdf.sh' \
    atclone:'_zinit_asdf_postclone'

zinit load asdf-vm/asdf

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
