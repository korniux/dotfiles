export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
HIST_STAMPS="mm.dd.yyyy"
plugins=(git httpie zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [[ `uname` == "Darwin" ]];
then
    test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"
    alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
    export PATH=$HOME/.local/bin:$PATH
    alias clipp="pbcopy"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[[ "$(which thefuck >> /dev/null; echo $?)" == 0 ]] && eval $(thefuck --alias)

export EDITOR=vim
export GOPATH="${HOME}/Development/golang"

# TTL Change from greedy mobile providers
if [[ `uname` == "Darwin" ]];
then
    alias ttlish="sudo sysctl net.inet.ip.ttl=65"
else
    alias ttlish="sudo sysctl net.ipv4.ip_default_ttl=64"
fi

# Git after conflict resolution
alias gitresovle="git commit -a --no-edit && git push"

