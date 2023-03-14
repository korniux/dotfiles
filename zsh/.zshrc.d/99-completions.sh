#!/usr/bin/env zsh

fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit && compinit
zinit cdreplay -q
