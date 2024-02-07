#!/usr/bin/env zsh

zinit light-mode for zdharma-continuum/zinit-annex-{'readurl','bin-gem-node','patch-dl','rust'}

zinit snippet OMZL::git.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZP::git

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit cdreplay -q