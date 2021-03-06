# zplug
[[ ! -d "$HOME/.zplug" ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "lukechilds/zsh-nvm"
zplug "plugins/git", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "themes/agnoster", from:oh-my-zsh, as:theme
zplug "plugins/command-not-found", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "[zplug] Install plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# paths and configs
setopt hist_ignore_space
[[ -e "$HOME/.profile" ]] && source $HOME/.profile
[[ -d "$HOME/.local/bin" ]] && export PATH=$PATH:$HOME/.local/bin

# aliases and logic for Darwin and other devices
if [[ `uname` == "Darwin" ]];
then
    zplug "tysonwolker/iterm-tab-colors"
    [[ -e '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' ]] && alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"
    export PATH="/usr/local/sbin:$PATH"
    alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
    alias ttlish="sudo sysctl net.inet.ip.ttl=65"
else
    [[ -d "/usr/local/go" ]] && export PATH=$PATH:/usr/local/go/bin
    [[ "$(which go >> /dev/null; echo $?)" == 0 ]] && export GOPATH="$HOME/Development/golang"
    alias ttlish="sudo sysctl net.ipv4.ip_default_ttl=65"
fi

if [[ "$(which exa >> /dev/null; echo $?)" == 0 ]];
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

[[ "$(which thefuck >> /dev/null; echo $?)" == 0 ]] && eval $(thefuck --alias)

# git aliases
alias gitresovle="git commit -a --no-edit && git push"
alias gitprune="git branch -lq | sed -e 's/^.*master//' | xargs git branch -D"
