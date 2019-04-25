export ZSH=$HOME/.oh-my-zsh
export EDITOR=vim

ZSH_THEME="agnoster"
HIST_STAMPS="mm.dd.yyyy"
plugins=(git httpie zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Golang dependencies
[[ `uname` != "Darwin" ]] && export PATH=$PATH:/usr/local/go/bin
[[ "$(which go >> /dev/null; echo $?)" == 0 ]] && export GOPATH="$HOME/Development/golang"

# Aliases and logic for Darwin and other devices
if [[ `uname` == "Darwin" ]];
then
    test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"
    export PATH=$HOME/.local/bin:$PATH
    alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
    alias clipp="pbcopy"
    alias ttlish="sudo sysctl net.inet.ip.ttl=65"
else
    alias ttlish="sudo sysctl net.ipv4.ip_default_ttl=64"
fi

if [[ -d "$HOME/.nvm" ]];
then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

[[ "$(which thefuck >> /dev/null; echo $?)" == 0 ]] && eval $(thefuck --alias)

# Usefull git aliases
alias gitresovle="git commit -a --no-edit && git push"
alias gitprune="git branch -lq | sed -e 's/^.*master//' | xargs git branch -D"
