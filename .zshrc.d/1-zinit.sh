#!/usr/bin/env zsh
#set -x

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

setopt promptsubst

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
export NVM_LAZY_LOAD=true
zinit light lukechilds/zsh-nvm

zinit snippet OMZP::command-not-found
zinit ice atload"unalias grv"
zinit snippet OMZP::git
zinit snippet OMZL::git.zsh
zinit snippet OMZP::colored-man-pages

zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZT::agnoster

### Zinit finish sequence
autoload -Uz compinit
compinit
zinit cdreplay -q
