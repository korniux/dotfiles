# zplug
[[ ! -d "$HOME/.zplug" ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-nvm"
zplug "plugins/git", from:oh-my-zsh
zplug "themes/agnoster", from:oh-my-zsh, as:theme
zplug "plugins/command-not-found", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "[zplug] Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# paths and configs
setopt hist_ignore_space
[[ -e "$HOME/.profile" ]] && source $HOME/.profile
[[ -d "$HOME/.local/bin" ]] && export PATH=$PATH:$HOME/.local/bin

# aliases and logic for Darwin and other devices
[[ "$(which exa >> /dev/null; echo $?)" == 0  ]] && alias -g ls='exa'
if [[ `uname` == "Darwin" ]];
then
    [[ -e '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' ]] && alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    [[ -e '/Applications/Visual Studio Code.app/Contents/Resources/app/bin' ]] && alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin'
    [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
    export PATH="/usr/local/sbin:$PATH"
    alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
    alias cclip="pbcopy"
    alias ttlish="sudo sysctl net.inet.ip.ttl=65"
else
    [[ -d "/usr/local/go" ]] && export PATH=$PATH:/usr/local/go/bin
    [[ "$(which go >> /dev/null; echo $?)" == 0 ]] && export GOPATH="$HOME/Development/golang"
    alias cclip="xclip -selection clipboard"
    alias ttlish="sudo sysctl net.ipv4.ip_default_ttl=65"
fi

alias lsa='ls -lah'
alias la='ls -lah'
alias ll='ls -lh'

[[ "$(which thefuck >> /dev/null; echo $?)" == 0 ]] && eval $(thefuck --alias)

# git aliases
alias gitresovle="git commit -a --no-edit && git push"
alias gitprune="git branch -lq | sed -e 's/^.*master//' | xargs git branch -D"
